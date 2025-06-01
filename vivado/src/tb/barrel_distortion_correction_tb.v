// Testbench for Barrel Distortion Correction
module tb_barrel_distortion_correction #(
  parameter WIDTH = 128,           // Default width for image
  parameter HEIGHT = 100,          // Default height for image
  parameter DATA_WIDTH = 24,       // Pixel data width (RGB888)
  parameter CLK_PERIOD = 10,       // Clock period in ns
  parameter string INPUT_RAW_FILE = "D:/work/vivado/pynq/barrel_distortion_correction/vivado/src/tb/sim_out/img_128x100_in.txt",
  parameter string OUTPUT_RAW_FILE = "D:/work/vivado/pynq/barrel_distortion_correction/vivado/src/tb/sim_out/img_128x100_out.txt"
//  parameter string INPUT_RAW_FILE = "input_pixels.txt",
//  parameter string OUTPUT_RAW_FILE = "output_pixels.txt"
);

  // Clock and reset
  reg clk;
  reg rst_n;

  // AXI Stream signals
  reg [DATA_WIDTH-1:0] s_axis_tdata;
  reg s_axis_tvalid;
  reg s_axis_tlast;
  reg s_axis_tuser;
  wire s_axis_tready;

  wire [DATA_WIDTH-1:0] m_axis_tdata;
  wire m_axis_tvalid;
  wire m_axis_tlast;
  wire m_axis_tuser;
  reg m_axis_tready;

  // File handles
  integer input_file_handle;
  integer output_file_handle;

  // Temporary storage for input pixels (for $readmemh)
  reg [DATA_WIDTH-1:0] input_pixels_mem [0:WIDTH*HEIGHT-1];

  integer i, pixel_count, output_count;

  // Instantiate DUT
  barrel_distortion_correction #(
    .WIDTH(WIDTH),
    .HEIGHT(HEIGHT),
    .DATA_WIDTH(DATA_WIDTH),
    .DISTORTION_K1(16'h0100), // Moderate barrel distortion
    .DISTORTION_K2(16'h0020),
    //.BUFFER_LINES(4) // Use a reasonable number of buffer lines, not full height
    .BUFFER_LINES(HEIGHT) // Use a reasonable number of buffer lines, not full height
  ) dut (
    .clk(clk),
    .rst_n(rst_n),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tlast(s_axis_tlast),
    .s_axis_tuser(s_axis_tuser),
    .s_axis_tready(s_axis_tready),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tuser(m_axis_tuser),
    .m_axis_tready(m_axis_tready)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk = ~clk;
  end

  // Test stimulus
  initial begin
    // Initialize signals
    rst_n = 0;
    s_axis_tdata = 0;
    s_axis_tvalid = 0;
    s_axis_tlast = 0;
    s_axis_tuser = 0;
    m_axis_tready = 1;
    pixel_count = 0;
    output_count = 0;

    // Open input and output files
    input_file_handle = $fopen(INPUT_RAW_FILE, "r");
    if (input_file_handle == 0) begin
      $display("ERROR: Could not open input file %s", INPUT_RAW_FILE);
      $finish;
    end
    $readmemh(INPUT_RAW_FILE, input_pixels_mem); // Read all pixels into memory

    output_file_handle = $fopen(OUTPUT_RAW_FILE, "w");
    if (output_file_handle == 0) begin
      $display("ERROR: Could not open output file %s", OUTPUT_RAW_FILE);
      $finish;
    end

    // Reset sequence
    #(CLK_PERIOD*5);
    rst_n = 1;
    #(CLK_PERIOD*2);

    $display("Starting passthrough test with image input...");
    $display("Input resolution: %dx%d", WIDTH, HEIGHT);
    $display("Reading from: %s", INPUT_RAW_FILE);
    $display("Writing to: %s", OUTPUT_RAW_FILE);

    // Send test frame and receive output
    fork
      // Input thread
      begin
        for (i = 0; i < WIDTH * HEIGHT; i++) begin
          wait(s_axis_tready);
          @(posedge clk);
          s_axis_tdata = input_pixels_mem[i]; // Read from loaded memory
          s_axis_tvalid = 1;
          s_axis_tuser = (i == 0) ? 1 : 0; // Start of frame
          s_axis_tlast = (i == WIDTH * HEIGHT - 1) ? 1 : 0; // End of frame
          @(posedge clk);
          s_axis_tvalid = 0;
          s_axis_tuser = 0;
          s_axis_tlast = 0;
        end
        $display("Input frame sent successfully");
      end

      // Output thread
      begin
        while (output_count < WIDTH * HEIGHT) begin
          @(posedge clk); // Wait for clock edge
          if (m_axis_tvalid && m_axis_tready) begin // Only process if both valid and ready
            $fdisplay(output_file_handle, "%h", m_axis_tdata); // Write to file
            if (m_axis_tuser) begin
              $display("Start of output frame detected");
            end
            if (m_axis_tlast) begin
              $display("End of output frame detected");
            end
            output_count++;
          end
        end
        $display("Output frame received successfully");
      end
    join

    $display("Simulation complete. Raw output saved to %s", OUTPUT_RAW_FILE);

    // Close files
    $fclose(input_file_handle);
    $fclose(output_file_handle);

    #(CLK_PERIOD*10);
    $finish;
  end

  // Monitor AXI transactions
  always @(posedge clk) begin
    if (s_axis_tvalid && s_axis_tready) begin
      pixel_count++;
      if (pixel_count % 1000 == 0) begin
        $display("Sent %d pixels", pixel_count);
      end
    end
  end

  // Timeout watchdog
  initial begin
    #(CLK_PERIOD * 200000);
    $display("ERROR: Testbench timeout!");
    $finish;
  end

  // Waveform dump
  initial begin
    $dumpfile("barrel_distortion_tb.vcd");
    $dumpvars(0, tb_barrel_distortion_correction);
  end

endmodule
