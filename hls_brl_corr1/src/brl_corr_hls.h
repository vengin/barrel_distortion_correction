// ==== PASTE THIS INTO brl_corr_hls.h ====

#ifndef BRL_CORR_HLS_H
#define BRL_CORR_HLS_H

#include <hls_video.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h> // THE CRITICAL INCLUDE THAT FIXES THE ERROR

// --- Configuration Constants ---
#define IMG_WIDTH  128
#define IMG_HEIGHT 100
#define NUM_BUFFER_LINES 32

// --- Type Definitions ---
typedef ap_uint<8> pixel_t;
typedef hls::stream<ap_axiu<8, 1, 1, 1> > AXI_STREAM;
typedef hls::Scalar<1, pixel_t> GRAY_PIXEL; // Corrected template
typedef ap_fixed<24, 10> CORD_FP;
typedef ap_fixed<24, 2>  K_FP;

// --- Function Prototypes ---
void barrel_correction_accel(
  AXI_STREAM&   input_stream,
  AXI_STREAM&   output_stream,
  int           width,
  int           height,
  float         k1,
  float         k2
);

void barrel_correction_simple(
  pixel_t       input_img[IMG_HEIGHT][IMG_WIDTH],
  pixel_t       output_img[IMG_HEIGHT][IMG_WIDTH]
);

#endif // BRL_CORR_HLS_H