#!/bin/bash
# Script to compile barrel_distortion_correction.v and barrel_distortion_correction_tb.v using Vivado xvlog in Git Bash

# Source the Vivado setup script for Git Bash
# Use absolute path for sourcing to ensure it works regardless of current directory
source "$(pwd)/setup_vivado_git_bash.sh"

# Define paths to source files
DUT_DIR="../vivado/src/rtl" # Relative to the current working directory
TB_DIR="../vivado/src/tb"
TB_FILE="${TB_DIR}/barrel_distortion_correction_tb.v"
DUT_FILE="${DUT_DIR}/barrel_distortion_correction.v"

# Define simulation output directory
SIM_DIR="sim_out"
mkdir -p "${SIM_DIR}"
cd "${SIM_DIR}"

# Compile Verilog files
echo "Compiling Verilog files with xvlog..."
xvlog --sv "${DUT_FILE}" "${TB_FILE}"

#echo "xvlog compilation complete. Check xvlog.log in ${SIM_DIR} for details."
