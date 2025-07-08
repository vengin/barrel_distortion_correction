############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hls_brl_corr
set_top barrel_correction_simple
add_files brl_corr_hls.h
add_files brl_corr_hls.cpp
add_files hls_brl_corr/src/brl_corr_hls.cpp
add_files hls_brl_corr/src/brl_corr_hls.h
add_files -tb brl_corr_hls_tb.cpp
add_files -tb hls_brl_corr/src/brl_corr_hls_tb.cpp
open_solution "sln1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 8.334 -name default
#source "./hls_brl_corr/sln1/directives.tcl"
csim_design -clean
csynth_design
cosim_design
export_design -format ip_catalog
