import numpy as np
import os
import cv2
import time


#################################################################################
def barrel_distortion_correction(image, k1_float):
  """
  Barrel distortion using a reverse mapping approach with simulated fixed-point arithmetic using NumPy.
  This version is optimized for performance by using vectorized operations.

  Args:
    image: Input image (numpy array)
    k1_float: Primary distortion coefficient (floating-point)

  Returns:
    Corrected image (numpy array)
  """
  height, width = image.shape[:2]

  # Fixed-point configuration
  FRACT_BITS = 16
  SCALE = 1 << FRACT_BITS

  # Convert parameters to scaled integers
  k1 = int(k1_float * SCALE)
  x_c = int(width / 2 * SCALE)
  y_c = int(height / 2 * SCALE)

  # Create coordinate grids
  x_d, y_d = np.meshgrid(np.arange(width), np.arange(height))

  # Scale destination coordinates
  x_d_scaled = x_d * SCALE
  y_d_scaled = y_d * SCALE

  # Normalize coordinates relative to center
  x = ((x_d_scaled - x_c) * SCALE) // x_c
  y = ((y_d_scaled - y_c) * SCALE) // y_c

  # r_sq (has 2*FRACT_BITS fractional bits)
  r_sq = x*x + y*y

  # r has FRACT_BITS fractional bits
  r = np.sqrt(r_sq.astype(np.float64)).astype(np.int64)

  # Radial distortion correction (inverse model)
  # r_u = r * (1 + k1 * r**2)
  r_sq_scaled = r_sq >> FRACT_BITS # scale to FRACT_BITS
  term = (k1 * r_sq_scaled) >> FRACT_BITS
  r_u = (r * (SCALE + term)) >> FRACT_BITS

  # Avoid division by zero
  non_zero_r = r != 0

  # Initialize source coordinates
  x_u = np.full_like(x, x_c)
  y_u = np.full_like(y, y_c)

  # Calculate normalized undistorted coordinates
  x_u_norm = np.zeros_like(x)
  y_u_norm = np.zeros_like(y)

  # x_u_norm = (x * r_u) / r
  x_u_norm[non_zero_r] = (x[non_zero_r] * r_u[non_zero_r]) // r[non_zero_r]
  y_u_norm[non_zero_r] = (y[non_zero_r] * r_u[non_zero_r]) // r[non_zero_r]

  # Calculate final source coordinates
  x_u = x_c + ((x_u_norm * x_c) >> FRACT_BITS)
  y_u = y_c + ((y_u_norm * y_c) >> FRACT_BITS)

  # Unscale coordinates
  x_u_unscaled = x_u >> FRACT_BITS
  y_u_unscaled = y_u >> FRACT_BITS

  # Nearest-neighbor sampling
  x_nn = np.clip(x_u_unscaled, 0, width - 1).astype(int)
  y_nn = np.clip(y_u_unscaled, 0, height - 1).astype(int)

  # Create corrected image
  corrected_image = image[y_nn, x_nn]

  return corrected_image


################################################################################
def main():
  # Input and output file paths
  dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
  img = ('img_128x100.png', 'img4_250x167.png', 'img_2x3.png')
  input_file  = dir +  'img_in/' + img[1]
  output_file = dir + 'img_out/' + img[1]


  # Distortion parameters
  k1 =-0.06  # Adjust this value based on your needs

  try:
    # Create output directory if it doesn't exist
    output_dir = os.path.dirname(output_file)
    if output_dir and not os.path.exists(output_dir):
      os.makedirs(output_dir)

    # Read input image
    if not os.path.exists(input_file):
      print(f"Error: Input file '{input_file}' not found.")
      print("Please ensure the input image exists.")
      return

    image = cv2.imread(input_file)
    if image is None:
      print(f"Error: Could not read image from '{input_file}'")
      return

    print(f"Processing image: {input_file}")
    print(f"Image dimensions: {image.shape[1]}x{image.shape[0]}")
    print(f"K1 coefficient: {k1}")

    start_time = time.time()
    # Apply barrel distortion correction
    corrected_image = barrel_distortion_correction(image, k1)
    end_time = time.time()

    print(f"Processing time: {end_time - start_time:.4f} seconds")


    # Save the corrected image
    success = cv2.imwrite(output_file, corrected_image)
    if success:
      print(f"Corrected image saved to: {output_file}")
    else:
      print(f"Error: Could not save image to '{output_file}'")

  except Exception as e:
    print(f"Error occurred: {str(e)}")


################################################################################
if __name__ == "__main__":
  main()
