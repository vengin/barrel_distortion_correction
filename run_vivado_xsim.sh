#!/bin/bash
# Script to setup Vivado environment and run xsim, based on user's working manual commands

export XILINX_VIVADO='/c/Xilinx/Vivado/2017.4'
VIVADO_BIN_PATH="/c/Xilinx/Vivado/2017.4/bin"
VIVADO_LIB_PATH="/c/Xilinx/Vivado/2017.4/lib/win64.o"
export PATH="${VIVADO_BIN_PATH}:${VIVADO_LIB_PATH}:${PATH}"

# Now run xsim
xsim -help
