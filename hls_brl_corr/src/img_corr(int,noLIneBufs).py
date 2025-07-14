import numpy as np
import os
import cv2
import time

# Input and output file paths
dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr/src/'

img = ('img_100x100.png', 'img4_250x167.png', 'img_2x3.png', 'checkered_bg_1080x1080.jpg')
input_file  = dir +  'img_in/' + img[3]
output_file = dir + 'img_out/' + img[3]

# Distortion parameters
K1 = +0.50

# Debug coordinates for print
X_DBG=30
Y_DBG=30


#################################################################################
def barrel_distortion_correction(image, k1_float):
  """
  Barrel distortion using a reverse mapping approach with simulated fixed-point arithmetic.
  This version uses loops to better match HDL/C++ implementation.

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

  # Create an empty output image
  corrected_image = np.zeros_like(image)
  cnt_in = 0
  cnt_out = 0

  for y_d_int in range(height):
    for x_d_int in range(width):
      # Scale destination coordinates
      x_d = x_d_int * SCALE
      y_d = y_d_int * SCALE

      # Normalize coordinates relative to center
      x = ((x_d - x_c) * SCALE) // x_c
      y = ((y_d - y_c) * SCALE) // y_c

      # r_sq has 2*FRACT_BITS fractional bits
      r_sq = x*x + y*y

      # r has FRACT_BITS fractional bits
      r = int(np.sqrt(r_sq))

      # Radial distortion correction (inverse model)
      r_sq_scaled = r_sq >> FRACT_BITS # scale to FRACT_BITS
      term = (k1 * r_sq_scaled) >> FRACT_BITS
      r_u = (r * (SCALE + term)) >> FRACT_BITS

      if r != 0:
        x_u_norm = (x * r_u) // r
        y_u_norm = (y * r_u) // r

        # Calculate final source coordinates
        x_u = x_c + ((x_u_norm * x_c) >> FRACT_BITS)
        y_u = y_c + ((y_u_norm * y_c) >> FRACT_BITS)
      else:
        x_u, y_u = x_c, y_c

      # Unscale coordinates
      x_u_unscaled = x_u >> FRACT_BITS
      y_u_unscaled = y_u >> FRACT_BITS

      # No nearest-neighbor sampling
      x_nn = x_u_unscaled
      y_nn = y_u_unscaled
      y_nn1 = int(np.clip(y_u_unscaled, 0, height - 1))
      x_nn1 = int(np.clip(x_u_unscaled, 0, width - 1))

      # XY Coordinates outside of image boundaries?
      if 0 <= x_nn < width and 0 <= y_nn < height: # insdie
        corrected_image[y_d_int, x_d_int] = image[y_nn, x_nn]
        cnt_in += 1
        # Debug
        if y_d_int % Y_DBG == (Y_DBG-1)  and  x_d_int % X_DBG == (X_DBG-1):
          print(f"o[{y_d_int:3d}][{x_d_int:3d}] <- i[{y_nn:3d}][{x_nn:3d}] = {image[y_nn, x_nn]}")
      else: # outsdie
        corrected_image[y_d_int, x_d_int] = 0
        cnt_out += 1
        # Debug
        if y_d_int % Y_DBG == (Y_DBG-1)  and  x_d_int % X_DBG == (X_DBG-1):
          print(f"o[{y_d_int:3d}][{x_d_int:3d}] = 0")

      # # Debug
      # if y_d_int % Y_DBG == (Y_DBG-1)  and  x_d_int % X_DBG == (X_DBG-1):
      #   # pixel_val = image[y_nn, x_nn] if 0 <= x_nn < width and 0 <= y_nn < height else (0,0,0)
      #   print(f"o[{y_d_int:3d}][{x_d_int:3d}] <- i[{y_nn:3d}][{x_nn:3d}] =")
      #   print(f"p[{y_d_int:3d}][{x_d_int:3d}] -> p_corr[{y_nn:3d}][{x_nn:3d}] = {pixel_val}")

  cnt = cnt_in + cnt_out
  print(f"cnt_in={cnt_in}  {float(cnt_in*100/cnt):.1f}%, cnt_out={cnt_out}  {float(cnt_out*100/cnt):.1f}%")
  return corrected_image


################################################################################
def main():
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
    print(f"K1 coefficient: {K1}")

    start_time = time.time()
    # Apply barrel distortion correction
    corrected_image = barrel_distortion_correction(image, K1)
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
