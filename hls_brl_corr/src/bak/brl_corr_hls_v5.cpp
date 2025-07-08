#include "ap_int.h"
#include <iostream>
#include <fstream>
#include <cstdio>
#include <cstring>
#include <cmath>

// Simple types to avoid GMP conflicts in HLS 2017.4
typedef ap_uint<8> pixel_t;
typedef short coord_t;  // Use simple integer coordinates
typedef int calc_t;     // For intermediate calculations

// Image dimensions
const int IMG_WIDTH  = 640;
const int IMG_HEIGHT = 480;
const int LINE_BUFFER_SIZE = 3;

// Barrel correction coefficients (scaled integers to avoid floating point)
const coord_t K1_SCALED = -128;  // -0.5 * 256
const coord_t K2_SCALED = 51;    // 0.2 * 256
const coord_t K3_SCALED = -13;   // -0.05 * 256
const coord_t SCALE_FACTOR = 256;

// Image center coordinates
const coord_t CENTER_X = IMG_WIDTH / 2;
const coord_t CENTER_Y = IMG_HEIGHT / 2;

// Line buffer structure
class LineBuffer {
private:
  pixel_t buffer[LINE_BUFFER_SIZE][IMG_WIDTH];
  int write_idx;

public:
  LineBuffer() : write_idx(0) {
    #pragma HLS ARRAY_PARTITION variable=buffer dim=1 complete
  }

  void shift_lines() {
    #pragma HLS INLINE
    write_idx = (write_idx + 1) % LINE_BUFFER_SIZE;
  }

  void write_pixel(int x, pixel_t pixel) {
    #pragma HLS INLINE
    if (x >= 0 && x < IMG_WIDTH) {
      buffer[write_idx][x] = pixel;
    }
  }

  pixel_t read_pixel(int line_offset, int x) {
    #pragma HLS INLINE
    if (x < 0 || x >= IMG_WIDTH || line_offset < 0 || line_offset >= LINE_BUFFER_SIZE) {
      return 0;
    }
    int read_idx = (write_idx + line_offset) % LINE_BUFFER_SIZE;
    return buffer[read_idx][x];
  }
};

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

  // Boundary checks
  if (x >= IMG_WIDTH-1 || y >= IMG_HEIGHT-1 || x < 0 || y < 0) {
    return 0;
  }

  // Calculate line buffer offsets
  int line_offset_0 = y - current_line + 1;
  int line_offset_1 = line_offset_0 + 1;

  // Check buffer bounds
  if (line_offset_0 < 0 || line_offset_0 >= LINE_BUFFER_SIZE ||
      line_offset_1 < 0 || line_offset_1 >= LINE_BUFFER_SIZE) {
    return 0;
  }

  // Get four neighboring pixels
  pixel_t p00 = line_buf.read_pixel(line_offset_0, x);
  pixel_t p01 = line_buf.read_pixel(line_offset_0, x+1);
  pixel_t p10 = line_buf.read_pixel(line_offset_1, x);
  pixel_t p11 = line_buf.read_pixel(line_offset_1, x+1);

  // Integer bilinear interpolation
  int interp_x0 = (p00 * (256 - fx) + p01 * fx) >> 8;
  int interp_x1 = (p10 * (256 - fx) + p11 * fx) >> 8;
  int result = (interp_x0 * (256 - fy) + interp_x1 * fy) >> 8;

  return (pixel_t)result;
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
  // distortion = 1 + k1*r^2 + k2*r^4 + k3*r^6
  calc_t r2 = r * r;
  calc_t r4 = (r2 >> 8) * (r2 >> 8);  // Prevent overflow
  calc_t r6 = (r4 >> 8) * (r2 >> 8);

  // Calculate distortion factor (scaled by 256)
  calc_t distortion_scaled = SCALE_FACTOR +
                            (K1_SCALED * (r2 >> 8)) +
                            (K2_SCALED * (r4 >> 16)) +
                            (K3_SCALED * (r6 >> 24));

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

  // Process image line by line
  for (int y = 0; y < IMG_HEIGHT; y++) {
    #pragma HLS LOOP_TRIPCOUNT min=480 max=480

    // Fill line buffer
    if (y < LINE_BUFFER_SIZE) {
      for (int x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1
        line_buf.write_pixel(x, input_image[y][x]);
      }
      line_buf.shift_lines();

      if (y < LINE_BUFFER_SIZE - 1) {
        continue;
      }
    } else {
      for (int x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1
        line_buf.write_pixel(x, input_image[y][x]);
      }
      line_buf.shift_lines();
    }

    // Process output pixels
    int output_y = y - (LINE_BUFFER_SIZE / 2);
    if (output_y >= 0 && output_y < IMG_HEIGHT) {
      for (int x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1

        // Calculate source coordinates
        coord_t x_src_scaled, y_src_scaled;
        calculate_distortion(x, output_y, x_src_scaled, y_src_scaled);

        // Interpolate pixel value
        pixel_t corrected_pixel = bilinear_interpolate(line_buf, x_src_scaled, y_src_scaled, output_y);

        output_image[output_y][x] = corrected_pixel;
      }
    }
  }

  // Handle remaining lines
  for (int remaining = 0; remaining < LINE_BUFFER_SIZE / 2; remaining++) {
    int output_y = IMG_HEIGHT - (LINE_BUFFER_SIZE / 2) + remaining;
    if (output_y >= 0 && output_y < IMG_HEIGHT) {
      for (int x = 0; x < IMG_WIDTH; x++) {
        #pragma HLS PIPELINE II=1

        coord_t x_src_scaled, y_src_scaled;
        calculate_distortion(x, output_y, x_src_scaled, y_src_scaled);

        pixel_t corrected_pixel = bilinear_interpolate(line_buf, x_src_scaled, y_src_scaled, output_y);
        output_image[output_y][x] = corrected_pixel;
      }
    }
  }
}

