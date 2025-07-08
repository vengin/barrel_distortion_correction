#ifndef BRL_CORR_HLS_H
#define BRL_CORR_HLS_H

// --- REQUIRED HLS LIBRARIES ---
#include <hls_video.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h> // <<< FIX #1: This line is ESSENTIAL. It defines 'ap_axiu'.

// --- CONFIGURATION CONSTANTS ---
#define IMG_WIDTH  128
#define IMG_HEIGHT 100
#define NUM_BUFFER_LINES 8

// --- TYPE DEFINITIONS ---
typedef ap_uint<8> pixel_t;

// AXI-Stream video format: 8-bit grayscale
typedef hls::stream<ap_axiu<8, 1, 1, 1> > AXI_STREAM;

// Internal pixel representation
// FIX #2: The template requires a TYPE (pixel_t), not the number 8.
typedef hls::Scalar<1, pixel_t> GRAY_PIXEL;

// Fixed-point types
typedef ap_fixed<24, 10> CORD_FP;
typedef ap_fixed<24, 2>  K_FP;

// --- FUNCTION PROTOTYPES ---

// Top-Level Function for HARDWARE SYNTHESIS
void barrel_correction_accel(
  AXI_STREAM&   input_stream,
  AXI_STREAM&   output_stream,
  int           width,
  int           height,
  float         k1,
  float         k2
);

// Wrapper Function for C-SIMULATION (matches testbench)
void barrel_correction_simple(
  pixel_t       input_img[IMG_HEIGHT][IMG_WIDTH],
  pixel_t       output_img[IMG_HEIGHT][IMG_WIDTH]
);

#endif // BRL_CORR_HLS_H
