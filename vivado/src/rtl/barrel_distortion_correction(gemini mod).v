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
  parameter DISTORTION_K1 = 8'h40, // Distortion coefficient K1 (signed 4.4 fixed point)
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

  // State machine parameters
  localparam [1:0] IDLE         = 2'd0;
  localparam [1:0] ACTIVE       = 2'd1;

  reg [1:0] state, next_state;

  // Coordinate tracking
  reg [COORD_WIDTH-1:0] input_x, input_y;   // Input pixel coordinates
  reg [COORD_WIDTH-1:0] output_x, output_y; // Output pixel coordinates
  reg [$clog2(BUFFER_LINES)-1:0] read_line_idx; // Moved declaration
  reg frame_active;
  reg buffer_ready;

  // Line buffer for pixel storage
  reg [DATA_WIDTH-1:0] line_buffer [0:BUFFER_LINES-1][0:WIDTH-1];
  reg [$clog2(BUFFER_LINES)-1:0] write_line_idx;
  reg [COORD_WIDTH-1:0] lines_stored;

  // Distortion calculation registers
  reg signed [COORD_WIDTH:0] dx, dy;           // Offset from center
  reg [31:0] r_squared;                        // Distance squared
  reg signed [COORD_WIDTH:0] src_x, src_y;    // Source coordinates after distortion

  // Output pixel and control
  reg [DATA_WIDTH-1:0] corrected_pixel;
  reg pixel_valid;
  reg signed [31:0] distortion_factor;
  reg signed [31:0] k1_term;

  // Frame control signals
  reg input_frame_start;
  reg output_frame_start;
  reg input_frame_end;
  reg output_frame_end;

  // State machine
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

  always @(*) begin
    next_state = state;
    case (state)
      IDLE: begin
        if (s_axis_tvalid && s_axis_tuser) // Start of frame
          next_state = ACTIVE;
      end
      ACTIVE: begin
        // Stay in ACTIVE until end of frame is processed and output is ready
        if (output_frame_end && m_axis_tvalid && m_axis_tready)
          next_state = IDLE;
      end
    endcase
  end

  // Input coordinate tracking and buffering
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      input_x <= 0;
      input_y <= 0;
      write_line_idx <= 0;
      lines_stored <= 0;
      frame_active <= 0;
      input_frame_start <= 0;
      input_frame_end <= 0;
    end else begin
      input_frame_start <= s_axis_tuser;
      input_frame_end <= s_axis_tlast;

      if (s_axis_tvalid && s_axis_tready) begin
        // Store pixel in line buffer
        line_buffer[write_line_idx][input_x] <= s_axis_tdata;

        if (s_axis_tuser) begin
          // Start of frame
          frame_active <= 1;
          input_x <= 1;
          input_y <= 0;
          write_line_idx <= 0;
          lines_stored <= 0;
        end else if (frame_active) begin
          if (input_x == WIDTH - 1) begin
            // End of line
            input_x <= 0;
            input_y <= input_y + 1;

            // Update line buffer pointer
            if (write_line_idx == BUFFER_LINES - 1) begin
              write_line_idx <= 0;
            end else begin
              write_line_idx <= write_line_idx + 1;
            end

            // Track number of lines stored
            if (lines_stored < BUFFER_LINES) begin
              lines_stored <= lines_stored + 1;
            end
          end else begin
            input_x <= input_x + 1;
          end
        end

        if (s_axis_tlast) begin
          frame_active <= 0;
        end
      end
    end
  end

  // Output coordinate tracking
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      output_x <= 0;
      output_y <= 0;
      output_frame_start <= 0;
      output_frame_end <= 0;
    end else if (state == ACTIVE) begin // Changed from PROCESS
      if (output_x == 0 && output_y == 0) begin
        output_frame_start <= 1;
      end else begin
        output_frame_start <= 0;
      end

      if (output_x == WIDTH - 1 && output_y == HEIGHT - 1) begin
        output_frame_end <= 1;
      end else begin
        output_frame_end <= 0;
      end
    end else if (state == ACTIVE && m_axis_tready) begin // Simplified condition
      output_frame_start <= 0;

      if (!output_frame_end) begin
        if (output_x == WIDTH - 1) begin
          output_x <= 0;
          output_y <= output_y + 1;
        end else begin
          output_x <= output_x + 1;
        end
      end
    end
  end

  // Barrel distortion calculation and pixel correction
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      dx <= 0;
      dy <= 0;
      r_squared <= 0;
      src_x <= 0;
      src_y <= 0;
      corrected_pixel <= 0;
      pixel_valid <= 0;
      k1_term <= 0;
      distortion_factor <= 0;
      read_line_idx <= 0;
    end else if (state == ACTIVE) begin // Changed from PROCESS
      // Calculate offset from center
      dx <= $signed(output_x) - $signed(CENTER_X);
      dy <= $signed(output_y) - $signed(CENTER_Y);

      // Calculate r^2 (distance squared from center)
      r_squared <= (dx * dx) + (dy * dy);

      // Apply barrel distortion correction
      // For barrel distortion: src = dst * (1 + k1*r^2)
      // Simplified calculation using fixed-point arithmetic
