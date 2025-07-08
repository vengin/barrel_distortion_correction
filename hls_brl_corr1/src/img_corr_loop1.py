import numpy as np
# from PIL import Image
import cv2


def barrel_distortion_correction(image, k1, k2=0):
  """
  Correct barrel distortion on input_image using radial distortion coefficients k1, k2.
  Returns a new undistorted image.
  """

  useBilinearInterpolation = True
  h, w = image.shape[:2]
  x_c, y_c = w / 2, h / 2  # distortion center (image center)

  # Convert image to numpy array for pixel access
  input_pixels = np.array(image)
  # Create an empty output image
  corrected_image = np.zeros_like(image)

  for y_d in range(h):
    for x_d in range(w):
      # Normalize coordinates relative to center
      x = (x_d - x_c) / x_c
      y = (y_d - y_c) / y_c

      r = np.sqrt(x*x + y*y)

      # Radial distortion correction (inverse model)
      # Approximate inverse radius r_u from distorted radius r
      # Using polynomial inverse: r_u = r * (1 + k1*r^2 + k2*r^4)
      # This formula assumes small distortion and is an approximation
      r_u = r * (1 + k1 * r**2)
#      r_u = r * (1 + k1 * r**2 + k2 * r**4)

      if r != 0:
        x_u = x_c + (x / r) * r_u * x_c
        y_u = y_c + (y / r) * r_u * y_c
      else:
        x_u, y_u = x_c, y_c

      if useBilinearInterpolation:
        # Bilinear interpolation for pixel value
        x0, y0 = int(np.floor(x_u)), int(np.floor(y_u))
        x1, y1 = min(x0 + 1, w - 1), min(y0 + 1, h - 1)

        dx, dy = x_u - x0, y_u - y0

        if 0 <= x0 < w and 0 <= y0 < h:
          # Interpolate each color channel
          top = (1 - dx) * input_pixels[y0, x0] + dx * input_pixels[y0, x1]
          bottom = (1 - dx) * input_pixels[y1, x0] + dx * input_pixels[y1, x1]
          pixel = (1 - dy) * top + dy * bottom
          corrected_image[y_d, x_d] = pixel
        else:
          # Outside bounds: set black or nearest pixel
          corrected_image[y_d, x_d] = 0
      else:
        # Nearest-neighbor sampling (no interpolation)
        x_nn = int(round(x_u))
        y_nn = int(round(y_u))

        if 0 <= x_nn < w and 0 <= y_nn < h:
          corrected_image[y_d, x_d] = input_pixels[y_nn, x_nn]
        else:
          corrected_image[y_d, x_d] = 0  # or another background value

  return corrected_image

# Example usage:
dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
img = ('img_128x100.png', 'img4_250x167.png', 'img_2x3.png')
input_file  = dir +  'img_in/' + img[1]
output_file = dir + 'img_out/' + img[1]

input_img = cv2.imread(input_file)
k1 = -0.05  # example distortion coefficient (negative for barrel)
k2 = 0.0  # second order coefficient

corrected_image = barrel_distortion_correction(input_img, k1)
success = cv2.imwrite(output_file, corrected_image)
if success:
  print(f"Corrected image saved to: {output_file}")
else:
  print(f"Error: Could not save image to '{output_file}'")
