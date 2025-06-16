#include "brl_corr_hls.h"
#include <stdio.h> // Include for printf
#define DEBUG

// ===================================================================
//                  HARDWARE CORE FUNCTION
// ===================================================================
void barrel_correction_accel(
  AXI_STREAM&   input_stream,
  AXI_STREAM&   output_stream,
  int           width,
  int           height,
  float         k1,
  float         k2
)
{
#pragma HLS INTERFACE axis port=input_stream
#pragma HLS INTERFACE axis port=output_stream
#pragma HLS INTERFACE s_axilite port=width  bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite port=height bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite port=k1     bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite port=k2     bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS

  const int LATENCY = NUM_BUFFER_LINES / 2;

  K_FP k1_fp = k1;
  K_FP k2_fp = k2;
  CORD_FP cx_fp = (CORD_FP)width  / CORD_FP(2);
  CORD_FP cy_fp = (CORD_FP)height / CORD_FP(2);

  static hls::LineBuffer<NUM_BUFFER_LINES, IMG_WIDTH, pixel_t> line_buffer;

  for (int y = 0; y < height + LATENCY; y++) {
    for (int x = 0; x < width; x++) {
#pragma HLS PIPELINE II=1

      pixel_t current_pixel = 0;
      if (y < height) {
        ap_axiu<8,1,1,1> packet_in = input_stream.read();
        current_pixel = packet_in.data;
      }

      line_buffer.shift_pixels_up(x);
      line_buffer.insert_bottom(current_pixel, x);

      if (y >= LATENCY) {
        int y_out = y - LATENCY;

        CORD_FP x_n = (CORD_FP)x - cx_fp;
        CORD_FP y_n = (CORD_FP)y_out - cy_fp;
        CORD_FP r2  = x_n*x_n + y_n*y_n;
        CORD_FP scale = CORD_FP(1.0) + k1_fp*r2 + k2_fp*r2*r2;
        CORD_FP x_in = cx_fp + x_n * scale;
        CORD_FP y_in = cy_fp + y_n * scale;

        pixel_t output_pixel = 0;

        bool in_bounds = (x_in >= 0 && x_in < width-1 && y_in >= 0 && y_in < height-1);

        if(in_bounds) {
          int x_floor = x_in.to_int();
          int y_floor = y_in.to_int();

          int buf_y = y_floor - y + (NUM_BUFFER_LINES - 1);
          bool buf_valid = (buf_y >= 0 && buf_y < NUM_BUFFER_LINES - 1);

          if(buf_valid) {
            CORD_FP dx = x_in - x_floor;
            CORD_FP dy = y_in - y_floor;

            pixel_t p00 = line_buffer.getval(buf_y,     x_floor);
            pixel_t p10 = line_buffer.getval(buf_y,     x_floor + 1);
            pixel_t p01 = line_buffer.getval(buf_y + 1, x_floor);
            pixel_t p11 = line_buffer.getval(buf_y + 1, x_floor + 1);

            CORD_FP interp_val = p00*(1-dx)*(1-dy) + p10*dx*(1-dy) + p01*(1-dx)*dy + p11*dx*dy;
            output_pixel = interp_val.to_uint();

            // --- NEW SUPER-DEBUG PRINTF ---
            #ifdef DEBUG
              if (y_out == height / 2 && x == width / 2) {
                printf("\n--- DEBUG: CENTER PIXEL (LOGIC) ---\n");
                printf("  in_bounds check: PASSED\n");
                printf("  buf_y check: PASSED (buf_y = %d)\n", buf_y);
                printf("  Original pixel values: p00=%d, p10=%d, p01=%d, p11=%d\n", (int)p00, (int)p10, (int)p01, (int)p11);
                printf("  Final output_pixel value: %d\n", (int)output_pixel);
              }
            #endif
          }
          #ifdef DEBUG
          else if (y_out == height / 2 && x == width / 2) {
            printf("\n--- DEBUG: CENTER PIXEL (LOGIC) ---\n");
            printf("  in_bounds check: PASSED\n");
            printf("  buf_y check: FAILED (buf_y = %d)\n", buf_y);
          }
          #endif
        }

        ap_axiu<8,1,1,1> packet_out;
        packet_out.data = output_pixel;
        packet_out.keep = -1;
        packet_out.strb = -1;
        packet_out.last = (y_out == height - 1) && (x == width - 1);
        output_stream.write(packet_out);
      }
    }
  }
}

// ===================================================================
//                  SIMULATION WRAPPER (Unchanged)
// ===================================================================
void barrel_correction_simple(
  pixel_t input_img[IMG_HEIGHT][IMG_WIDTH],
  pixel_t output_img[IMG_HEIGHT][IMG_WIDTH]
)
{
  AXI_STREAM inputStream, outputStream;

  float k1 = -3e-5;
  float k2 = -1e-9;

  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      ap_axiu<8, 1, 1, 1> p;
      p.data = input_img[y][x];
      p.keep = -1; p.strb = -1;
      p.last = (x == IMG_WIDTH - 1) && (y == IMG_HEIGHT - 1);
      inputStream << p;
    }
  }

  barrel_correction_accel(inputStream, outputStream, IMG_WIDTH, IMG_HEIGHT, k1, k2);

  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      ap_axiu<8, 1, 1, 1> p = outputStream.read();
      output_img[y][x] = p.data;
    }
  }
}
