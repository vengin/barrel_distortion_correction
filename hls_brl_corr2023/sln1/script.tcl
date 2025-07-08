############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project hls_brl_corr2023
add_files hls_brl_corr2023/src/brl_corr_hls.cpp
add_files -tb hls_brl_corr2023/src/brl_corr_hls.cpp
open_solution "sln1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 8.334 -name default
#source "./hls_brl_corr2023/sln1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
