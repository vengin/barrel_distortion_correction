############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hls_brl_corr1
add_files hls_brl_corr1/src/brl_corr_hls.cpp
add_files hls_brl_corr1/src/brl_corr_hls.h
add_files -tb hls_brl_corr1/src/brl_corr_hls_tb.cpp -cflags "-DDEBUG"
open_solution "sln1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 8.334 -name default
#source "./hls_brl_corr1/sln1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -format ip_catalog
