import numpy as np
import os
import cv2


#################################################################################
def barrel_distortion_correction(image, k1):
  """
  Barrel distortion using a reverse mapping approach.

  This function iterates over each pixel of the output (corrected) image
  and computes the corresponding source pixel in the input (distorted) image.
  This ensures that every pixel in the output image is filled.

  Args:
    image: Input image (numpy array)
    k1: Primary distortion coefficient
        - Positive k1: Inward distortion (pincushion effect)
        - Negative k1: Outward undistortion (barrel correction)

  Returns:
    Corrected image (numpy array)
  """
  height, width = image.shape[:2]

  x_c = width / 2
  y_c = height / 2

  # Create an empty output image
  corrected_image = np.zeros_like(image)

  for y_d in range(height):
    for x_d in range(width):
      # Normalize coordinates relative to center
      x = (x_d - x_c) / x_c
      y = (y_d - y_c) / y_c

      r = np.sqrt(x*x + y*y)

      # Radial distortion correction (inverse model)
      r_u = r * (1 + k1 * r**2)
#      r_u = r * (1 + k1 * r**2 + k2 * r**4)

      if r != 0:
        x_u = x_c + (x / r) * r_u * x_c
        y_u = y_c + (y / r) * r_u * y_c
      else:
        x_u, y_u = x_c, y_c

      # Nearest-neighbor sampling (no interpolation)
      x_nn = int(round(x_u))
      y_nn = int(round(y_u))

      if 0 <= x_nn < width and 0 <= y_nn < height:
        corrected_image[y_d, x_d] = image[y_nn, x_nn]
      else:
        corrected_image[y_d, x_d] = 0  # or another background value

      # corrected_image[y_u, x_u] = image[y_d, x_d]

  return corrected_image


################################################################################
def main():
  # Input and output file paths
  dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
  img = ('img_128x100.png', 'img4_250x167.png', 'img_2x3.png')
  input_file  = dir +  'img_in/' + img[1]
  output_file = dir + 'img_out/' + img[1]


  # Distortion parameters
  k1 =-0.05  # Adjust this value based on your needs

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
