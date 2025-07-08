#!/bin/bash
# Setup script for Vivado environment in Git Bash

export XILINX_VIVADO='/c/Xilinx/Vivado/2017.4'

# Construct the new path components
VIVADO_BIN_PATH="/c/Xilinx/Vivado/2017.4/bin"
VIVADO_LIB_PATH="/c/Xilinx/Vivado/2017.4/lib/win64.o"
PYTHON_PATH="/c/PF/Python"

# Prepend Vivado paths to the existing PATH
if [ -n "${PATH}" ]; then
  export PATH="${VIVADO_BIN_PATH}:${VIVADO_LIB_PATH}:${PYTHON_PATH}:${PATH}"
else
  export PATH="${VIVADO_BIN_PATH}:${VIVADO_LIB_PATH}:${PYTHON_PATH}"
fi
