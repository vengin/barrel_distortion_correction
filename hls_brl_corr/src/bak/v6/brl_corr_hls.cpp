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

  // Get fractional parts (0-255 range)
  int fx = x_scaled & 0xFF;  // x_scaled % 256
  int fy = y_scaled & 0xFF;  // y_scaled % 256

  // Boundary checks for nearest neighbor (no interpolation)
  if (x >= IMG_WIDTH || y >= IMG_HEIGHT || x < 0 || y < 0) {
    return 0;
  }

  // Calculate line buffer offset for nearest neighbor
  // 'y' is the target input image row (y_d), which is output_y when distortion is bypassed.
  // 'current_line' is the output image row being processed (output_y).
  // LineBuffer.write_idx points to the next line to be written.
  // The line input_image[y_current_input_line] is at (write_idx - 1 + LINE_BUFFER_SIZE) % LINE_BUFFER_SIZE.
  // We want input_image[output_y], which is (LINE_BUFFER_SIZE / 2) lines older than input_image[y_current_input_line].
  // So, the offset from write_idx to the desired line is:
  int line_offset = (-1 - (LINE_BUFFER_SIZE / 2)); // This is the relative offset from write_idx

  // No explicit check for line_offset bounds needed here, as read_pixel handles modulo.
  // The previous check was incorrect and caused premature returns.

  // Get the pixel (nearest neighbor)
  pixel_t p = line_buf.read_pixel(line_offset, x);

  return p;
}

// Barrel distortion correction using integer arithmetic
void calculate_distortion(coord_t x_d, coord_t y_d, coord_t &x_u_scaled, coord_t &y_u_scaled) {
  #pragma HLS INLINE

  // Temporarily bypass distortion calculation for debugging
  // This function now simply passes through the scaled input coordinates.
  x_u_scaled = x_d << 8;
  y_u_scaled = y_d << 8;
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

  // Initial fill of the line buffer (before any output is produced)
  for (int y_fill = 0; y_fill < LINE_BUFFER_SIZE / 2; y_fill++) {
    #pragma HLS LOOP_TRIPCOUNT min=1 max=1
    for (int x = 0; x < IMG_WIDTH; x++) {
      #pragma HLS PIPELINE II=1
      line_buf.write_pixel(x, input_image[y_fill][x]);
    }
    line_buf.shift_lines();
  }

  // Main processing loop: read one line, write to buffer, produce one output line
  for (int y = 0; y < IMG_HEIGHT; y++) {
    #pragma HLS LOOP_TRIPCOUNT min=100 max=100

    // Write current input line to buffer
    for (int x = 0; x < IMG_WIDTH; x++) {
      #pragma HLS PIPELINE II=1
      line_buf.write_pixel(x, input_image[y][x]);
    }
    line_buf.shift_lines(); // Shift after writing current line

    // Calculate output for the current 'center' line of the buffer
    int output_y = y - (LINE_BUFFER_SIZE / 2);

    if (output_y >= 0 && output_y < IMG_HEIGHT) {
      for (int x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1

        coord_t x_u_scaled, y_u_scaled;
        calculate_distortion(x, output_y, x_u_scaled, y_u_scaled);
        output_image[output_y][x] = bilinear_interpolate(line_buf, x_u_scaled, y_u_scaled, output_y);
      }
    }
  }

  // Flush remaining lines from the line buffer (for the last LINE_BUFFER_SIZE / 2 rows)
  for (int y_flush = 0; y_flush < LINE_BUFFER_SIZE / 2; y_flush++) {
    #pragma HLS LOOP_TRIPCOUNT min=1 max=1
    line_buf.shift_lines(); // Shift to bring older lines to the 'center' position

    int output_y = IMG_HEIGHT - (LINE_BUFFER_SIZE / 2) + y_flush;
    if (output_y >= 0 && output_y < IMG_HEIGHT) {
      for (int x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1

        coord_t x_u_scaled, y_u_scaled;
        calculate_distortion(x, output_y, x_u_scaled, y_u_scaled);
        output_image[output_y][x] = bilinear_interpolate(line_buf, x_u_scaled, y_u_scaled, output_y);
      }
    }
  }
}
