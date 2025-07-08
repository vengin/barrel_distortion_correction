//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Thu May 29 15:03:32 2025
//Host        : DESKTOP-OIK79P6 running 64-bit major release  (build 9200)
//Command     : generate_target bd_wrapper.bd
//Design      : bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_wrapper(
  input hdmi_rx_clk_n,
  input hdmi_rx_clk_p,
  input [2:0]hdmi_rx_data_n,
  input [2:0]hdmi_rx_data_p,
  output hdmi_rx_hpd,
  inout hdmi_rx_ddc_scl_io,
  inout hdmi_rx_ddc_sda_io,
  output hdmi_tx_clk_n,
  output hdmi_tx_clk_p,
  output [2:0]hdmi_tx_data_n,
  output [2:0]hdmi_tx_data_p,
  input sys_clk
);

  wire hdmi_rx_clk_n;
  wire hdmi_rx_clk_p;
  wire [2:0]hdmi_rx_data_n;
  wire [2:0]hdmi_rx_data_p;
  wire hdmi_rx_ddc_scl_i;
  wire hdmi_rx_ddc_scl_io;
  wire hdmi_rx_ddc_scl_o;
  wire hdmi_rx_ddc_scl_t;
  wire hdmi_rx_ddc_sda_i;
  wire hdmi_rx_ddc_sda_io;
  wire hdmi_rx_ddc_sda_o;
  wire hdmi_rx_ddc_sda_t;
  wire hdmi_tx_clk_n;
  wire hdmi_tx_clk_p;
  wire [2:0]hdmi_tx_data_n;
  wire [2:0]hdmi_tx_data_p;
  wire sys_clk;
  //
  assign hdmi_rx_hpd = 1'b0;

  bd bd_i(
    .hdmi_rx_clk_n(hdmi_rx_clk_n),
    .hdmi_rx_clk_p(hdmi_rx_clk_p),
    .hdmi_rx_data_n(hdmi_rx_data_n),
    .hdmi_rx_data_p(hdmi_rx_data_p),
    .hdmi_rx_ddc_scl_i(hdmi_rx_ddc_scl_i),
    .hdmi_rx_ddc_scl_o(hdmi_rx_ddc_scl_o),
    .hdmi_rx_ddc_scl_t(hdmi_rx_ddc_scl_t),
    .hdmi_rx_ddc_sda_i(hdmi_rx_ddc_sda_i),
    .hdmi_rx_ddc_sda_o(hdmi_rx_ddc_sda_o),
    .hdmi_rx_ddc_sda_t(hdmi_rx_ddc_sda_t),
    .hdmi_tx_clk_n(hdmi_tx_clk_n),
    .hdmi_tx_clk_p(hdmi_tx_clk_p),
    .hdmi_tx_data_n(hdmi_tx_data_n),
    .hdmi_tx_data_p(hdmi_tx_data_p),
    .sys_clk(sys_clk)
  );

  IOBUF hdmi_rx_ddc_scl_iobuf
    (.I(hdmi_rx_ddc_scl_o),
    .IO(hdmi_rx_ddc_scl_io),
    .O(hdmi_rx_ddc_scl_i),
    .T(hdmi_rx_ddc_scl_t)
  );
  IOBUF hdmi_rx_ddc_sda_iobuf
    (.I(hdmi_rx_ddc_sda_o),
    .IO(hdmi_rx_ddc_sda_io),
    .O(hdmi_rx_ddc_sda_i),
    .T(hdmi_rx_ddc_sda_t)
  );

endmodule
