// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu May 29 15:11:31 2025
// Host        : DESKTOP-OIK79P6 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/work/vivado/pynq/hdmi_io/hdmi_io.srcs/sources_1/bd/bd/ip/bd_clk_wiz_0_0/bd_clk_wiz_0_0_stub.v
// Design      : bd_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module bd_clk_wiz_0_0(clk_out1, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_in1" */;
  output clk_out1;
  input clk_in1;
endmodule
