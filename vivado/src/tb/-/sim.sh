#!/bin/bash
# Script to simulate barrel_distortion_correction_tb.v using Vivado XSim in Git Bash

# Source the Vivado setup script for Git Bash
# Use absolute path for sourcing to ensure it works regardless of current directory
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

echo $PATH
xsim -help
#xvlog -version

# # --- Configuration ---
# # Paths to source files
# DUT_DIR="../rtl"
# TB_DIR="$(pwd)"
# PYTHON_SCRIPTS_DIR="${TB_DIR}" # Python scripts are now in the testbench directory

# DUT_FILE="${DUT_DIR}/barrel_distortion_correction.v"
# TB_FILE="${TB_DIR}/barrel_distortion_correction_tb.v"

# # Image paths and dimensions (UPDATE THESE FOR YOUR IMAGE)
# INPUT_IMAGE="img_in/img00.bmp" # Your input image file (e.g., input.png, input.jpg)
# OUTPUT_IMAGE="mg_in/img00.bmp" # Desired output image file
# IMAGE_WIDTH=125 # Width of your input image
# IMAGE_HEIGHT=720 # Height of your input image

# # Raw pixel data files (intermediate files for simulation)
# SIM_DIR="sim_out"
# INPUT_RAW_FILE="input_pixels.txt"
# OUTPUT_RAW_FILE="output_pixels.txt"

# # --- Setup Simulation Directory ---
# mkdir -p "${SIM_DIR}"
# # Change to simulation output directory for Vivado tools
# cd "${SIM_DIR}"

# # --- Step 1: Convert Input Image to Raw Pixel Data ---
# printf "\nStep 1: Converting input image '${INPUT_IMAGE}' to raw pixel data..."
# # Ensure python is in PATH or use full path to python executable
# python "${PYTHON_SCRIPTS_DIR}/image_to_raw.py" "../${INPUT_IMAGE}" "${INPUT_RAW_FILE}"

# # --- Step 2: Compile Verilog files with xvlog ---
# printf "\nStep 2: Compiling Verilog files with xvlog..."
# # Using --sv for SystemVerilog features, and specifying both DUT and Testbench files
# xvlog --sv "${DUT_FILE}" "${TB_FILE}"

# # --- Step 3: Elaborate the top-level testbench module with parameters ---
# printf "\nStep 3: Elaborating design with xelab..."
# # Pass image dimensions and raw file names as generic parameters to the testbench
# xelab tb_barrel_distortion_correction -s barrel_distortion_sim \
#   -generic_top {WIDTH=${IMAGE_WIDTH},HEIGHT=${IMAGE_HEIGHT},INPUT_RAW_FILE=\"${INPUT_RAW_FILE}\",OUTPUT_RAW_FILE=\"${OUTPUT_RAW_FILE}\"}

# # --- Step 4: Run the simulation with xsim ---
# printf "\nStep 4: Running simulation with xsim..."
# xsim barrel_distortion_sim -R

# # --- Step 5: Convert Raw Output Pixel Data to Image ---
# printf "\nStep 5: Converting raw output pixel data to image '${OUTPUT_IMAGE}'..."
# python "${PYTHON_SCRIPTS_DIR}/raw_to_image.py" "${OUTPUT_RAW_FILE}" "../${OUTPUT_IMAGE}" "${IMAGE_WIDTH}" "${IMAGE_HEIGHT}"

# echo "Simulation and image processing complete."
# echo "Input image: ${INPUT_IMAGE}"
# echo "Output image: ${OUTPUT_IMAGE}"
# echo "Waveforms: ${SIM_DIR}/barrel_distortion_tb.vcd"
