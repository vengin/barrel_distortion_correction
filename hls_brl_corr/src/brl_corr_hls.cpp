#include "brl_corr_hls.h"

// ===================================================================
//                  CORE HARDWARE IMPLEMENTATION
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
  // --- HLS Pragmas for Interfaces ---
#pragma HLS INTERFACE axis port=input_stream
#pragma HLS INTERFACE axis port=output_stream
#pragma HLS INTERFACE s_axilite port=width  bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite port=height bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite port=k1     bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite port=k2     bundle=CTRL_BUS
#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS

  K_FP k1_fp = k1;
  K_FP k2_fp = k2;
  CORD_FP cx_fp = (CORD_FP)width / 2.0;
  CORD_FP cy_fp = (CORD_FP)height / 2.0;

  static hls::LineBuffer<NUM_BUFFER_LINES, IMG_WIDTH, pixel_t> line_buffer;

  // Main processing loop for true streaming
  for (int y_out = 0; y_out < height; y_out++) {
    for (int x_out = 0; x_out < width; x_out++) {
#pragma HLS PIPELINE II=1

      // --- LOGIC FIX: Streaming Read Logic ---
      ap_axiu<8,1,1,1> pixel_in_packet = input_stream.read();
      pixel_t current_pixel = pixel_in_packet.data;

      // Shift existing lines up and insert the new pixel at the bottom "writing" row
      line_buffer.shift_pixels_up(x_out);
      line_buffer.insert_pixel(current_pixel, NUM_BUFFER_LINES - 1, x_out);

      // --- Remapping and Interpolation Logic ---
      CORD_FP x_n = CORD_FP(x_out) - cx_fp;
      CORD_FP y_n = CORD_FP(y_out) - cy_fp;
      CORD_FP r2 = x_n * x_n + y_n * y_n;
      CORD_FP r4 = r2 * r2;
      CORD_FP scale = 1.0 + k1_fp * r2 + k2_fp * r4;
      CORD_FP x_in_fp = cx_fp + x_n * scale;
      CORD_FP y_in_fp = cy_fp + y_n * scale;

      pixel_t output_pixel_val;

      // Check if the required source pixel is within the image bounds
      if (x_in_fp < 0 || x_in_fp >= width - 1 || y_in_fp < 0 || y_in_fp >= height - 1) {
        output_pixel_val = 0;
      } else {
        int x_floor = x_in_fp.to_int();
        int y_floor = y_in_fp.to_int();

        // Find which row in the line buffer corresponds to y_floor
        // This is a subtle but key part of using line buffers for remapping
        int buffer_row = y_floor - y_out + (NUM_BUFFER_LINES - 1);

        // Check if the required line is actually in our buffer
        if (buffer_row < 0 || buffer_row >= NUM_BUFFER_LINES - 1) {
            output_pixel_val = 0; // Or some other default color if desired
        } else {
            CORD_FP dx = x_in_fp - x_floor;
            CORD_FP dy = y_in_fp - y_floor;

            pixel_t p00 = line_buffer.getval(buffer_row,     x_floor);
            pixel_t p10 = line_buffer.getval(buffer_row,     x_floor + 1);
            pixel_t p01 = line_buffer.getval(buffer_row + 1, x_floor);
            pixel_t p11 = line_buffer.getval(buffer_row + 1, x_floor + 1);

            CORD_FP term1 = p00 * (1.0 - dx) * (1.0 - dy);
            CORD_FP term2 = p10 * dx * (1.0 - dy);
            CORD_FP term3 = p01 * (1.0 - dx) * dy;
            CORD_FP term4 = p11 * dx * dy;

            output_pixel_val = (pixel_t)(term1 + term2 + term3 + term4);
        }
      }

      // Prepare and write output AXI-Stream packet
      ap_axiu<8, 1, 1, 1> pixel_out_packet;
      pixel_out_packet.data = output_pixel_val;
      pixel_out_packet.keep = -1;
      pixel_out_packet.strb = -1;
      pixel_out_packet.last = (x_out == width - 1) && (y_out == height - 1);
      output_stream.write(pixel_out_packet);
    }
  }
}

// ===================================================================
//                 SIMULATION WRAPPER
// ===================================================================
void barrel_correction_simple(
  pixel_t       input_img[IMG_HEIGHT][IMG_WIDTH],
  pixel_t       output_img[IMG_HEIGHT][IMG_WIDTH]
)
{
  AXI_STREAM inputStream, outputStream;

  float k1 = -0.0001f;
  float k2 = -0.0000001f;

  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
#pragma HLS PIPELINE
      ap_axiu<8, 1, 1, 1> pixel_packet;
      pixel_packet.data = input_img[y][x];
      pixel_packet.keep = -1;
      pixel_packet.strb = -1;
      // Note: TLAST for streams should be per-pixel, not just at the very end
      pixel_packet.last = (x == IMG_WIDTH - 1) && (y == IMG_HEIGHT - 1);
      inputStream << pixel_packet;
    }
  }

  barrel_correction_accel(inputStream, outputStream, IMG_WIDTH, IMG_HEIGHT, k1, k2);

  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
#pragma HLS PIPELINE
      ap_axiu<8, 1, 1, 1> pixel_packet = outputStream.read();
      output_img[y][x] = pixel_packet.data;
    }
  }
}
