#include <hls_stream.h>
#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_math.h>

// Type definitions optimized for Zynq-7020
typedef ap_uint<8> pixel_t;
typedef ap_fixed<16,8> coord_t;  // 16-bit fixed point, 8 integer bits
typedef ap_fixed<32,16> calc_t;  // For intermediate calculations
typedef hls::stream<pixel_t> pixel_stream_t;

// Image dimensions - adjustable for your application
#define IMG_WIDTH  640
#define IMG_HEIGHT 480
#define LINE_BUFFER_SIZE 3  // For bilinear interpolation

#define K1_ONLY

// Barrel correction coefficients (fixed-point)
const coord_t K1 = -0.5;
#ifndef K1_ONLY
const coord_t K2 = 0.2;
const coord_t K3 = -0.05;
#endif

// Image center coordinates
const coord_t CENTER_X = IMG_WIDTH / 2.0;
const coord_t CENTER_Y = IMG_HEIGHT / 2.0;

// Line buffer structure for efficient memory access
struct LineBuffer {
  pixel_t buffer[LINE_BUFFER_SIZE][IMG_WIDTH];
  ap_uint<2> write_idx;

  void shift_lines() {
    #pragma HLS PIPELINE II=1
    write_idx = (write_idx + 1) % LINE_BUFFER_SIZE;
  }

  void write_pixel(ap_uint<10> x, pixel_t pixel) {
    #pragma HLS PIPELINE II=1
    buffer[write_idx][x] = pixel;
  }

  pixel_t read_pixel(ap_uint<2> line_offset, ap_uint<10> x) {
    #pragma HLS PIPELINE II=1
    ap_uint<2> read_idx = (write_idx + line_offset) % LINE_BUFFER_SIZE;
    return buffer[read_idx][x];
  }
};

// Bilinear interpolation function
pixel_t bilinear_interpolate(LineBuffer &line_buf, coord_t x, coord_t y, ap_uint<9> current_line) {
  #pragma HLS PIPELINE II=1
  #pragma HLS INLINE

  // Get integer and fractional parts
  ap_uint<10> x0 = (ap_uint<10>)x;
  ap_uint<9> y0 = (ap_uint<9>)y;
  coord_t fx = x - x0;
  coord_t fy = y - y0;

  // Boundary checks
  if (x0 >= IMG_WIDTH-1 || y0 >= IMG_HEIGHT-1 || x0 < 0 || y0 < 0) {
    return 0; // Black pixel for out-of-bounds
  }

  // Calculate line buffer offsets
  ap_int<3> line_offset_0_int = y0 - current_line + 1;
  ap_int<3> line_offset_1_int = line_offset_0_int + 1;

  // Check if required lines are available in buffer
  if (line_offset_0_int < 0 || line_offset_0_int >= LINE_BUFFER_SIZE ||
    line_offset_1_int < 0 || line_offset_1_int >= LINE_BUFFER_SIZE) {
    return 0;
  }

  // Explicitly cast to ap_uint<2> after checks
  ap_uint<2> line_offset_0 = (ap_uint<2>)line_offset_0_int;
  ap_uint<2> line_offset_1 = (ap_uint<2>)line_offset_1_int;

  // Get four neighboring pixels
  pixel_t p00 = line_buf.read_pixel(line_offset_0, x0);
  pixel_t p01 = line_buf.read_pixel(line_offset_0, x0+1);
  pixel_t p10 = line_buf.read_pixel(line_offset_1, x0);
  pixel_t p11 = line_buf.read_pixel(line_offset_1, x0+1);

  // Bilinear interpolation
  calc_t interp_x0 = p00 * (1 - fx) + p01 * fx;
  calc_t interp_x1 = p10 * (1 - fx) + p11 * fx;
  calc_t result = interp_x0 * (1 - fy) + interp_x1 * fy;

  return (pixel_t)result;
}

// Fast square root approximation using Newton-Raphson
coord_t fast_sqrt(calc_t x) {
  #pragma HLS PIPELINE II=1
  #pragma HLS INLINE

  if (x <= 0) return 0;

  // Initial guess using bit manipulation
  coord_t guess = x >> 1;

  // Two Newton-Raphson iterations (sufficient for our precision)
  for (int i = 0; i < 2; i++) {
    #pragma HLS UNROLL
    guess = (guess + x / guess) >> 1;
  }

  return guess;
}

