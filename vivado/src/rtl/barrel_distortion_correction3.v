// Barrel Distortion Correction Module with AXI4-Stream Interface
// Memory-optimized for XC7Z020 FPGA (Pynq-Z2)
// MINIMAL FIX VERSION: Only fixing the critical buffer indexing issue

module barrel_distortion_correction #(
  parameter WIDTH = 1920,          // Image width
  parameter HEIGHT = 1080,         // Image height  
  parameter DATA_WIDTH = 24,       // Pixel data width (RGB888)
  parameter COORD_WIDTH = 16,      // Coordinate width
  parameter DISTORTION_K1 = 8'h40, // Distortion coefficient K1 (signed 4.4 fixed point)
  parameter BUFFER_LINES = 4       // Number of line buffers
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
  localparam [2:0] IDLE         = 3'd0;
  localparam [2:0] FILL_BUFFER  = 3'd1;
  localparam [2:0] PROCESS      = 3'd2;
  localparam [2:0] OUTPUT_PIXEL = 3'd3;
  localparam [2:0] WAIT_READY   = 3'd4;

  reg [2:0] state, next_state;

  // Coordinate tracking
  reg [COORD_WIDTH-1:0] input_x, input_y;   // Input pixel coordinates
  reg [COORD_WIDTH-1:0] output_x, output_y; // Output pixel coordinates
  reg [$clog2(BUFFER_LINES)-1:0] read_line_idx;
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
  reg signed [31:32] k1_term;

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
          next_state = FILL_BUFFER;
      end
      FILL_BUFFER: begin
        if (lines_stored >= BUFFER_LINES || (s_axis_tlast && s_axis_tvalid))
          next_state = PROCESS;
      end
      PROCESS: begin
        next_state = OUTPUT_PIXEL;
      end
      OUTPUT_PIXEL: begin
        if (m_axis_tready) begin
          if (output_frame_end)
            next_state = IDLE;
          else
            next_state = PROCESS;
        end else begin
          next_state = WAIT_READY;
        end
      end
      WAIT_READY: begin
        if (m_axis_tready) begin
          if (output_frame_end)
            next_state = IDLE;
          else
            next_state = PROCESS;
        end
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
    end else if (state == PROCESS) begin
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
    end else if ((state == OUTPUT_PIXEL || state == WAIT_READY) && m_axis_tready) begin
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
    end else if (state == PROCESS) begin
      // Calculate offset from center
      dx <= $signed(output_x) - $signed(CENTER_X);
      dy <= $signed(output_y) - $signed(CENTER_Y);

      // Calculate r^2 (distance squared from center)
      r_squared <= (dx * dx) + (dy * dy);

      // Apply barrel distortion correction
      k1_term = ($signed(r_squared) * $signed(DISTORTION_K1)) >>> 4;
      distortion_factor = 32'h10000 + k1_term;   // 1.0 + k1*r^2

      // Apply distortion
      src_x <= $signed(CENTER_X) + (($signed(dx) * $signed(distortion_factor)) >>> 16);
      src_y <= $signed(CENTER_Y) + (($signed(dy) * $signed(distortion_factor)) >>> 16);

      // Sample pixel from line buffer - FIXED BOUNDS CHECKING
      if (src_x >= 0 && src_x < WIDTH && src_y >= 0 && src_y < HEIGHT) begin
        // Check if the required line is available in our circular buffer
        // For limited buffer: check if src_y is within the buffered range
        if (lines_stored >= BUFFER_LINES) begin
          // Buffer is full - check if line is in current window
          // Current window: [input_y - BUFFER_LINES + 1, input_y]
          if (src_y >= (input_y - BUFFER_LINES + 1) && src_y <= input_y) begin
            // Calculate buffer index using proper modulo arithmetic
            // The line at input_y is at write_line_idx-1 (or BUFFER_LINES-1 if write_line_idx==0)
            // The line at input_y-1 is at write_line_idx-2, etc.
            read_line_idx <= (write_line_idx - (input_y - src_y) + BUFFER_LINES) % BUFFER_LINES;
            corrected_pixel <= line_buffer[(write_line_idx - (input_y - src_y) + BUFFER_LINES) % BUFFER_LINES][src_x[COORD_WIDTH-1:0]];
            pixel_valid <= 1;
          end else begin
            // Line not available in buffer
            corrected_pixel <= 0;
            pixel_valid <= 1;
          end
        end else begin
          // Buffer not full yet - simpler check
          if (src_y < lines_stored) begin
            read_line_idx <= src_y % BUFFER_LINES;
            corrected_pixel <= line_buffer[src_y % BUFFER_LINES][src_x[COORD_WIDTH-1:0]];
            pixel_valid <= 1;
          end else begin
            corrected_pixel <= 0;
            pixel_valid <= 1;
          end
        end
      end else begin
        // Out of image bounds
        corrected_pixel <= 0;
        pixel_valid <= 1;
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
      // Input ready when in IDLE, FILL_BUFFER, or when we need more data
      s_axis_tready <= (state == IDLE) || (state == FILL_BUFFER);

      // Output valid when we have a processed pixel
      m_axis_tvalid <= (state == OUTPUT_PIXEL) || (state == WAIT_READY);

      if (state == OUTPUT_PIXEL || state == WAIT_READY) begin
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