//      if (r_squared < 32'h100000) begin // Avoid overflow
        // Calculate distortion factor in 16.16 fixed point
//        k1_term = ($signed(r_squared) * $signed(DISTORTION_K1)) >>> 12; // Scale (32+4.12) for fixed point
        k1_term = ($signed(r_squared) * $signed(DISTORTION_K1)) >>> 4; // Scale (32+4.4) for fixed point
//        distortion_factor = 32'h10000 + k1_term;   // 1.0 + k1*r^2
        distortion_factor = 32'h10000 + k1_term;   // 1.0 + k1*r^2

        // Apply distortion
        src_x <= $signed(CENTER_X) + (($signed(dx) * $signed(distortion_factor)) >>> 16);
        src_y <= $signed(CENTER_Y) + (($signed(dy) * $signed(distortion_factor)) >>> 16);
//      end else begin
//        // For very large distances, use identity mapping
//        src_x <= output_x;
//        src_y <= output_y;
//      end

      // Sample pixel from line buffer
//      if (src_x >= 0  &&  src_x < WIDTH  &&  src_y >= 0  &&  src_y < input_y) begin
      if (src_x >= 0 && src_x < WIDTH && src_y >= 0 && src_y < input_y && src_y >= (input_y - lines_stored)) begin
        // Calculate which line buffer to read from
        // write_line_idx points to the line currently being written (input_y)
        // So, (input_y - src_y) is the offset from the current input line to the source line
        // We need to subtract this offset from write_line_idx to get the correct buffer index
        read_line_idx = (write_line_idx - (input_y - src_y) + BUFFER_LINES) % BUFFER_LINES;
//        read_line_idx <= (src_y < BUFFER_LINES) ? src_y : BUFFER_LINES-1;

        corrected_pixel <= line_buffer[read_line_idx][src_x[COORD_WIDTH-1:0]];
        pixel_valid <= 1;
      end else begin
        // Out of bounds or not available - use black
        corrected_pixel <= 0;
        pixel_valid <= 1; // Still valid, just black
      end
    end else begin
      pixel_valid <= 0;
    end
  end

  // AXI Stream control
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      s_axis_tready <= 0;
      m_axis_tvalid <= 0;
      m_axis_tdata <= 0;
      m_axis_tlast <= 0;
      m_axis_tuser <= 0;
    end else begin
      // s_axis_tready: Always ready to accept input when active
      s_axis_tready <= (state == IDLE) || (state == ACTIVE);

      // m_axis_tvalid: Output valid when we have a processed pixel and are in ACTIVE state
      m_axis_tvalid <= (state == ACTIVE) && pixel_valid;

      if (state == ACTIVE) begin
        m_axis_tdata <= corrected_pixel;
        m_axis_tlast <= output_frame_end;
        m_axis_tuser <= output_frame_start;
      end else begin
        m_axis_tdata <= 0;
        m_axis_tlast <= 0;
        m_axis_tuser <= 0;
      end
    end
  end

endmodule
