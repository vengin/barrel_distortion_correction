#include "brl_corr_hls.h"

// Integer square root using binary search
coord_t int_sqrt(calc_t x) {
  #pragma HLS INLINE

  if (x <= 0) return 0;
  if (x == 1) return 1;

  coord_t result = 0;
  coord_t bit = 1 << 14; // Adjust for coordinate range

  while (bit > x) {
    bit >>= 2;
  }

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

// Bilinear interpolation
pixel_t bilinear_interpolate(LineBuffer &line_buf, coord_t x_scaled, coord_t y_scaled, int current_line) {
  #pragma HLS INLINE

  // Convert from scaled coordinates to pixel coordinates
  int x = x_scaled >> 8;  // Divide by 256
  int y = y_scaled >> 8;

  // Clamp x and y to valid range for pixel access
  // This ensures that even if x_scaled or y_scaled map outside, we take the edge pixel
  int x0 = (x < 0) ? 0 : (x >= IMG_WIDTH - 1 ? IMG_WIDTH - 1 : x);
  int y0 = (y < 0) ? 0 : (y >= IMG_HEIGHT - 1 ? IMG_HEIGHT - 1 : y);

  int x1 = x0 + 1;
  int y1 = y0 + 1;

  // Ensure x1 and y1 do not exceed image bounds
  x1 = (x1 >= IMG_WIDTH) ? IMG_WIDTH - 1 : x1;
  y1 = (y1 >= IMG_HEIGHT) ? IMG_HEIGHT - 1 : y1;

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
  // Get fractional parts (0-255 range)
  int fx = x_scaled & 0xFF;  // x_scaled % 256
  int fy = y_scaled & 0xFF;  // y_scaled % 256

  // Integer bilinear interpolation
  int interp_x0 = (p00 * (256 - fx) + p01 * fx) >> 8;
  int interp_x1 = (p10 * (256 - fx) + p11 * fx) >> 8;
  int result = (interp_x0 * (256 - fy) + interp_x1 * fy) >> 8;

  return (pixel_t)result;
 // Return top-left pixel to disable interpolation
#else
  return p00; // Return top-left pixel to disable interpolation
#endif
}

// Barrel distortion correction using integer arithmetic
void calculate_distortion(coord_t x_d, coord_t y_d, coord_t &x_u_scaled, coord_t &y_u_scaled) {
  #pragma HLS INLINE

  // Translate to center
  coord_t dx = x_d - CENTER_X;
  coord_t dy = y_d - CENTER_Y;

  // Calculate radius squared
  calc_t r_squared = dx * dx + dy * dy;
  coord_t r = int_sqrt(r_squared);

  // Barrel distortion using integer arithmetic
  calc_t r2 = r * r;
#define K1_ONLY
#ifdef K1_ONLY
  // For K1 only, we can skip higher order terms, use only r^2, i.e. istortion = 1 + k1*r^2
  // Calculate distortion factor (scaled by 256)
  calc_t distortion_scaled = SCALE_FACTOR + (K1_SCALED * (r2 >> DISTORTION_SCALE_SHIFT));

#else
  // distortion = 1 + k1*r^2 + k2*r^4 + k3*r^6
  calc_t r4 = (r2 >> 8) * (r2 >> 8);  // Prevent overflow
  calc_t r6 = (r4 >> 8) * (r2 >> 8);

  // Calculate distortion factor (scaled by 256)
  calc_t distortion_scaled = SCALE_FACTOR +
                            (K1_SCALED * (r2 >> DISTORTION_SCALE_SHIFT)) +
                            (K2_SCALED * (r4 >> (2 * DISTORTION_SCALE_SHIFT))) +
                            (K3_SCALED * (r6 >> (3 * DISTORTION_SCALE_SHIFT)));
#endif

  // Apply distortion
  if (r > 1) {
    x_u_scaled = (CENTER_X << 8) + (dx * distortion_scaled);
    y_u_scaled = (CENTER_Y << 8) + (dy * distortion_scaled);
  } else {
    x_u_scaled = x_d << 8;
    y_u_scaled = y_d << 8;
  }
}

// Simplified barrel correction function without streams
void barrel_correction_simple(
  pixel_t input_image[IMG_HEIGHT][IMG_WIDTH],
  pixel_t output_image[IMG_HEIGHT][IMG_WIDTH]
) {
  #pragma HLS INTERFACE m_axi port=input_image offset=slave bundle=gmem0
  #pragma HLS INTERFACE m_axi port=output_image offset=slave bundle=gmem1
  #pragma HLS INTERFACE s_axilite port=return

  LineBuffer line_buf;

  // Pre-fill the line buffer with the first LINE_BUFFER_SIZE lines
  for (int y = 0; y < LINE_BUFFER_SIZE; y++) {
    #pragma HLS PIPELINE II=1
    for (int x = 0; x < IMG_WIDTH; x++) {
      line_buf.write_pixel(x, input_image[y][x]);
    }
    line_buf.shift_lines();
  }

  // Process output pixels for each line
  for (int output_y = 0; output_y < IMG_HEIGHT; output_y++) {
    #pragma HLS PIPELINE II=1

    for (int x = 0; x < IMG_WIDTH; x++) {
      // Calculate source coordinates
      coord_t x_src_scaled, y_src_scaled;
      calculate_distortion(x, output_y, x_src_scaled, y_src_scaled);

      // Interpolate pixel value
      pixel_t corrected_pixel = bilinear_interpolate(line_buf, x_src_scaled, y_src_scaled, output_y);

      output_image[output_y][x] = corrected_pixel;
    }

    // After processing output_y, shift the line buffer and load the next input line
    // This is for the next iteration of output_y
    if (output_y + LINE_BUFFER_SIZE < IMG_HEIGHT) {
      for (int x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1
        line_buf.write_pixel(x, input_image[output_y + LINE_BUFFER_SIZE][x]);
      }
    }
    line_buf.shift_lines(); // Shift for the next iteration
  }
}
