#!/bin/bash
# Setup script for Vivado environment in MSYS Bash (FIXED)

# Corrected paths for MSYS Bash
export XILINX_VIVADO='/c/Xilinx/Vivado/2017.4'
export XILINX_VIVADO_JAVA_HOME='/c/Xilinx/Vivado/2017.4/tps/win64/jre'

# Construct the new path components
VIVADO_BIN_PATH="/c/Xilinx/Vivado/2017.4/bin"
VIVADO_UNWRAPPED_BIN_PATH="/c/Xilinx/Vivado/2017.4/bin/unwrapped/win64.o"
VIVADO_LIB_PATH="/c/Xilinx/Vivado/2017.4/lib/win64.o"
VIVADO_CRT_PATH="/c/Xilinx/Vivado/2017.4/bin/unwrapped/win64.o/Microsoft.VC140.CRT"

# Prepend Vivado paths to the existing PATH
# This ensures Vivado's executables are found first.
if [ -n "${PATH}" ]; then
  export PATH="${VIVADO_CRT_PATH}:${VIVADO_UNWRAPPED_BIN_PATH}:${VIVADO_BIN_PATH}:${VIVADO_LIB_PATH}:${PATH}"
else
  export PATH="${VIVADO_CRT_PATH}:${VIVADO_UNWRAPPED_BIN_PATH}:${VIVADO_BIN_PATH}:${VIVADO_LIB_PATH}"
fi

# Explicitly set LD_LIBRARY_PATH for DLL loading in MSYS
if [ -n "${LD_LIBRARY_PATH}" ]; then
  export LD_LIBRARY_PATH="${VIVADO_CRT_PATH}:${LD_LIBRARY_PATH}"
else
  export LD_LIBRARY_PATH="${VIVADO_CRT_PATH}"
fi
