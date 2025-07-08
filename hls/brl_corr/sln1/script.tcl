############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project brl_corr
add_files src/brl_corr_hls.cpp
add_files src/brl_corr_hls.cpp
add_files -tb src/brl_corr_hls.cpp
add_files -tb src/brl_corr_hls.cpp
open_solution "sln1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 8.334 -name default
#source "./brl_corr/sln1/directives.tcl"
csim_design -ldflags {-DTESTBENCH}
csynth_design
cosim_design -ldflags {-DTESTBENCH}
export_design -format ip_catalog
