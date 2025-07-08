// brl_corr_hls.h (Revised)
#ifndef BRL_CORR_HLS_H
#define BRL_CORR_HLS_H

#include "ap_int.h"
#include <iostream>
#include <fstream>
#include <cstdio>
#include <cstring>
#include <cmath>

// Simple types (using ap_int for safety with ranges)
typedef ap_uint<8> pixel_t;
typedef ap_int<16> coord_t;  // Max scaled coord for 128x100 is 128*256=32768, fits in 16-bit
typedef ap_int<32> calc_t;     // For intermediate calculations like r_squared (max 6596)

// Image dimensions
const int IMG_WIDTH  = 128;
const int IMG_HEIGHT = 100;
const int LINE_BUFFER_SIZE = 3; // For bilinear interpolation

// Barrel correction coefficients (scaled integers for inverse mapping)
// These are for *correction*.
// A positive K1_CORRECTION_SCALED will "pull in" points, correcting barrel distortion.
// Choose a value such that K1_CORRECTION_SCALED * (max_norm_r_squared) is less than SCALE_FACTOR.
// MAX_R_SQUARED_PIXEL = (IMG_WIDTH/2)^2 + (IMG_HEIGHT/2)^2 = 64^2 + 50^2 = 6596
// Let's normalize r_squared so max is 256. Shift by 256/6596 approx 25.
// So, K1_CORRECTION_SCALED will be small.
// If K1_CORRECTION_SCALED = 1, then at max radius, 1 * 256 (r_norm) = 256.
// If K1_CORRECTION_SCALED = 16 (for 0.0625 actual k)
const int K1_CORRECTION_SCALED = 16; // Example: scaled by 256. This means actual k is 16/256 = 0.0625.

const int SCALE_FACTOR = 256; // Fixed-point scaling factor (e.g., 8 fractional bits)

// Shift factor to normalize r_squared into a 0-256 range for K1_CORRECTION_SCALED multiplication
// MAX_R_SQUARED_PIXEL = 6596. To get to 256, need to divide by 6596/256 approx 25.7.
// 2^4=16, 2^5=32. Using 5 bits (divide by 32) is a decent approximation.
const int R_SQUARED_NORM_SHIFT = 5; // Divides r_squared by 32. Max r_squared_norm = 6596/32 = 206.
                                   // Then K1_CORRECTION_SCALED * r_squared_norm = 16 * 206 = 3296.
                                   // This term needs to be divided by SCALE_FACTOR implicitly.

// Image center coordinates (integer pixel coordinates)
const int CENTER_X = IMG_WIDTH / 2;
const int CENTER_Y = IMG_HEIGHT / 2;

// Line buffer structure (unchanged, just copy-paste)
class LineBuffer {
private:
  pixel_t buffer[LINE_BUFFER_SIZE][IMG_WIDTH];
  int write_idx; // This needs to be carefully handled for circular buffer logic.
                 // Let's simplify this to a traditional shift register style for clarity and robustness.

public:
  LineBuffer() : write_idx(0) {
    #pragma HLS ARRAY_PARTITION variable=buffer dim=1 complete // Partition rows for parallel access
    #pragma HLS DEPENDENCE variable=buffer false // No false dependencies
  }

  // Traditional shift register (oldest line is 0, newest is LINE_BUFFER_SIZE-1)
  void shift_lines() {
    #pragma HLS INLINE
    for (int i = 0; i < LINE_BUFFER_SIZE - 1; i++) {
        #pragma HLS UNROLL // Unroll this inner loop for full parallelism
        for (int x = 0; x < IMG_WIDTH; x++) {
            #pragma HLS UNROLL // Unroll for pixel-level parallelism in each line
            buffer[i][x] = buffer[i+1][x];
        }
    }
  }

  void write_pixel(int x, pixel_t pixel) {
    #pragma HLS INLINE
    if (x >= 0 && x < IMG_WIDTH) { // Safety check
      buffer[LINE_BUFFER_SIZE - 1][x] = pixel; // Always write to the newest line
    }
  }

  pixel_t read_pixel(int line_offset, int x) {
    #pragma HLS INLINE
    // line_offset: 0 = oldest line in buffer, LINE_BUFFER_SIZE-1 = newest line
    if (x < 0 || x >= IMG_WIDTH || line_offset < 0 || line_offset >= LINE_BUFFER_SIZE) {
      return 0; // Out of bounds, return black
    }
    return buffer[line_offset][x];
  }
};

// Function declarations for HLS core
coord_t int_sqrt(calc_t x);
pixel_t bilinear_interpolate(LineBuffer &line_buf, coord_t x_scaled, coord_t y_scaled, int current_output_y);
void calculate_distortion(int x_d_pixel, int y_d_pixel, coord_t &x_u_scaled, coord_t &y_u_scaled);
void barrel_correction_simple(pixel_t input_image[IMG_HEIGHT][IMG_WIDTH], pixel_t output_image[IMG_HEIGHT][IMG_WIDTH]);

#endif // BRL_CORR_HLS_H