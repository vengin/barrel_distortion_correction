import cv2
import numpy as np
import os


################################################################################
def barrel_distortion_correction(image, k1, k2=0, k3=0):
  """
  Barrel distortion correction function.

  Args:
    image: Input image (numpy array)
    k1: Primary distortion coefficient
        - Positive k1: Inward distortion (pincushion effect)
        - Negative k1: Outward undistortion (barrel correction)
    k2: Secondary distortion coefficient (optional)
    k3: Tertiary distortion coefficient (optional)

  Returns:
    Corrected image (numpy array)
  """
  h, w = image.shape[:2]

  # Create coordinate grids
  x = np.arange(w, dtype=np.float32)
  y = np.arange(h, dtype=np.float32)
  x_grid, y_grid = np.meshgrid(x, y)

  # Center coordinates
  cx = w / 2.0
  cy = h / 2.0

  # Normalize coordinates to [-1, 1] range
  x_norm = (x_grid - cx) / max(cx, cy)
  y_norm = (y_grid - cy) / max(cx, cy)

  # Calculate radius from center
  r = np.sqrt(x_norm**2 + y_norm**2)

  # Apply distortion formula: r_distorted = r * (1 + k1*r^2)
  r_distorted = r * (1 + k1 * r**2)
#  # Apply distortion formula: r_distorted = r * (1 + k1*r^2 + k2*r^4 + k3*r^6)
#  r_distorted = r * (1 + k1 * r**2 + k2 * r**4 + k3 * r**6)

  # Handle division by zero
  scale_factor = np.ones_like(r)
  mask = r > 1e-8
  scale_factor[mask] = r_distorted[mask] / r[mask]

  # Apply distortion to normalized coordinates
  x_distorted = x_norm * scale_factor
  y_distorted = y_norm * scale_factor

  # Convert back to pixel coordinates
  x_distorted = x_distorted * max(cx, cy) + cx
  y_distorted = y_distorted * max(cx, cy) + cy

  # Create output image
  corrected_image = np.zeros_like(image)

  # Create masks for valid coordinates
  valid_mask = ((x_distorted >= 0) & (x_distorted < w-1) &
                (y_distorted >= 0) & (y_distorted < h-1))

  # Get integer coordinates for interpolation
  x0 = np.floor(x_distorted).astype(np.int32)
  y0 = np.floor(y_distorted).astype(np.int32)
  x1 = x0 + 1
  y1 = y0 + 1

  # Ensure coordinates are within bounds
  x0 = np.clip(x0, 0, w-1)
  y0 = np.clip(y0, 0, h-1)
  x1 = np.clip(x1, 0, w-1)
  y1 = np.clip(y1, 0, h-1)

  # Skip interpolation, just assign ca
  corrected_image[valid_mask] = image[y0[valid_mask], x0[valid_mask]]
  return corrected_image

  # Calculate interpolation weights
  dx = x_distorted - x0
  dy = y_distorted - y0

  # Bilinear interpolation
  if len(image.shape) == 3:  # Color image
    for c in range(image.shape[2]):
      corrected_image[valid_mask, c] = (
        image[y0[valid_mask], x0[valid_mask], c]
        # image[y0[valid_mask], x0[valid_mask], c] * (1-dx[valid_mask]) * (1-dy[valid_mask]) +
        # image[y0[valid_mask], x1[valid_mask], c] * dx[valid_mask] * (1-dy[valid_mask]) +
        # image[y1[valid_mask], x0[valid_mask], c] * (1-dx[valid_mask]) * dy[valid_mask] +
        # image[y1[valid_mask], x1[valid_mask], c] * dx[valid_mask] * dy[valid_mask]
      )
  else:  # Grayscale image
    corrected_image[valid_mask] = (
      image[y0[valid_mask], x0[valid_mask]] * (1-dx[valid_mask]) * (1-dy[valid_mask])
      # image[y0[valid_mask], x0[valid_mask]] * (1-dx[valid_mask]) * (1-dy[valid_mask]) +
      # image[y0[valid_mask], x1[valid_mask]] * dx[valid_mask] * (1-dy[valid_mask]) +
      # image[y1[valid_mask], x0[valid_mask]] * (1-dx[valid_mask]) * dy[valid_mask] +
      # image[y1[valid_mask], x1[valid_mask]] * dx[valid_mask] * dy[valid_mask]
    )

  return corrected_image


################################################################################
def main():
  # Input and output file paths
#  input_file  = 'img_in/img_128x100.png'
#  output_file = 'img_out/img_128x100.png'
  dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
  input_file  = dir +  'img_in/img4_250x167.png'
  output_file = dir + 'img_out/img4_250x167.png'


  # Distortion parameters
  k1 =-0.10  # Adjust this value based on your needs
             # Positive: inward distortion (pincushion)
             # Negative: outward undistortion (barrel correction)
  k2 = 0.0   # Secondary distortion coefficient
  k3 = 0.0   # Tertiary distortion coefficient

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
    corrected_image = barrel_distortion_correction(image, k1, k2, k3)

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