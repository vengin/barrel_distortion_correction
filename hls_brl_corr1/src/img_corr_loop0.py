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
    Corrected image (numpy array).
  """
  height, width = image.shape[:2]
  x_center = width / 2
  y_center = height / 2

  # Create an empty output image
  corrected_image = np.zeros_like(image)

  # Iterate over each pixel of the corrected (output) image
  for y_u in range(height):
    for x_u in range(width):
      # (x_u, y_u) are the coordinates in the corrected image
      # We need to find the corresponding pixel (x_d, y_d) in the distorted image

      # Calculate the radius in the corrected image
      dx_u = x_u - x_center
      dy_u = y_u - y_center
      r_u = np.sqrt(dx_u**2 + dy_u**2)

      if r_u == 0:
        # Center pixel maps to itself
        x_d, y_d = x_center, y_center
      else:
        # The forward mapping is: r_u = r_d * (1 + k1 * r_d^2)
        # We need to solve for r_d. We use an approximation for the inverse:
        # r_d ≈ r_u * (1 - k1 * r_u^2)
        r_d = r_u * (1 - k1 * r_u**2)

        # Calculate the source coordinates (x_d, y_d)
        # The ratio r_d/r_u gives the scaling factor
        scaling_factor = r_d / r_u
        x_d = x_center + dx_u * scaling_factor
        y_d = y_center + dy_u * scaling_factor

      # Use nearest-neighbor interpolation by taking the integer part
      # after clipping to the image boundaries.
      x_d = int(np.clip(x_d, 0, width - 1))
      y_d = int(np.clip(y_d, 0, height - 1))

      # Assign the pixel value from the source image
      corrected_image[y_u, x_u] = image[y_d, x_d]

  return corrected_image


################################################################################
def main():
  # Input and output file paths
  dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
  input_file  = dir + 'img_in/img_128x100.png'
  output_file = dir + 'img_out/img_128x100.png'
  # input_file  = dir + 'img_in/img_2x3.png'
  # output_file = dir +'img_out/img_2x3.png'


  # Distortion parameters
  k1 =-0.01  # Adjust this value based on your needs

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
