import numpy as np
import os
import cv2
from fixedpoint import FixedPoint


#################################################################################
def barrel_distortion_correction(image, k1_float):
  """
  Barrel distortion using a reverse mapping approach with fixed-point arithmetic.

  This function iterates over each pixel of the output (corrected) image
  and computes the corresponding source pixel in the input (distorted) image.
  This ensures that every pixel in the output image is filled.

  Args:
    image: Input image (numpy array)
    k1_float: Primary distortion coefficient (floating-point)

  Returns:
    Corrected image (numpy array)
  """
  height, width = image.shape[:2]

  # Fixed-point configuration
  # Q format: Q<integer_bits>.<fractional_bits>
  # Total bits = 1 (sign) + integer_bits + fractional_bits
  # Using 32 bits total, 16 for integer, 15 for fraction, 1 for sign
  FX_TOTAL_BITS = 32
  FX_FRACT_BITS = 16
  FX_INT_BITS = FX_TOTAL_BITS - FX_FRACT_BITS - 1

  k1 = FixedPoint(k1_float, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)

  x_c = FixedPoint(width / 2, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)
  y_c = FixedPoint(height / 2, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)

  # Create an empty output image
  corrected_image = np.zeros_like(image)

  for y_d_int in range(height):
    for x_d_int in range(width):
      x_d = FixedPoint(x_d_int, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)
      y_d = FixedPoint(y_d_int, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)

      # Normalize coordinates relative to center
      # x = (x_d - x_c) / x_c
      # y = (y_d - y_c) / y_c

      x_minus_xc = x_d - x_c
      y_minus_yc = y_d - y_c

      # Manual division
      x_float = float(x_minus_xc) / float(x_c)
      y_float = float(y_minus_yc) / float(y_c)
      x = FixedPoint(x_float, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)
      y = FixedPoint(y_float, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)

      # r_sq = x*x + y*y
      # For sqrt, we need to handle potential overflow if numbers are large
      # A dedicated fixed-point sqrt function would be ideal.
      # Emulating with floating point for now, but in HDL this would be a cordic or similar integer-based sqrt
      r_float = np.sqrt(float(x*x + y*y))
      r = FixedPoint(r_float, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)


      # Radial distortion correction (inverse model)
      # r_u = r * (1 + k1 * r**2)
      one = FixedPoint(1, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)
      r_u = r * (one + k1 * r * r)

      if float(r) != 0:
        # To avoid division by a fixed-point number, which can be tricky,
        # we can reformulate. x_u = x_c + x * r_u * x_c / r
        # Let's stick to the division for now, assuming the library handles it.
        # x_u = x_c + (x / r) * r_u * x_c
        # y_u = y_c + (y / r) * r_u * y_c

        # Manual division
        x_div_r_float = float(x) / float(r)
        y_div_r_float = float(y) / float(r)
        x_div_r = FixedPoint(x_div_r_float, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)
        y_div_r = FixedPoint(y_div_r_float, signed=1, m=FX_INT_BITS, n=FX_FRACT_BITS)

        x_u = x_c + x_div_r * r_u * x_c
        y_u = y_c + y_div_r * r_u * y_c
      else:
        x_u, y_u = x_c, y_c

      # Nearest-neighbor sampling (no interpolation)
      x_nn = int(round(float(x_u)))
      y_nn = int(round(float(y_u)))

      if 0 <= x_nn < width and 0 <= y_nn < height:
        corrected_image[y_d_int, x_d_int] = image[y_nn, x_nn]
      else:
        corrected_image[y_d_int, x_d_int] = 0  # or another background value

  return corrected_image


################################################################################
def main():
  # Input and output file paths
  dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
  img = ('img_128x100.png', 'img4_250x167.png', 'img_2x3.png')
  input_file  = dir +  'img_in/' + img[1]
  output_file = dir + 'img_out/' + img[1]


  # Distortion parameters
  k1 =+0.00  # Adjust this value based on your needs

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

    # Apply barrel distortion correction
    corrected_image = barrel_distortion_correction(image, k1)

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
