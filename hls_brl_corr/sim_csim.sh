#!/bin/bash
set -e
# Script to simulate hls_brl_corrVivado CSim in Git Bash
# The starting directory for this script should be /barrel_distortion_correction/hls_brl_corr
# Use the following command to run in Git Bash:
#   ./sim_csim.sh
# Use the following command to run in VSCode bash (MSYS2), which is the only working one with AI feedback:
#   c:/PF/Git/bin/bash.exe -c "source sim_csim.sh"

PYTHON_PATH="/c/PF/Python"

# Add python to PATH
if [ -n "${PATH}" ]; then
  export PATH="${PYTHON_PATH}:${PATH}"
else
  export PATH="${PYTHON_PATH}"
fi


# --- Configuration ---
# Paths
HLS_DIR="$(pwd)" # This script's directory (e.g., hls_brl_corr1)
cd ..
PRJ_DIR="$(pwd)" # Parent directory (e.g., barrel_distortion_correction)
#cd ${HLS_DIR}
PYTHON_SCRIPTS_DIR="${PRJ_DIR}/vivado/src/tb" # Python scripts are now in the testbench directory

# Image paths and dimensions (UPDATE THESE FOR YOUR IMAGE)
IMG_WIDTH=128 # Width of your input image
IMG_HEIGHT=100 # Height of your input image
IMG_NAME="img_128x100"
INPUT_IMAGE="src/img_in/${IMG_NAME}.png" # Your input image file (e.g., input.png, input.jpg)
OUTPUT_IMAGE="src/img_out/${IMG_NAME}.png" # Desired output image file
INPUT_RAW_FILE="src/img_in/${IMG_NAME}_in.txt"
OUTPUT_RAW_FILE="src/img_out/${IMG_NAME}_out.txt"

# Comment/uncomment variable to disable/enable corresponding step
# RUN1_CONVERT_INPUT_IMG="1"
# RUN2_HLS_SIM="1"
RUN3_CONVERT_OUTPUT_IMG="1"
RUN4_COMPARE_IMG="1"


# --- Setup Simulation Directory ---
#mkdir -p "${SIM_DIR}"
## Change to simulation output directory for Vivado tools
cd ${HLS_DIR}
echo "HLS_DIR=${HLS_DIR}"

# --- Step 1: Convert Input Image to Raw Pixel Data ---
if [ -n "$RUN1_CONVERT_INPUT_IMG" ]; then
  printf "\nStep 1: Converting input image '${INPUT_IMAGE}' to raw pixel data...\n"
  echo "python \"${PYTHON_SCRIPTS_DIR}/image_to_raw.py\" \"${INPUT_IMAGE}\" \"${INPUT_RAW_FILE}\""
  python "${PYTHON_SCRIPTS_DIR}/image_to_raw.py" "${INPUT_IMAGE}" "${INPUT_RAW_FILE}"
fi

# --- Step 2: Run C Simulation ---
if [ -n "$RUN2_HLS_SIM" ]; then
  cd ${PRJ_DIR}
  printf "\nStep 2: Running C Simulation...\n"
  /C/Xilinx/Vivado/2017.4/bin/vivado_hls.bat "${HLS_DIR}/run_csim.tcl"
fi

# --- Step 3: Convert Raw Output Pixel Data to Image ---
cd ${HLS_DIR}
if [ -n "$RUN3_CONVERT_OUTPUT_IMG" ]; then
  printf "\nStep 3: Converting raw output pixel data to image '${OUTPUT_IMAGE}'...\n"
  echo "python \"${PYTHON_SCRIPTS_DIR}/raw_to_image.py\" \"${OUTPUT_RAW_FILE}\" \"${OUTPUT_IMAGE}\" ${IMG_WIDTH} ${IMG_HEIGHT}"
  python "${PYTHON_SCRIPTS_DIR}/raw_to_image.py" "${OUTPUT_RAW_FILE}" "${OUTPUT_IMAGE}" "${IMG_WIDTH}" "${IMG_HEIGHT}"
fi

# --- Step 4: Compare intput and output images ---
if [ -n "$RUN4_COMPARE_IMG" ]; then
  printf "\nStep 4: Comparing input and output images...\n"
  echo "BCompare.exe "${INPUT_IMAGE}" "${OUTPUT_IMAGE}""
  start "" "/D/\!portable/Beyond_Compare/BCompare.exe" "${INPUT_IMAGE}" "${OUTPUT_IMAGE}"
fi