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
  pixel_t current_line_buffer[IMG_WIDTH];

  for (int y = 0; y < height + LATENCY; y++) {
    // Read a full line from input stream
    for (int x = 0; x < width; x++) {
#pragma HLS PIPELINE II=1
      pixel_t current_pixel = 0;
      if (y < height) {
        ap_axiu<8,1,1,1> packet_in = input_stream.read();
        current_pixel = packet_in.data;
      }
      current_line_buffer[x] = current_pixel;

      #ifdef DEBUG
        if (y == height / 2 && x == width / 2) {
          printf("\n--- DEBUG: INPUT PIXEL READ ---\n");
          printf("  Input pixel at (%d, %d): %d\n", x, y, (int)current_pixel);
        }
      #endif
    }

    // Shift line_buffer and insert the new line
    #ifdef DEBUG
      if (y == height / 2) { // Print for the entire line at y=height/2
        printf("\n--- DEBUG: LINE BUFFER STATE BEFORE SHIFT (y=%d) ---\n", y);
        for (int i = 0; i < 3; i++) { // Print first 3 lines
          printf("  Line %d (before shift, x=%d): %d\n", i, width / 2, (int)line_buffer.getval(i, width / 2));
        }
      }
    #endif

    line_buffer.shift_pixels_up(1); // Shift all lines up by one

    #ifdef DEBUG
      if (y == height / 2) {
        printf("\n--- DEBUG: LINE BUFFER STATE AFTER SHIFT (y=%d) ---\n", y);
        for (int i = 0; i < 3; i++) { // Print first 3 lines
          printf("  Line %d (after shift, x=%d): %d\n", i, width / 2, (int)line_buffer.getval(i, width / 2));
        }
      }
    #endif

    for (int x_inner = 0; x_inner < width; x_inner++) {
#pragma HLS UNROLL
//      line_buffer.insert_pixel(current_line_buffer[x_inner], NUM_BUFFER_LINES - 1, x_inner); // Insert the new line pixel by pixel at the bottom

      #ifdef DEBUG
        if (y == height / 2 && x_inner == width / 2) {
          printf("\n--- DEBUG: LINE BUFFER INSERTION CHECK ---\n");
          printf("  Value inserted into line buffer at (%d, %d): %d\n", x_inner, y, (int)current_line_buffer[x_inner]);
          printf("  Value retrieved from line buffer (newest line): %d\n", (int)line_buffer.getval(0, x_inner));
          printf("  Value retrieved from line buffer (prev[-1] line): %d\n", (int)line_buffer.getval(1, x_inner));
          printf("  Value retrieved from line buffer (prev[-2] line): %d\n", (int)line_buffer.getval(2, x_inner));
        }
      #endif
    }

    // Process output pixels for this y_out
    if (y >= LATENCY) {
      int y_out = y - LATENCY;
      for (int x = 0; x < width; x++) {
#pragma HLS PIPELINE II=1

        CORD_FP x_n = (CORD_FP)x - cx_fp;
        CORD_FP y_n = (CORD_FP)y_out - cy_fp;
        CORD_FP r2  = x_n*x_n + y_n*y_n;
        CORD_FP scale = CORD_FP(1.0) + k1_fp*r2 + k2_fp*r2*r2;
        CORD_FP x_in = cx_fp + x_n * scale;
        CORD_FP y_in = cy_fp + y_n * scale;

        #ifdef DEBUG
          if (y_out == height / 2 && x == width / 2) {
            printf("\n--- DEBUG: COORDINATE CALCULATION ---\n");
            printf("  (x_n, y_n): (%f, %f)\n", (float)x_n, (float)y_n);
            printf("  r2: %f\n", (float)r2);
            printf("  scale: %f\n", (float)scale);
            printf("  (x_in, y_in): (%f, %f)\n", (float)x_in, (float)y_in);
          }
        #endif

        pixel_t output_pixel = 0;

        bool in_bounds = (x_in >= 0 && x_in < width-1 && y_in >= 0 && y_in < height-1);

        #ifdef DEBUG
          if (y_out == height / 2 && x == width / 2) {
            printf("\n--- DEBUG: IN_BOUNDS CHECK ---\n");
            printf("  in_bounds: %s\n", in_bounds ? "TRUE" : "FALSE");
          }
        #endif

        if(in_bounds) {
          int x_floor = x_in.to_int();
          int y_floor = y_in.to_int();

          #ifdef DEBUG
            if (y_out == height / 2 && x == width / 2) {
              printf("\n--- DEBUG: FLOOR COORDINATES ---\n");
              printf("  (x_floor, y_floor): (%d, %d)\n", x_floor, y_floor);
            }
          #endif

          // Calculate line buffer indices
          // line_buffer.getval(0, x) is the newest line (current 'y')
          // line_buffer.getval(i, x) is line 'y-i'
          // We need y_floor and y_floor + 1 from the original image
          // Index for y_floor: y - y_floor
          // Index for y_floor + 1: y - (y_floor + 1)
          int idx_y_floor     = y - y_floor;
          int idx_y_floor_plus1 = y - (y_floor + 1);

          // Check if both required lines are within the buffer bounds
          bool buf_valid = (idx_y_floor_plus1 >= 0 && idx_y_floor < NUM_BUFFER_LINES);

          #ifdef DEBUG
            if (y_out == height / 2 && x == width / 2) {
              printf("\n--- DEBUG: BUFFER VALIDITY ---\n");
              printf("  idx_y_floor: %d, idx_y_floor_plus1: %d, buf_valid: %s\n", idx_y_floor, idx_y_floor_plus1, buf_valid ? "TRUE" : "FALSE");
            }
          #endif

          if(buf_valid) {
            CORD_FP dx = x_in - x_floor;
            CORD_FP dy = y_in - y_floor;

            #ifdef DEBUG
              if (y_out == height / 2 && x == width / 2) {
                printf("\n--- DEBUG: INTERPOLATION WEIGHTS ---\n");
                printf("  (dx, dy): (%f, %f)\n", (float)dx, (float)dy);
              }
            #endif

            pixel_t p00 = line_buffer.getval(idx_y_floor,     x_floor);
            pixel_t p10 = line_buffer.getval(idx_y_floor,     x_floor + 1);
            pixel_t p01 = line_buffer.getval(idx_y_floor_plus1, x_floor);
            pixel_t p11 = line_buffer.getval(idx_y_floor_plus1, x_floor + 1);

            CORD_FP interp_val = p00*(1-dx)*(1-dy) + p10*dx*(1-dy) + p01*(1-dx)*dy + p11*dx*dy;
            output_pixel = interp_val.to_uint();

            // --- NEW SUPER-DEBUG PRINTF ---
            #ifdef DEBUG
              if (y_out == height / 2 && x == width / 2) {
                printf("\n--- DEBUG: CENTER PIXEL (LOGIC) ---\n");
                printf("  in_bounds check: PASSED\n");
                printf("  buf_y check: PASSED (idx_y_floor = %d, idx_y_floor_plus1 = %d)\n", idx_y_floor, idx_y_floor_plus1);
                printf("  Original pixel values: p00=%d, p10=%d, p01=%d, p11=%d\n", (int)p00, (int)p10, (int)p01, (int)p11);
                printf("  Interpolated value: %f\n", (float)interp_val);
                printf("  Final output_pixel value: %d\n", (int)output_pixel);
              }
            #endif
          }
//          #ifdef DEBUG
//          else if (y_out == height / 2 && x == width / 2) {
//            printf("\n--- DEBUG: CENTER PIXEL (LOGIC) ---\n");
//            printf("  in_bounds check: PASSED\n");
//            printf("  buf_y check: FAILED (buf_y = %d)\n", buf_y);
//          }
//          #endif
        }
        #ifdef DEBUG
        else if (y_out == height / 2 && x == width / 2) {
          printf("\n--- DEBUG: CENTER PIXEL (LOGIC) ---\n");
          printf("  in_bounds check: FAILED\n");
        }
        #endif

        ap_axiu<8,1,1,1> packet_out;
        packet_out.data = output_pixel;
        packet_out.keep = -1;
        packet_out.strb = -1;
        packet_out.last = (y_out == height - 1) && (x == width - 1);
        output_stream.write(packet_out);

        #ifdef DEBUG
          if (y_out == height / 2 && x == width / 2) {
            printf("\n--- DEBUG: OUTPUT PIXEL ---\n");
            printf("  Output pixel at (%d, %d): %d\n", x, y_out, (int)output_pixel);
          }
        #endif
      }
    }
  }
} // Closing brace for barrel_correction_accel

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
