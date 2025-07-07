import numpy as np
import os
import cv2


#################################################################################
def barrel_distortion_correction(image, k1):
  """
  Barrel distortion correction function.

  Args:
    image: Input image (numpy array)
    k1: Primary distortion coefficient
        - Positive k1: Inward distortion (pincushion effect)
        - Negative k1: Outward undistortion (barrel correction)

  Returns:
    Corrected image (numpy array)
  """
  height, width = image.shape[:2]

  x_center = width / 2
  y_center = height / 2

  # Create output image
  corrected_image = np.zeros_like(image)

  for y_d in range(height):
    for x_d in range(width):
      r_d = np.sqrt((x_d - x_center)**2 + (y_d - y_center)**2)
      #r_u = r_d * (1 + k1 * r_d**2 + k2 * r_d**4 + k3 * r_d**6)
      r_u = r_d * (1 + k1 * r_d**2)

      if r_d != 0:
        x_u = x_center + (x_d - x_center) * (r_u / r_d)
        y_u = y_center + (y_d - y_center) * (r_u / r_d)
      else:
        x_u, y_u = x_center, y_center

      x_u = int(np.clip(x_u, 0, width - 1))
      y_u = int(np.clip(y_u, 0, height - 1))

      corrected_image[y_u, x_u] = image[y_d, x_d]

  return corrected_image


################################################################################
def main():
  # Input and output file paths
  dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
  # input_file  = dir + 'img_in/img_128x100.png'
  # output_file = dir + 'img_out/img_128x100.png'
  input_file  = dir + 'img_in/img_2x3.png'
  output_file = dir +'img_out/img_2x3.png'


  # Distortion parameters
  k1 =+0.01  # Adjust this value based on your needs

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
