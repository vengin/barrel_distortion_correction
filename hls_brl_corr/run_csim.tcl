open_project hls_brl_corr
open_solution sln1
add_files src/brl_corr_hls.cpp
add_files -tb src/brl_corr_hls_tb.cpp
add_files src/brl_corr_hls.h
set_top barrel_correction_simple
csim_design
exit
