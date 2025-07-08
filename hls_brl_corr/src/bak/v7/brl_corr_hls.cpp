// brl_corr_hls.cpp (Revised for Barrel Correction)

#include "brl_corr_hls.h"

// Integer square root using binary search (simplified for smaller range)
coord_t int_sqrt(calc_t x) {
  #pragma HLS INLINE

  if (x <= 0) return 0;
  if (x == 1) return 1;

  coord_t result = 0;
  // Maximum r_squared for 128x100 is 6596. sqrt(6596) approx 81.
  // We need to start bit search from a power of 4 larger than max_sqrt^2
  // Max sqrt is ~81, so 81^2 = 6561. Smallest bit value for 6561 is 2^12.
  // The algorithm uses bit = 1 << (2*n). Max n is 6 for 2^12=4096.
  // So bit = 1 << 12 is a good starting point for r_squared up to 6596.
  // But result is coord_t (ap_int<16>), and it should hold the integer part of the square root.
  // The square root of `calc_t` (r_squared) is `coord_t` `r`. Max `r` is `81`.
  // So `bit` should be `coord_t` and `1 << 6` is sufficient (since `2^6=64`, `2^7=128`).
  coord_t bit = 1 << 6;

  // Find initial bit that is largest power of 4 less than or equal to x
  // This loop makes the sqrt function generic for varying input ranges.
  while (bit > x) { // This loop moves 'bit' down if 'x' is small
    bit >>= 2;
  }
  // If x is larger than initial bit guess, shift bit up (only if initial bit is very conservative)
  // For fixed max input, just initialize bit to max possible power of 4.
  // No need for this loop if bit is properly chosen for input range.

  // Standard integer sqrt algorithm
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
pixel_t bilinear_interpolate(LineBuffer &line_buf, coord_t x_scaled, coord_t y_scaled, int current_output_y) {
  #pragma HLS INLINE

  // Convert from scaled coordinates to pixel coordinates (integer part)
  int x0 = x_scaled >> 8;
  int y0 = y_scaled >> 8;

  // Get fractional parts (0-255 range)
  int fx = x_scaled & 0xFF;
  int fy = y_scaled & 0xFF;

  // Clamp x0 and y0 to valid range for pixel access in the input image.
  // These are the *source* coordinates, so they must be within input image bounds.
  // If they fall outside, we return black.
  if (x0 < 0 || x0 >= IMG_WIDTH - 1 || y0 < 0 || y0 >= IMG_HEIGHT - 1) {
      return 0; // Out of input image bounds, return black
  }

  // x1 and y1 are the next pixel, ensure they are also within bounds
  int x1 = x0 + 1;
  int y1 = y0 + 1;
  // If x0/y0 is already IMG_WIDTH-1/IMG_HEIGHT-1, then x1/y1 will be out of bounds.
  // The read_pixel function for line buffer will handle this.
  // But more importantly, the `line_offset` should be within the line buffer's range.

  // Calculate line buffer offsets (assuming line_buf[0] is oldest, line_buf[N-1] is newest)
  // current_output_y is the row being processed in the output image.
  // The line buffer holds lines `current_output_y - (LINE_BUFFER_SIZE-1)` through `current_output_y`.
  // So, line_offset for a pixel at `y0` should be `y0 - (current_output_y - (LINE_BUFFER_SIZE-1))`.
  // Simplified: `line_offset = y0 - current_output_y + (LINE_BUFFER_SIZE-1)`.
  // Example: if current_output_y=0, buffer has lines 0,1,2. If y0=0, offset=2. If y0=1, offset=3 (error)
  // This `line_buffer` model is tricky with `current_output_y`.

  // Let's use simpler line_offset for the new LineBuffer logic:
  // Line buffer contains lines `current_output_y` (at index `LINE_BUFFER_SIZE-1`),
  // `current_output_y-1` (at index `LINE_BUFFER_SIZE-2`), etc.
  // So, if we need `y0` (from input image) and `current_output_y` is the current output row,
  // The required `line_offset` into the buffer is `LINE_BUFFER_SIZE - 1 - (current_output_y - y0)`.
  int line_offset_0 = LINE_BUFFER_SIZE - 1 - (current_output_y - y0);
  int line_offset_1 = LINE_BUFFER_SIZE - 1 - (current_output_y - y1);


  // Get four neighboring pixels. `read_pixel` includes bounds checks.
  pixel_t p00 = line_buf.read_pixel(line_offset_0, x0);
  pixel_t p01 = line_buf.read_pixel(line_offset_0, x1);
  pixel_t p10 = line_buf.read_pixel(line_offset_1, x0);
  pixel_t p11 = line_buf.read_pixel(line_offset_1, x1);

  // Integer bilinear interpolation (pixel values 0-255)
  // Each intermediate sum is scaled by SCALE_FACTOR (256).
  calc_t interp_x0 = (calc_t)p00 * (SCALE_FACTOR - fx) + (calc_t)p01 * fx;
  calc_t interp_x1 = (calc_t)p10 * (SCALE_FACTOR - fx) + (calc_t)p11 * fx;

  calc_t result_scaled = (interp_x0 * (SCALE_FACTOR - fy) + interp_x1 * fy);
  calc_t result = result_scaled >> (8 + 8); // Divide by 256 * 256, or by SCALE_FACTOR * SCALE_FACTOR

  // Clamp final result to 0-255 range
  if (result < 0) result = 0;
  if (result > 255) result = 255;

  return (pixel_t)result;
}

// Barrel distortion correction using integer arithmetic
// x_d_pixel, y_d_pixel are the current pixel coordinates in the OUTPUT image (int, not scaled)
void calculate_distortion(int x_d_pixel, int y_d_pixel, coord_t &x_u_scaled, coord_t &y_u_scaled) {
  #pragma HLS INLINE

  // Translate output pixel coordinates to center
  calc_t dx_d = (calc_t)x_d_pixel - CENTER_X;
  calc_t dy_d = (calc_t)y_d_pixel - CENTER_Y;

  // Calculate radius squared of the *output* pixel from the center
  calc_t r_d_squared = dx_d * dx_d + dy_d * dy_d; // Max 6596 for 128x100

  // Calculate correction factor based on `r_source = r_destination * (1.0 - k_correction * r_destination_norm^2)`
  // r_d_squared_norm = (r_d_squared * SCALE_FACTOR) / MAX_R_SQUARED_PIXEL
  // For 128x100, MAX_R_SQUARED_PIXEL = 6596.
  // r_d_squared_norm is between 0 and SCALE_FACTOR (256).
  calc_t r_d_squared_norm = (r_d_squared * SCALE_FACTOR) / ( (calc_t)(CENTER_X*CENTER_X) + (calc_t)(CENTER_Y*CENTER_Y) );
  // Clamp to max SCALE_FACTOR to avoid issues if radius is larger than expected (e.g. for corners)
  if (r_d_squared_norm > SCALE_FACTOR) r_d_squared_norm = SCALE_FACTOR;

  // Calculate correction factor: (1.0 - K1_CORRECTION_SCALED * r_d_squared_norm / SCALE_FACTOR) scaled by SCALE_FACTOR
  // So: SCALE_FACTOR - (K1_CORRECTION_SCALED * r_d_squared_norm / SCALE_FACTOR)
  // This needs careful integer multiplication and division.
  // Let's do: (SCALE_FACTOR*SCALE_FACTOR - K1_CORRECTION_SCALED * r_d_squared_norm) / SCALE_FACTOR
  // K1_CORRECTION_SCALED * r_d_squared_norm: Max 16 * 256 = 4096.
  // (SCALE_FACTOR*SCALE_FACTOR) - (K1_CORRECTION_SCALED * r_d_squared_norm):
  // 256*256 - 4096 = 65536 - 4096 = 61440. Fits in calc_t (32-bit int).

  calc_t correction_numerator_scaled = (calc_t)SCALE_FACTOR * SCALE_FACTOR - (calc_t)K1_CORRECTION_SCALED * r_d_squared_norm;

  // Clamp correction factor to ensure it's not negative (prevents image inversion)
  if (correction_numerator_scaled < 0) correction_numerator_scaled = 0;

  // Apply correction: x_u = center_x + (dx_d * correction_factor_scaled) / SCALE_FACTOR
  // x_u = center_x + (dx_d * (correction_numerator_scaled / SCALE_FACTOR)) / SCALE_FACTOR
  // x_u = center_x + (dx_d * correction_numerator_scaled) / (SCALE_FACTOR * SCALE_FACTOR)
  // Resulting x_u and y_u are in pixel coordinates, scaled by 256 (8-bit fractional part).

  // dx_d (max 64) * correction_numerator_scaled (max 65536) = 4,194,304. Fits in calc_t.
  // Division by (SCALE_FACTOR * SCALE_FACTOR) = 65536.

  x_u_scaled = (CENTER_X << 8) + ((dx_d * correction_numerator_scaled) >> 16); // Div by 256*256 = 2^16
  y_u_scaled = (CENTER_Y << 8) + ((dy_d * correction_numerator_scaled) >> 16); // Div by 256*256 = 2^16
}

// Simplified barrel correction function (unchanged, just copy-paste)
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
    // No shift_lines here, as line_buf.write_pixel writes to the fixed newest line (LINE_BUFFER_SIZE-1)
    // The main loop's shift_lines takes care of the internal shifting.
  }

  // Process output pixels for each line
  for (int output_y = 0; output_y < IMG_HEIGHT; output_y++) {
    #pragma HLS PIPELINE II=1 // Pipeline outer loop for throughput

    // For each output_y, shift in the new line data (if not the last line)
    // and then process all pixels in that line.
    if (output_y + LINE_BUFFER_SIZE -1 < IMG_HEIGHT) { // Check if there's a next line to load
      line_buf.shift_lines(); // Shift old data out, make room for new line at LINE_BUFFER_SIZE-1
      for (int x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1 // Pipeline inner loop for pixel throughput
        // Load the (current_output_y + LINE_BUFFER_SIZE - 1) line from input_image into the newest line buffer slot
        line_buf.write_pixel(x, input_image[output_y + LINE_BUFFER_SIZE - 1][x]);
      }
    }


    // Process all pixels in the current output_y line
    for (int x = 0; x < IMG_WIDTH; x++) {
      #pragma HLS PIPELINE II=1 // Ensure pixel processing is 1 cycle

      // Calculate source coordinates in the distorted input image for the current output pixel (x, output_y)
      coord_t x_src_scaled, y_src_scaled;
      calculate_distortion(x, output_y, x_src_scaled, y_src_scaled); // x, output_y are output pixel coords

      // Interpolate pixel value from the line buffer
      pixel_t corrected_pixel = bilinear_interpolate(line_buf, x_src_scaled, y_src_scaled, output_y);

      output_image[output_y][x] = corrected_pixel;
    }
  }
}