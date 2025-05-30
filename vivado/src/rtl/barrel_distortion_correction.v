// Barrel Distortion Correction Module with AXI4-Stream Interface
// Memory-optimized for XC7Z020 FPGA (Pynq-Z2)
// SCALABLE DESIGN: Memory usage depends only on WIDTH, not HEIGHT!
//
// BRAM Analysis for XC7Z020:
// - Total BRAM: 280 × 18Kb = 5.04Mb = 630KB
// - Line buffer memory = BUFFER_LINES × WIDTH × DATA_WIDTH bits
//
// SUPPORTED RESOLUTIONS (with 4 line buffers, 24-bit RGB):
// - 1920×1080 (FullHD): 4 × 1920 × 24 = 184KB "+" FITS!
// - 1280×720  (HD):     4 × 1280 × 24 = 123KB "+" FITS!
// - 3840×2160 (4K):     4 × 3840 × 24 = 369KB "+" FITS!
// - 7680×4320 (8K):     4 × 7680 × 24 = 738KB "=" TIGHT
//
// The HEIGHT can be virtually unlimited since we only buffer few lines!

module barrel_distortion_correction #(
  parameter WIDTH = 1920,          // Can be very large! (FullHD width)
  parameter HEIGHT = 1080,         // Can be virtually unlimited!
  parameter DATA_WIDTH = 24,       // Pixel data width (RGB888)
  parameter COORD_WIDTH = 16,      // Coordinate width
  parameter DISTORTION_K1 = 16'h0200, // Distortion coefficient K1 (signed 4.12 fixed point)
  parameter DISTORTION_K2 = 16'h0040, // Distortion coefficient K2 (signed 4.12 fixed point)
  parameter BUFFER_LINES = 4       // Usually 4 is enough for most barrel distortion
)(
  input wire clk,
  input wire rst_n,

  // AXI4-Stream Slave Interface (Input)
  input wire [DATA_WIDTH-1:0] s_axis_tdata,
  input wire s_axis_tvalid,
  input wire s_axis_tlast,
  input wire s_axis_tuser,  // Start of frame
  output reg s_axis_tready,

  // AXI4-Stream Master Interface (Output)
  output reg [DATA_WIDTH-1:0] m_axis_tdata,
  output reg m_axis_tvalid,
  output reg m_axis_tlast,
  output reg m_axis_tuser,  // Start of frame
  input wire m_axis_tready
);

  // Constants for center calculation
  localparam CENTER_X = WIDTH / 2;
  localparam CENTER_Y = HEIGHT / 2;

  // State machine
  // State machine parameters (equivalent to enum)
  localparam [2:0] IDLE         = 3'd0;
  localparam [2:0] READ_PIXEL   = 3'd1;
  localparam [2:0] CALC_COORDS  = 3'd2;
  localparam [2:0] INTERPOLATE  = 3'd3;
  localparam [2:0] OUTPUT_PIXEL = 3'd4;

  reg [2:0] state, next_state;

  // Coordinate tracking
  reg [COORD_WIDTH-1:0] out_x, out_y;

  // Distortion calculation registers
  reg signed [COORD_WIDTH:0] dx, dy;           // Offset from center
  reg [31:0] r_squared;                        // Distance squared
  reg [31:0] distortion_factor;                // Distortion multiplication factor
  reg signed [COORD_WIDTH:0] src_x, src_y;    // Source coordinates

  // Line buffer for bilinear interpolation (configurable lines)
  // Memory usage: BUFFER_LINES × WIDTH × DATA_WIDTH bits
  // For 320×240×24bit with 4 lines: 4 × 320 × 24 = 30,720 bits = 3.84KB
  reg [DATA_WIDTH-1:0] line_buffer [0:BUFFER_LINES-1][0:WIDTH-1];
  reg [DATA_WIDTH-1:0] current_pixel;
  reg [$clog2(BUFFER_LINES)-1:0] buffer_write_line;
  reg [COORD_WIDTH-1:0] buffer_write_addr;
  reg [COORD_WIDTH-1:0] current_input_line;

  // Pipeline registers
  reg [DATA_WIDTH-1:0] input_pixel_reg;
  reg input_valid_reg;
  reg input_last_reg;
  reg input_user_reg;
  reg tuser_pipe1, tuser_pipe2;
  reg tlast_pipe1, tlast_pipe2;

  // Output control
  reg output_ready;
  reg skip_pixel;  // For out-of-bounds pixels

  // Multiplication pipeline for distortion calculation
  reg [31:0] mult_stage1, mult_stage2;
  reg [15:0] k1_mult, k2_mult;

  // Debug signals for interpolation condition
  reg signed [COORD_WIDTH-1:0] debug_src_y;
  reg signed [COORD_WIDTH-1:0] debug_lower_bound;
  reg signed [COORD_WIDTH-1:0] debug_upper_bound;
  reg debug_cond_part1;
  reg debug_cond_part2;

  // State machine logic
  always @(posedge clk) begin
    if (!rst_n) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

  always @* begin
    next_state = state;
    case (state)
      IDLE: begin
        if (s_axis_tvalid && s_axis_tready)
          next_state = READ_PIXEL;
      end
      READ_PIXEL: begin
        next_state = CALC_COORDS;
      end
      CALC_COORDS: begin
        next_state = INTERPOLATE;
      end
      INTERPOLATE: begin
        next_state = OUTPUT_PIXEL;
      end
      OUTPUT_PIXEL: begin
        if (m_axis_tready) begin
          if (out_y == HEIGHT - 1 && out_x == WIDTH - 1)
            next_state = IDLE;
          else if (s_axis_tvalid)
            next_state = READ_PIXEL;
          else
            next_state = IDLE;
        end
      end
    endcase
  end

  // Input data pipeline
  always @(posedge clk) begin
    if (!rst_n) begin
      input_pixel_reg <= 0;
      input_valid_reg <= 0;
      input_last_reg <= 0;
      input_user_reg <= 0;
      tuser_pipe1 <= 0;
      tuser_pipe2 <= 0;
      tlast_pipe1 <= 0;
      tlast_pipe2 <= 0;
    end else begin
      if (s_axis_tvalid && s_axis_tready) begin
        input_pixel_reg <= s_axis_tdata;
        input_valid_reg <= s_axis_tvalid;
        input_last_reg <= s_axis_tlast;
        input_user_reg <= s_axis_tuser;
      end
      // Pipeline tuser and tlast
      tuser_pipe1 <= input_user_reg;
      tuser_pipe2 <= tuser_pipe1;
      tlast_pipe1 <= input_last_reg;
      tlast_pipe2 <= tlast_pipe1;
    end
  end

  // Line buffer management
  always @(posedge clk) begin
    if (!rst_n) begin
      buffer_write_addr <= 0;
      buffer_write_line <= 0;
      current_input_line <= 0;
    end else if (state == READ_PIXEL) begin
      line_buffer[buffer_write_line][buffer_write_addr] <= input_pixel_reg;

      if (buffer_write_addr == WIDTH - 1) begin
        buffer_write_addr <= 0;
        current_input_line <= current_input_line + 1;
        if (buffer_write_line == BUFFER_LINES - 1) begin
          buffer_write_line <= 0;
        end else begin
          buffer_write_line <= buffer_write_line + 1;
        end
      end else begin
        buffer_write_addr <= buffer_write_addr + 1;
      end
    end
  end

  // Output coordinate tracking
  always @(posedge clk) begin
    if (!rst_n) begin
      out_x <= 0;
      out_y <= 0;
    end else if (state == OUTPUT_PIXEL && m_axis_tready) begin
      if (out_x == WIDTH - 1) begin
        out_x <= 0;
        if (out_y == HEIGHT - 1) begin
          out_y <= 0;
        end else begin
          out_y <= out_y + 1;
        end
      end else begin
        out_x <= out_x + 1;
      end
    end
  end

  // Barrel distortion calculation
  always @(posedge clk) begin
    if (!rst_n) begin
      dx <= 0;
      dy <= 0;
      r_squared <= 0;
      distortion_factor <= 32'h1000; // 1.0 in 4.12 fixed point
      src_x <= 0;
      src_y <= 0;
    end else if (state == CALC_COORDS) begin
      // Calculate offset from center
      dx <= out_x - CENTER_X;
      dy <= out_y - CENTER_Y;

      // Calculate r^2 (distance squared from center)
      r_squared <= (dx * dx) + (dy * dy);

      // Calculate distortion factor: 1 + k1*r^2 + k2*r^4
      // Simplified to: 1 + k1*r^2 for performance
      k1_mult <= (r_squared[15:0] * DISTORTION_K1) >> 12;
      distortion_factor <= 32'h1000 + k1_mult; // 1.0 + k1*r^2

      // Apply distortion to get source coordinates
      src_x <= CENTER_X + ((dx * distortion_factor) >> 12);
      src_y <= CENTER_Y + ((dy * distortion_factor) >> 12);
    end
  end

  // Bilinear interpolation with multiple line buffers
  always @(posedge clk) begin
    if (!rst_n) begin
      current_pixel <= 0;
      skip_pixel <= 0;
    end else if (state == INTERPOLATE) begin
      // Check bounds
      if (src_x >= 0 && src_x < WIDTH && src_y >= 0 && src_y < HEIGHT) begin : interpolation_block
        // Calculate which line buffer to read from
        reg [$clog2(BUFFER_LINES)-1:0] src_line_idx_calc;
        reg signed [COORD_WIDTH:0] line_diff;

        // Check if src_y is within the currently buffered lines
        // Buffered lines range from (current_input_line - BUFFER_LINES + 1) to current_input_line
        // Check if src_y is within the currently buffered lines
        // Buffered lines range from (current_input_line - BUFFER_LINES + 1) to current_input_line
        debug_lower_bound = current_input_line - BUFFER_LINES + 1;
        debug_upper_bound = current_input_line;
        debug_cond_part1 = (src_y >= debug_lower_bound);
        debug_cond_part2 = (src_y <= debug_upper_bound);

        if (debug_cond_part1 && debug_cond_part2) begin
          src_line_idx_calc = src_y[COORD_WIDTH-1:0] % BUFFER_LINES;
          
          // Use nearest neighbor sampling for simplicity
          current_pixel <= line_buffer[src_line_idx_calc][src_x[COORD_WIDTH-1:0]];
          skip_pixel <= 0;
        end else begin
          // src_y is out of buffered range (either too early or too late)
          current_pixel <= 24'h000000; // Black for out-of-bounds or not-yet-buffered
          skip_pixel <= 1;
        end
      end else begin
        // src_x or src_y are out of image bounds or contain X/Z values
        current_pixel <= 24'h000000; // Black for out-of-bounds
        skip_pixel <= 1;
      end
    end
  end

  // AXI Stream control signals
  always @(posedge clk) begin
    if (!rst_n) begin
      s_axis_tready <= 0;
      m_axis_tvalid <= 0;
      m_axis_tdata <= 0;
      m_axis_tlast <= 0;
      m_axis_tuser <= 0;
    end else begin
      // Input ready when we can accept data
      s_axis_tready <= (state == IDLE) || (state == OUTPUT_PIXEL && m_axis_tready);

      // Output valid when we have processed pixel
      m_axis_tvalid <= (state == OUTPUT_PIXEL);

      if (state == OUTPUT_PIXEL) begin
        m_axis_tdata <= current_pixel;
        // m_axis_tlast <= (out_x == WIDTH - 1 && out_y == HEIGHT - 1);
        // m_axis_tuser <= frame_start;
        m_axis_tlast <= tlast_pipe2;
        m_axis_tuser <= tuser_pipe2;
      end
    end
  end

endmodule