// Barrel distortion correction calculation
void calculate_distortion(coord_t x_d, coord_t y_d, coord_t &x_u, coord_t &y_u) {
  #pragma HLS PIPELINE II=1
  #pragma HLS INLINE

  // Translate to center
  coord_t dx = x_d - CENTER_X;
  coord_t dy = y_d - CENTER_Y;

  // Calculate radius squared
  calc_t r_squared = dx * dx + dy * dy;
  coord_t r = fast_sqrt(r_squared);

#ifdef K1_ONLY
  // For K1 only, we can skip higher order terms
  coord_t distortion_factor = 1 + K1 * r_squared;
#else
  // For full barrel distortion correction, calculate all terms
  // Barrel distortion formula: r_u = r_d * (1 + k1*r^2 + k2*r^4 + k3*r^6)
  calc_t r2 = r_squared; //r * r;
  calc_t r4 = r2 * r2;
  calc_t r6 = r4 * r2;

  coord_t distortion_factor = 1 + K1 * r2 + K2 * r4 + K3 * r6;
#endif

  // Calculate undistorted coordinates
  if (r > 0) {
    coord_t scale = distortion_factor;
    x_u = CENTER_X + dx * scale;
    y_u = CENTER_Y + dy * scale;
  } else {
    x_u = x_d;
    y_u = y_d;
  }
}

// Main barrel correction function
void barrel_correction(pixel_stream_t &input_stream, pixel_stream_t &output_stream) {
  #pragma HLS INTERFACE axis port=input_stream
  #pragma HLS INTERFACE axis port=output_stream
  #pragma HLS INTERFACE s_axilite port=return

  // Line buffer for input pixels
  static LineBuffer line_buf;
  #pragma HLS ARRAY_PARTITION variable=line_buf.buffer dim=1 complete

  // Process each output pixel
  PROCESS_LINES: for (ap_uint<9> y = 0; y < IMG_HEIGHT; y++) {
    #pragma HLS LOOP_TRIPCOUNT min=480 max=480

    // Fill line buffer for current line
    if (y < LINE_BUFFER_SIZE) {
      FILL_BUFFER: for (ap_uint<10> x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS LOOP_TRIPCOUNT min=640 max=640

        pixel_t input_pixel = input_stream.read();
        line_buf.write_pixel(x, input_pixel);
      }
      line_buf.shift_lines();

      if (y < LINE_BUFFER_SIZE - 1) {
        continue; // Need more lines before processing
      }
    } else {
      // Read new line into buffer
      READ_LINE: for (ap_uint<10> x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1
        #pragma HLS LOOP_TRIPCOUNT min=640 max=640

        pixel_t input_pixel = input_stream.read();
        line_buf.write_pixel(x, input_pixel);
      }
      line_buf.shift_lines();
    }

    // Process pixels in current output line
    PROCESS_PIXELS: for (ap_uint<10> x = 0; x < IMG_WIDTH; x++) {
      #pragma HLS PIPELINE II=1
      #pragma HLS LOOP_TRIPCOUNT min=640 max=640

      // Calculate source coordinates for current output pixel
      coord_t x_src, y_src;
      calculate_distortion(x, y - (LINE_BUFFER_SIZE/2), x_src, y_src);

      // Perform bilinear interpolation
      pixel_t corrected_pixel = bilinear_interpolate(line_buf, x_src, y_src, y - (LINE_BUFFER_SIZE/2));

      // Write to output stream
      output_stream.write(corrected_pixel);
    }
  }
}

// Wrapper function for easier integration
void barrel_correction_top(
  pixel_t input_image[IMG_HEIGHT][IMG_WIDTH],
  pixel_t output_image[IMG_HEIGHT][IMG_WIDTH]
) {
  #pragma HLS INTERFACE m_axi port=input_image offset=slave bundle=gmem0
  #pragma HLS INTERFACE m_axi port=output_image offset=slave bundle=gmem1
  #pragma HLS INTERFACE s_axilite port=return

  pixel_stream_t input_stream;
  pixel_stream_t output_stream;

  #pragma HLS DATAFLOW

  // Convert input array to stream
  ARRAY_TO_STREAM: for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      #pragma HLS PIPELINE II=1
      input_stream.write(input_image[y][x]);
    }
  }

  // Apply barrel correction
  barrel_correction(input_stream, output_stream);

  // Convert output stream to array
  STREAM_TO_ARRAY: for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      #pragma HLS PIPELINE II=1
      output_image[y][x] = output_stream.read();
    }
  }
}

// Test bench function
#define TESTBENCH
#ifdef TESTBENCH
#include <iostream>

int main() {
  // Create test image
  static pixel_t input_img[IMG_HEIGHT][IMG_WIDTH];
  static pixel_t output_img[IMG_HEIGHT][IMG_WIDTH];

  // Initialize with test pattern
  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      input_img[y][x] = (x + y) % 256;
    }
  }

  // Run barrel correction
  barrel_correction_top(input_img, output_img);

  std::cout << "Barrel correction completed successfully!" << std::endl;

  return 0;
}
#endif
