#ifndef BRL_CORR_HLS_H
#define BRL_CORR_HLS_H

#include "ap_int.h"
#include <iostream>
#include <fstream>
#include <cstdio>
#include <cstring>
#include <cmath>

// Simple types
typedef ap_uint<8> pixel_t;
typedef short coord_t;  // For whole pixel coordinates
typedef int calc_t;     // For intermediate calculations and SCALED coordinates

// Image dimensions
const int IMG_WIDTH  = 128;
const int IMG_HEIGHT = 100;
const int LINE_BUFFER_SIZE = 3;

// Barrel correction coefficients
const coord_t K1_SCALED = 10;
const coord_t K2_SCALED = 0;
const coord_t K3_SCALED = 0;
const coord_t SCALE_FACTOR = 256;
const int DISTORTION_SCALE_SHIFT = 10; // Corrected shift value

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

// --- FIX: Update function signatures to use calc_t for scaled coordinates ---
pixel_t bilinear_interpolate(LineBuffer &line_buf, calc_t x_scaled, calc_t y_scaled, int current_line);
void calculate_distortion(coord_t x_d, coord_t y_d, calc_t &x_u_scaled, calc_t &y_u_scaled);
void barrel_correction_simple(pixel_t input_image[IMG_HEIGHT][IMG_WIDTH], pixel_t output_image[IMG_HEIGHT][IMG_WIDTH]);

#endif // BRL_CORR_HLS_H