// Function to parse filename and extract dimensions
bool parse_filename(const char* filename, int &width, int &height) {
  // Expected format: /path/img_WIDTHxHEIGHT.txt
  // Find the last occurrence of 'img_'
  const char* img_pos = strrchr(filename, '/');
  if (img_pos) {
    img_pos++; // Skip the '/'
  } else {
    img_pos = filename; // No path separator found
  }

  if (strncmp(img_pos, "img_", 4) != 0) {
    return false;
  }

  // Parse dimensions
  int w, h;
  if (sscanf(img_pos, "img_%dx%d.txt", &w, &h) == 2) {
    width = w;
    height = h;
    return true;
  }

  return false;
}

// Function to read RGB image from text file
bool read_image_from_file(const char* filename, pixel_t image[IMG_HEIGHT][IMG_WIDTH]) {
  #include <fstream>

  std::ifstream file(filename);
  if (!file.is_open()) {
    std::cout << "Error: Cannot open input file " << filename << std::endl;
    return false;
  }

  std::cout << "Reading image from: " << filename << std::endl;

  int pixel_count = 0;
  int r, g, b;

  for (int y = 0; y < IMG_HEIGHT && !file.eof(); y++) {
    for (int x = 0; x < IMG_WIDTH && !file.eof(); x++) {
      if (file >> r >> g >> b) {
        // Convert RGB to grayscale using standard weights
        // Y = 0.299*R + 0.587*G + 0.114*B
        int gray = (299 * r + 587 * g + 114 * b) / 1000;
        image[y][x] = (pixel_t)(gray > 255 ? 255 : (gray < 0 ? 0 : gray));
        pixel_count++;
      } else {
        std::cout << "Warning: Not enough pixel data in file" << std::endl;
        // Fill remaining pixels with black
        for (int fill_y = y; fill_y < IMG_HEIGHT; fill_y++) {
          for (int fill_x = (fill_y == y ? x : 0); fill_x < IMG_WIDTH; fill_x++) {
            image[fill_y][fill_x] = 0;
          }
        }
        file.close();
        return true;
      }
    }
  }

  file.close();
  std::cout << "Successfully read " << pixel_count << " pixels" << std::endl;
  return true;
}

// Function to write grayscale image to text file (converted back to RGB)
bool write_image_to_file(const char* filename, pixel_t image[IMG_HEIGHT][IMG_WIDTH]) {
  #include <fstream>

  std::ofstream file(filename);
  if (!file.is_open()) {
    std::cout << "Error: Cannot open output file " << filename << std::endl;
    return false;
  }

  std::cout << "Writing image to: " << filename << std::endl;

  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      // Convert grayscale back to RGB (all channels same value)
      int gray = (int)image[y][x];
      file << gray << " " << gray << " " << gray << std::endl;
    }
  }

  file.close();
  std::cout << "Successfully wrote " << (IMG_WIDTH * IMG_HEIGHT) << " pixels" << std::endl;
  return true;
}

