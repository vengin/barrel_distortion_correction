#include <iostream>
#include <fstream>
#include <string.h>
#include <stdio.h>
#include <math.h>
#include <iomanip> // Required for std::setw and std::setfill
#include "brl_corr_hls.h" // Include the new header file

// Function to read RGB image from text file and convert to grayscale
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

        // Simple average for grayscale, matching your logic
        int gray = (r + g + b) / 3;
        image[y][x] = (pixel_t)(gray > 255 ? 255 : (gray < 0 ? 0 : gray));
        pixel_count++;
      } else {
        // Not an error, just end of file. Fill rest with black.
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

// Function to write grayscale image to text file
bool write_image_to_file(const char* filename, pixel_t image[IMG_HEIGHT][IMG_WIDTH]) {
  std::ofstream file(filename);
  if (!file.is_open()) {
    std::cout << "Error: Cannot open output file " << filename << std::endl;
    return false;
  }

  std::cout << "Writing image to: " << filename << std::endl;

  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      int gray = (int)image[y][x];
      // Format as RRGGBB hexadecimal, replicating gray value
      file << std::hex << std::setw(2) << std::setfill('0') << gray
           << std::setw(2) << std::setfill('0') << gray
           << std::setw(2) << std::setfill('0') << gray << std::endl;
    }
  }

  file.close();
  std::cout << "Successfully wrote " << (IMG_WIDTH * IMG_HEIGHT) << " pixels" << std::endl;
  return true;
}

// Your provided main function - no changes needed
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
  std::cout << "Input file: " << input_filename << std::endl;
  std::cout << "Output file: " << output_filename << std::endl;

  if (!read_image_from_file(input_filename, input_img)) {
      std::cout << "Failed to read input file, exiting." << std::endl;
      // In a real testbench, you might generate a pattern here.
      // For now, we will fail if the input isn't present.
      return 1;
  }

  std::cout << "Starting barrel correction..." << std::endl;

  // Run barrel correction via the simulation wrapper
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
