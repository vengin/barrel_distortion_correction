// Testbench for Barrel Distortion Correction
module tb_barrel_distortion_correction;

    parameter WIDTH = 1280;
    parameter HEIGHT = 720;
    parameter DATA_WIDTH = 24;
    parameter CLK_PERIOD = 10;
    
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
    
    // Test image data
    reg [DATA_WIDTH-1:0] test_image [0:WIDTH*HEIGHT-1];
    reg [DATA_WIDTH-1:0] output_image [0:WIDTH*HEIGHT-1];
    
    integer i, j, pixel_count, output_count;
    
    // Instantiate DUT
    barrel_distortion_correction #(
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT),
        .DATA_WIDTH(DATA_WIDTH),
        .DISTORTION_K1(16'h0100), // Moderate barrel distortion
        .DISTORTION_K2(16'h0020)
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
        
        // Generate test pattern (gradient + checkerboard)
        for (i = 0; i < HEIGHT; i++) begin
            for (j = 0; j < WIDTH; j++) begin
                if ((i/8 + j/8) % 2 == 0) begin
                    // Checkerboard pattern
                    test_image[i*WIDTH + j] = 24'hFFFFFF; // White
                end else begin
                    test_image[i*WIDTH + j] = 24'h000000; // Black
                end
            end
        end
        
        // Reset sequence
        #(CLK_PERIOD*5);
        rst_n = 1;
        #(CLK_PERIOD*2);
        
        $display("Starting barrel distortion correction test...");
        $display("Input resolution: %dx%d", WIDTH, HEIGHT);
        
        // Send test frame
        fork
            // Input thread
            begin
                for (i = 0; i < WIDTH * HEIGHT; i++) begin
                    wait(s_axis_tready);
                    @(posedge clk);
                    s_axis_tdata = test_image[i];
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
                    wait(m_axis_tvalid);
                    if (m_axis_tready) begin
                        output_image[output_count] = m_axis_tdata;
                        if (m_axis_tuser) begin
                            $display("Start of output frame detected");
                        end
                        if (m_axis_tlast) begin
                            $display("End of output frame detected");
                        end
                        output_count++;
                    end
                    @(posedge clk);
                end
                $display("Output frame received successfully");
            end
        join
        
        // Verify output
        $display("Verifying output...");
        
        // Check for basic sanity - non-zero pixels should exist
        integer non_zero_pixels = 0;
        for (i = 0; i < WIDTH * HEIGHT; i++) begin
            if (output_image[i] != 0) begin
                non_zero_pixels++;
            end
        end
        
        $display("Non-zero output pixels: %d/%d", non_zero_pixels, WIDTH * HEIGHT);
        
        if (non_zero_pixels > WIDTH * HEIGHT / 4) begin
            $display("TEST PASSED: Barrel distortion correction appears functional");
        end else begin
            $display("TEST FAILED: Too few non-zero pixels in output");
        end
        
        // Display some sample outputs for manual verification
        $display("\nSample output pixels:");
        for (i = 0; i < 10; i++) begin
            $display("Pixel[%d]: Input=0x%06h, Output=0x%06h", 
                    i, test_image[i], output_image[i]);
        end
        
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
        #(CLK_PERIOD * 100000);
        $display("ERROR: Testbench timeout!");
        $finish;
    end
    
    // Waveform dump
    initial begin
        $dumpfile("barrel_distortion_tb.vcd");
        $dumpvars(0, tb_barrel_distortion_correction);
    end

endmodule