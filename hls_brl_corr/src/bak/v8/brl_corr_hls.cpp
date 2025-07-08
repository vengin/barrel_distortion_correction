#include "brl_corr_hls.h"

// This function is not used in the final algorithm but can be kept.
coord_t int_sqrt(calc_t x) {
  #pragma HLS INLINE
  if (x <= 0) return 0;
  if (x == 1) return 1;
  coord_t result = 0;
  coord_t bit = 1 << 14;
  while (bit > x) { bit >>= 2; }
  while (bit != 0) {
    if (x >= result + bit) {
      x -= result + bit;
      result = (result >> 1) + bit;
    } else {
      result >>= 1;
    }
    bit >>= 2;
  }
  return result;
}

// --- FIX: Change scaled coordinate types from coord_t to calc_t ---
pixel_t bilinear_interpolate(LineBuffer &line_buf, calc_t x_scaled, calc_t y_scaled, int current_line) {
  #pragma HLS INLINE

  // Convert from scaled coordinates (8 fractional bits) to pixel coordinates
  int x = x_scaled >> 8;
  int y = y_scaled >> 8;

  // Get fractional parts
  int fx = x_scaled & 0xFF;
  int fy = y_scaled & 0xFF;

  // Clamp coordinates to ensure x0, y0, x1, y1 are valid for buffer access.
  // Slightly adjusted clamping to prevent reading past IMG_WIDTH-1 / IMG_HEIGHT-1
  int x0 = (x < 0) ? 0 : ((x >= IMG_WIDTH - 1) ? IMG_WIDTH - 2 : x);
  int y0 = (y < 0) ? 0 : ((y >= IMG_HEIGHT - 1) ? IMG_HEIGHT - 2 : y);

  int x1 = x0 + 1;
  int y1 = y0 + 1;

  // Calculate line buffer offsets
  int line_offset_0 = y0 - current_line + 1;
  int line_offset_1 = y1 - current_line + 1;

  // Get four neighboring pixels
  pixel_t p00 = line_buf.read_pixel(line_offset_0, x0);
  pixel_t p01 = line_buf.read_pixel(line_offset_0, x1);
  pixel_t p10 = line_buf.read_pixel(line_offset_1, x0);
  pixel_t p11 = line_buf.read_pixel(line_offset_1, x1);

#define ENABLE_INTERPOLATION
#ifdef ENABLE_INTERPOLATION
  calc_t interp_x0 = (p00 * (256 - fx) + p01 * fx);
  calc_t interp_x1 = (p10 * (256 - fx) + p11 * fx);
  calc_t result = (interp_x0 * (256 - fy) + interp_x1 * fy) >> 16;
  return (pixel_t)result;
#else
  return p00;
#endif
}

// --- FIX: Change scaled coordinate reference types from coord_t to calc_t ---
void calculate_distortion(coord_t x_d, coord_t y_d, calc_t &x_u_scaled, calc_t &y_u_scaled) {
  #pragma HLS INLINE

  coord_t dx = x_d - CENTER_X;
  coord_t dy = y_d - CENTER_Y;
  
  calc_t r_squared = (calc_t)dx * dx + (calc_t)dy * dy;

  calc_t distortion_scaled = SCALE_FACTOR - (K1_SCALED * (r_squared >> DISTORTION_SCALE_SHIFT));

  // The intermediate product (dx * distortion_scaled) can exceed a 16-bit short.
  // By using calc_t (int), we prevent overflow and preserve the fixed-point result.
  x_u_scaled = ((calc_t)CENTER_X << 8) + ((calc_t)dx * distortion_scaled);
  y_u_scaled = ((calc_t)CENTER_Y << 8) + ((calc_t)dy * distortion_scaled);
}


void barrel_correction_simple(
  pixel_t input_image[IMG_HEIGHT][IMG_WIDTH],
  pixel_t output_image[IMG_HEIGHT][IMG_WIDTH]
) {
  #pragma HLS INTERFACE m_axi port=input_image offset=slave bundle=gmem0
  #pragma HLS INTERFACE m_axi port=output_image offset=slave bundle=gmem1
  #pragma HLS INTERFACE s_axilite port=return

  LineBuffer line_buf;

  // Loop to pre-fill a part of the line buffer.
  for (int y = 0; y < LINE_BUFFER_SIZE -1; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      #pragma HLS PIPELINE II=1
      line_buf.write_pixel(x, input_image[y][x]);
    }
    line_buf.shift_lines();
  }

  // Process image row by row
  for (int y_out = 0; y_out < IMG_HEIGHT; y_out++) {

    // Load next row into the buffer a little ahead of time.
    int y_in = y_out + LINE_BUFFER_SIZE -1;
    if (y_in < IMG_HEIGHT) {
      for (int x_in = 0; x_in < IMG_WIDTH; x_in++) {
        #pragma HLS PIPELINE II=1
        line_buf.write_pixel(x_in, input_image[y_in][x_in]);
      }
    }
    
    // Process the current output row
    for (int x_out = 0; x_out < IMG_WIDTH; x_out++) {
      #pragma HLS PIPELINE II=1

      // --- FIX: Declare scaled coordinates as calc_t to prevent truncation ---
      calc_t x_src_scaled, y_src_scaled;
      calculate_distortion(x_out, y_out, x_src_scaled, y_src_scaled);
      
      pixel_t corrected_pixel = bilinear_interpolate(line_buf, x_src_scaled, y_src_scaled, y_out);

      output_image[y_out][x_out] = corrected_pixel;
    }

    line_buf.shift_lines();
  }
}