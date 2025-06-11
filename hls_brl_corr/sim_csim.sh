#!/bin/bash
set -e
# Script to simulate hls_brl_corrVivado CSim in Git Bash
# The starting directory for this script should be /barrel_distortion_correction (e.g./d/work/vivado/pynq/barrel_distortion_correction)

PYTHON_PATH="/c/PF/Python"

# Add python to PATH
if [ -n "${PATH}" ]; then
  export PATH="${PYTHON_PATH}:${PATH}"
else
  export PATH="${PYTHON_PATH}"
fi


# --- Configuration ---
# Paths
PRJ_DIR="$(pwd)"
HLS_DIR="${PRJ_DIR}/hls_brl_corr"
cd "${HLS_DIR}/.."
PYTHON_SCRIPTS_DIR="$(pwd)/vivado/src/tb" # Python scripts are now in the testbench directory

# Image paths and dimensions (UPDATE THESE FOR YOUR IMAGE)
IMG_WIDTH=128 # Width of your input image
IMG_HEIGHT=100 # Height of your input image
IMG_NAME="img_128x100"
INPUT_IMAGE="src/img_in/${IMG_NAME}.png" # Your input image file (e.g., input.png, input.jpg)
OUTPUT_IMAGE="src/img_out/${IMG_NAME}.png" # Desired output image file
INPUT_RAW_FILE="src/img_in/${IMG_NAME}_in.txt"
OUTPUT_RAW_FILE="src/img_out/${IMG_NAME}_out.txt"


# --- Setup Simulation Directory ---
#mkdir -p "${SIM_DIR}"
## Change to simulation output directory for Vivado tools
cd ${HLS_DIR}
echo "HLS_DIR=${HLS_DIR}"

# --- Step 1: Convert Input Image to Raw Pixel Data ---
printf "\nStep 1: Converting input image '${INPUT_IMAGE}' to raw pixel data...\n"
echo "python \"${PYTHON_SCRIPTS_DIR}/image_to_raw.py\" \"${INPUT_IMAGE}\" \"${INPUT_RAW_FILE}\""
python "${PYTHON_SCRIPTS_DIR}/image_to_raw.py" "${INPUT_IMAGE}" "${INPUT_RAW_FILE}"

# --- Step 2: Run C Simulation ---
cd ${PRJ_DIR}
printf "\nStep 2: Running C Simulation...\n"
/C/Xilinx/Vivado/2017.4/bin/vivado_hls.bat hls_brl_corr/run_csim.tcl

# --- Step 3: Convert Raw Output Pixel Data to Image ---
cd ${HLS_DIR}
printf "\nStep 5: Converting raw output pixel data to image '${OUTPUT_IMAGE}'...\n"
echo "python \"${PYTHON_SCRIPTS_DIR}/raw_to_image.py\" \"${OUTPUT_RAW_FILE}\" \"${OUTPUT_IMAGE}\" ${IMG_WIDTH} ${IMG_HEIGHT}"
python "${PYTHON_SCRIPTS_DIR}/raw_to_image.py" "${OUTPUT_RAW_FILE}" "${OUTPUT_IMAGE}" "${IMG_WIDTH}" "${IMG_HEIGHT}"

# --- Step 4: Compare intput and output images ---
printf "\nStep 6: Comparing input and output images...\n"
echo "BCompare.exe "${INPUT_IMAGE}" "${OUTPUT_IMAGE}""
/D/\!portable/Beyond_Compare/BCompare.exe "${INPUT_IMAGE}" "${OUTPUT_IMAGE}"
