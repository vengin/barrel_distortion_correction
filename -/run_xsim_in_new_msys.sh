#!/bin/bash
# Wrapper script to run xsim in a new MSYS Bash instance

# Get the absolute path to the setup script
SETUP_SCRIPT_PATH="$(pwd)/setup_vivado_msys_fixed.sh"

# Launch a new MSYS Bash instance and execute commands within it
# The --login option ensures a full login shell environment is set up
# The -c option executes the string as a command
/usr/bin/bash --login -c "source \"${SETUP_SCRIPT_PATH}\" && /c/Xilinx/Vivado/2017.4/bin/unwrapped/win64.o/xsim.exe -help"
