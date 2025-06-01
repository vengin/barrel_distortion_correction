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


# --- Configuration ---
# Paths
TB_DIR="$(pwd)"
DUT_DIR="../rtl"
SIM_DIR="$TB_DIR/sim_out"
VIVADO_SIM_DIR="../../../hdmi_barrel_distortion_correction.sim/sim_1/behav/xsim"
PYTHON_SCRIPTS_DIR="${TB_DIR}" # Python scripts are now in the testbench directory

DUT_FILE="${DUT_DIR}/barrel_distortion_correction.v"
TB_FILE="${TB_DIR}/barrel_distortion_correction_tb.v"
XSIM_PRJ_FILE="../../../hdmi_barrel_distortion_correction.sim/sim_1/behav/xsim/tb_barrel_distortion_correction_vlog.prj"

# Image paths and dimensions (UPDATE THESE FOR YOUR IMAGE)
IMG_WIDTH=128 # Width of your input image
IMG_HEIGHT=100 # Height of your input image
IMG_NAME="img_128x100"
INPUT_IMAGE="../img_in/${IMG_NAME}.png" # Your input image file (e.g., input.png, input.jpg)
OUTPUT_IMAGE="../img_out/${IMG_NAME}.png" # Desired output image file
INPUT_RAW_FILE="${IMG_NAME}_in.txt"
OUTPUT_RAW_FILE="${IMG_NAME}_out.txt"


# --- Setup Simulation Directory ---
mkdir -p "${SIM_DIR}"
# Change to simulation output directory for Vivado tools
cd ${SIM_DIR}

# --- Step 1: Convert Input Image to Raw Pixel Data ---
printf "\nStep 1: Converting input image '${INPUT_IMAGE}' to raw pixel data...\n"
echo "python \"${PYTHON_SCRIPTS_DIR}/image_to_raw.py\" \"${INPUT_IMAGE}\" \"${INPUT_RAW_FILE}\""
python "${PYTHON_SCRIPTS_DIR}/image_to_raw.py" "${INPUT_IMAGE}" "${INPUT_RAW_FILE}"

# --- Step 2: Compile Verilog files with xvlog ---
printf "\nStep 2: Compiling Verilog files with xvlog...\n"
echo "xvlog --incr --relax -L xil_defaultlib -prj ${XSIM_PRJ_FILE}"
xvlog --incr --relax -L xil_defaultlib -prj ${XSIM_PRJ_FILE}

# --- Step 3: Elaborate the top-level testbench module with parameters ---
printf "\nStep 3: Elaborating design with xelab...\n"
# echo "xelab tb_barrel_distortion_correction -s barrel_distortion_sim "
# echo "-generic_top WIDTH=\${IMG_WIDTH}"
# echo "-generic_top {WIDTH=\${IMG_WIDTH},HEIGHT=\${IMG_HEIGHT},INPUT_RAW_FILE=\"\\\"\\\${INPUT_RAW_FILE}\\\"\",OUTPUT_RAW_FILE=\"\\\"\\\${OUTPUT_RAW_FILE}\\\"\"}"
# xelab tb_barrel_distortion_correction -s barrel_distortion_sim \
#   -generic_top {WIDTH=${IMG_WIDTH},HEIGHT=${IMG_HEIGHT},INPUT_RAW_FILE=\"${INPUT_RAW_FILE}\",OUTPUT_RAW_FILE=\"${OUTPUT_RAW_FILE}\"}
# xelab -wto 307315d4b3a64804a0c802b235bdb127 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot tb_barrel_distortion_correction_behav xil_defaultlib.tb_barrel_distortion_correction xil_defaultlib.glbl -log elaborate.log
echo "xelab --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot tb_barrel_distortion_correction_behav xil_defaultlib.tb_barrel_distortion_correction xil_defaultlib.glbl -log elaborate.log"
xelab --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot tb_barrel_distortion_correction_behav xil_defaultlib.tb_barrel_distortion_correction xil_defaultlib.glbl -log elaborate.log

# --- Step 4: Run the simulation with xsim ---
printf "\nStep 4: Running simulation with xsim...\n"
cd ${VIVADO_SIM_DIR}
echo "xsim tb_barrel_distortion_correction_behav -R"
xsim tb_barrel_distortion_correction_behav -R
#cd ${TB_DIR}
cd ${SIM_DIR}

# --- Step 5: Convert Raw Output Pixel Data to Image ---
printf "\nStep 5: Converting raw output pixel data to image '${OUTPUT_IMAGE}'...\n"
echo "python \"${PYTHON_SCRIPTS_DIR}/raw_to_image.py\" \"${OUTPUT_RAW_FILE}\" \"${OUTPUT_IMAGE}\" ${IMG_WIDTH} ${IMG_HEIGHT}"
python "${PYTHON_SCRIPTS_DIR}/raw_to_image.py" "${OUTPUT_RAW_FILE}" "${OUTPUT_IMAGE}" "${IMG_WIDTH}" "${IMG_HEIGHT}"
# cd "${SIM_DIR}"

# echo "Simulation and image processing complete."
# echo "Input image: ${INPUT_IMAGE}"
# echo "Output image: ${OUTPUT_IMAGE}"
# echo "Waveforms: ${SIM_DIR}/barrel_distortion_tb.vcd"
