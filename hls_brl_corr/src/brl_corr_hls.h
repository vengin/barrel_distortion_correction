#ifndef BRL_CORR_HLS_H
#define BRL_CORR_HLS_H

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
const int IMG_WIDTH  = 128;
const int IMG_HEIGHT = 100;
const int LINE_BUFFER_SIZE = 3;

// Barrel correction coefficients (scaled integers to avoid floating point)
const coord_t K1_SCALED = 10; // Reset to neutral for completion
const coord_t K2_SCALED = 0; // 0.2 * 256
const coord_t K3_SCALED = 0; // -0.05 * 256
const coord_t SCALE_FACTOR = 256;
const int DISTORTION_SCALE_SHIFT = 12; // New scaling factor for distortion terms

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

// Function declarations for HLS core
coord_t int_sqrt(calc_t x);
pixel_t bilinear_interpolate(LineBuffer &line_buf, coord_t x_scaled, coord_t y_scaled, int current_line);
void calculate_distortion(coord_t x_d, coord_t y_d, coord_t &x_u_scaled, coord_t &y_u_scaled);
void barrel_correction_simple(pixel_t input_image[IMG_HEIGHT][IMG_WIDTH], pixel_t output_image[IMG_HEIGHT][IMG_WIDTH]);

#endif // BRL_CORR_HLS_H
