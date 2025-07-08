#include "brl_corr_hls.h" // Include the new header file
#include <iomanip>
#include <fstream>
#include <iostream>
#include <cmath>
#include <cstdio>
#include <cstring>


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
  std::ifstream file(filename);
  if (!file.is_open()) {
    std::cout << "Error: Cannot open input file " << filename << std::endl;
    return false;
  }

  std::cout << "Reading image from: " << filename << std::endl;

  int pixel_count = 0;
  char hex_color[7]; // RRGGBB + null terminator

  for (int y = 0; y < IMG_HEIGHT && !file.eof(); y++) {
    for (int x = 0; x < IMG_WIDTH && !file.eof(); x++) {
      if (file >> hex_color) {
        unsigned int rgb_val;
        sscanf(hex_color, "%x", &rgb_val);

        int r = (rgb_val >> 16) & 0xFF;
        int g = (rgb_val >> 8) & 0xFF;
        int b = rgb_val & 0xFF;

        // Convert RGB to grayscale using standard weights
        // Y = 0.299*R + 0.587*G + 0.114*B
        //int gray = (299 * r + 587 * g + 114 * b) / 1000;
        int gray = (r + g + b) / 3; // Simple average for grayscale
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
      // Format as RRGGBB hexadecimal
      file << std::hex << std::setw(2) << std::setfill('0') << gray
           << std::setw(2) << std::setfill('0') << gray
           << std::setw(2) << std::setfill('0') << gray << std::endl;
    }
  }

  file.close();
  std::cout << "Successfully wrote " << (IMG_WIDTH * IMG_HEIGHT) << " pixels" << std::endl;
  return true;
}

// Generate test pattern and save to file
void generate_test_image(const char* filename) {
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

      // Write as RRGGBB hexadecimal (same value for all channels)
      file << std::hex << std::setw(2) << std::setfill('0') << value
           << std::setw(2) << std::setfill('0') << value
           << std::setw(2) << std::setfill('0') << value << std::endl;
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
  sprintf(input_filename,  "../../../src/img_in/img_%dx%d_in.txt", IMG_WIDTH, IMG_HEIGHT);
  sprintf(output_filename, "../../../src/img_out/img_%dx%d_out.txt", IMG_WIDTH, IMG_HEIGHT);

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