// Generate test pattern and save to file
void generate_test_image(const char* filename) {
  #include <fstream>

  std::ofstream file(filename);
  if (!file.is_open()) {
    std::cout << "Error: Cannot create test file " << filename << std::endl;
    return;
  }

  std::cout << "Generating test pattern: " << filename << std::endl;

  // Create a test pattern with circles and gradients
  int center_x = IMG_WIDTH / 2;
  int center_y = IMG_HEIGHT / 2;

  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      int dx = x - center_x;
      int dy = y - center_y;
      int distance = (int)sqrt(dx*dx + dy*dy);

      // Create concentric circles pattern
      int pattern = ((distance / 20) % 2) * 128 + 64;

      // Add some gradient
      int gradient = (x * 255) / IMG_WIDTH;

      // Combine pattern and gradient
      int value = (pattern + gradient) / 2;
      if (value > 255) value = 255;
      if (value < 0) value = 0;

      // Write as RGB (same value for all channels)
      file << value << " " << value << " " << value << std::endl;
    }
  }

  file.close();
  std::cout << "Test pattern generated successfully" << std::endl;
}

// Test function with file I/O
int main() {
  static pixel_t input_img[IMG_HEIGHT][IMG_WIDTH];
  static pixel_t output_img[IMG_HEIGHT][IMG_WIDTH];

  // Input and output filenames
  char input_filename[256];
  char output_filename[256];

  // Create filename based on current dimensions
  sprintf(input_filename, "img_in/img_%dx%d.txt", IMG_WIDTH, IMG_HEIGHT);
  sprintf(output_filename, "img_out/img_%dx%d_corrected.txt", IMG_WIDTH, IMG_HEIGHT);

  std::cout << "=== Barrel Distortion Correction Test ===" << std::endl;
  std::cout << "Image dimensions: " << IMG_WIDTH << "x" << IMG_HEIGHT << std::endl;
  std::cout << "Expected input file: " << input_filename << std::endl;
  std::cout << "Output file: " << output_filename << std::endl;

  // Try to read from file, if not found create test pattern
  if (!read_image_from_file(input_filename, input_img)) {
    std::cout << "Input file not found, generating test pattern..." << std::endl;
    generate_test_image(input_filename);

    // Try to read the generated test file
    if (!read_image_from_file(input_filename, input_img)) {
      std::cout << "Failed to read generated test file, using built-in pattern" << std::endl;
      // Fallback to built-in test pattern
      for (int y = 0; y < IMG_HEIGHT; y++) {
        for (int x = 0; x < IMG_WIDTH; x++) {
          input_img[y][x] = (pixel_t)((x + y) & 0xFF);
        }
      }
    }
  }

  std::cout << "Starting barrel correction..." << std::endl;

  // Run barrel correction
  barrel_correction_simple(input_img, output_img);

  std::cout << "Barrel correction completed!" << std::endl;

  // Write output to file
  if (write_image_to_file(output_filename, output_img)) {
    std::cout << "Output saved successfully!" << std::endl;
  } else {
    std::cout << "Failed to save output file" << std::endl;
  }

  // Display some statistics
  std::cout << "\n=== Statistics ===" << std::endl;
  std::cout << "Input center pixel: " << (int)input_img[IMG_HEIGHT/2][IMG_WIDTH/2] << std::endl;
  std::cout << "Output center pixel: " << (int)output_img[IMG_HEIGHT/2][IMG_WIDTH/2] << std::endl;

  // Calculate some basic statistics
  int input_sum = 0, output_sum = 0;
  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      input_sum += input_img[y][x];
      output_sum += output_img[y][x];
    }
  }

  std::cout << "Input average: " << input_sum / (IMG_WIDTH * IMG_HEIGHT) << std::endl;
  std::cout << "Output average: " << output_sum / (IMG_WIDTH * IMG_HEIGHT) << std::endl;

  return 0;
}