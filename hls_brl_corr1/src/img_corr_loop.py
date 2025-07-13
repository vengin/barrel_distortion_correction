import numpy as np
import os
import cv2
import time
from collections import deque
X_DBG=30
Y_DBG=30


#################################################################################
def barrel_distortion_correction_streaming(image_stream, height, width, k1_float, num_line_buffers):
  """
  Simulates barrel distortion correction with a true streaming line buffer architecture.
  The function processes the image line by line, and can only access pixels
  from the lines currently held in the buffer.

  Args:
    image_stream: An iterator that yields one line of the image at a time.
    height: The total height of the source image.
    width: The total width of the source image.
    k1_float: Primary distortion coefficient (floating-point).
    num_line_buffers: The number of physical line buffers available.
  """
  # --- True Streaming Line Buffer ---
  # This buffer holds the most recent lines from the stream.
  line_buffer = deque(maxlen=num_line_buffers)
  # Tracks the starting line number of the buffer window.
  buffer_start_line = 0


  # def get_pixel_from_streaming_buffer(y_coord, x_coord):
  #   """
  #   Fetches a pixel from the streaming line buffer.
  #   Returns the pixel value if the line is within the current buffer window,
  #   otherwise returns 0 (black) to indicate inaccessible data.
  #   """
  #   # y_nn = int(np.clip(y_coord, 0, height - 1))
  #   # x_nn = int(np.clip(x_coord, 0, width - 1))
  #   # XY Coordinates outside of image boundaries?
  #   if 0 <= x_coord < width and 0 <= y_coord < height: # insdie
  #     y_nn = y_coord
  #     x_nn = x_coord
  #   else:
  #     # The line is not accessible (either too old or not yet received).
  #     pixel_val = 0
  #     is_in_buffer = False
  #     buffer_index = -1 # Indicates not in buffer
  #     return pixel_val, y_coord, x_coord, is_in_buffer, buffer_index

  #   # Check if the required line is within the current buffer's range.
  #   if buffer_start_line <= y_nn < buffer_start_line + len(line_buffer):
  #     # The line is in the buffer. Calculate its index within the deque.
  #     buffer_index = y_nn - buffer_start_line
  #     pixel_val = line_buffer[buffer_index][x_nn]
  #     is_in_buffer = True
  #   else:
  #     # The line is not accessible (either too old or not yet received).
  #     pixel_val = 0
  #     is_in_buffer = False
  #     buffer_index = -1 # Indicates not in buffer
  #     if y_nn % Y_DBG == (Y_DBG-1)  and  x_nn % X_DBG == (X_DBG-1):
  #       print ("breakpoint")

  #   return pixel_val, y_nn, x_nn, is_in_buffer, buffer_index
  # # --- End of Streaming Line Buffer ---


  # Fixed-point configuration
  FRACT_BITS = 16
  SCALE = 1 << FRACT_BITS

  # Convert parameters to scaled integers
  k1 = int(k1_float * SCALE)
  x_c = int(width / 2 * SCALE)
  y_c = int(height / 2 * SCALE)

  # Create an empty output image
  corrected_image = np.zeros((height, width, 3), dtype=np.uint8)
  cnt_in = 0
  cnt_out = 0
  is_in_img = False

  # Process the image stream line by line
  for y_d_int, current_line in enumerate(image_stream):
    # Add the new line to the buffer. The deque will handle eviction if full.
    line_buffer.append(current_line)

    # Update the starting line number of our buffer window.
    if len(line_buffer) == num_line_buffers:
      if y_d_int >= num_line_buffers -1:
        buffer_start_line = y_d_int - num_line_buffers + 1

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

      # Get pixel from the streaming buffer.
##################################
      # pixel_val, y_nn, x_nn, is_in_buffer, buffer_index = get_pixel_from_streaming_buffer(y_u_unscaled, x_u_unscaled)
##################################
      # y_nn = int(np.clip(y_u_unscaled, 0, height - 1))
      # x_nn = int(np.clip(x_u_unscaled, 0, width - 1))
      # XY Coordinates outside of image boundaries?
      x_nn = x_u_unscaled
      y_nn = y_u_unscaled

      if 0 <= x_u_unscaled < width and 0 <= y_u_unscaled < height: # insdie
        cnt_in += 1
        is_in_img = True
        # Check if the required line is within the current buffer's range.
        if buffer_start_line <= y_nn < buffer_start_line + len(line_buffer):
          # The line is in the buffer. Calculate its index within the deque.
          buffer_index = y_nn - buffer_start_line
          pixel_val = line_buffer[buffer_index][x_nn]
          is_in_buffer = True
        else:
          # The line is not accessible (either too old or not yet received).
          pixel_val = 0
          is_in_buffer = False
          buffer_index = -1 # Indicates not in buffer
          # if y_nn % Y_DBG == (Y_DBG-1)  and  x_nn % X_DBG == (X_DBG-1):
          #   print ("breakpoint")
      else:
        cnt_out += 1
        is_in_img = False
        # The line is not accessible (either too old or not yet received).
        pixel_val = 0
        is_in_buffer = False
        buffer_index = -1 # Indicates not in buffer
        # return pixel_val, y_u_unscaled, x_u_unscaled, is_in_buffer, buffer_index

      # return pixel_val, y_nn, x_nn, is_in_buffer, buffer_index
    # --- End of Streaming Line Buffer ---
##################################
      corrected_image[y_d_int, x_d_int] = pixel_val

      # Debug
      if y_d_int % Y_DBG == (Y_DBG-1)  and  x_d_int % X_DBG == (X_DBG-1):
        if is_in_img:
          if is_in_buffer:
            print(f"o[{y_d_int:3d}][{x_d_int:3d}] <- i[{y_nn:3d}][{x_nn:3d}] = {pixel_val}")
          else:
  #           print(f"p[{y_d_int}][{x_d_int}] maps to p_corr[{y_nn}][{x_nn}] - NOT IN BUFFER (start: {buffer_start_line}, len: {len(line_buffer)})")
            print(f"OUT o[{y_d_int:3d}][{x_d_int:3d}] <- i[{y_nn:3d}][{x_nn:3d}] = {pixel_val}")
        else:
          print(f"o[{y_d_int:3d}][{x_d_int:3d}] = 0")

  cnt = cnt_in + cnt_out
  print(f"cnt_in={cnt_in}  {float(cnt_in*100/cnt):.1f}%, cnt_out={cnt_out}  {float(cnt_out*100/cnt):.1f}%")

  return corrected_image


################################################################################
def main():
  # Input and output file paths
  dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
  img = ('img_128x100.png', 'img4_250x167.png', 'img_2x3.png')
  input_file  = dir +  'img_in/' + img[0]
  output_file = dir + 'img_out/' + img[0]

  # Distortion parameters
  k1 = +0.20
  # Set a more realistic number of line buffers for a hardware implementation
  num_line_buffers = 100 # Try with 1, 10, 64, etc. to see the effect

  try:
    output_dir = os.path.dirname(output_file)
    if output_dir and not os.path.exists(output_dir):
      os.makedirs(output_dir)

    if not os.path.exists(input_file):
      print(f"Error: Input file '{input_file}' not found.")
      return

    image = cv2.imread(input_file)
    if image is None:
      print(f"Error: Could not read image from '{input_file}'")
      return

    height, width = image.shape[:2]

    # Create a generator to act as the image stream
    image_stream = (image[y] for y in range(height))

    print(f"Processing image: {input_file}")
    print(f"Image dimensions: {width}x{height}")
    print(f"K1 coefficient: {k1}")
    print(f"Simulating with {num_line_buffers} streaming line buffer(s).")

    start_time = time.time()
    # Apply barrel distortion correction using the streaming model
    corrected_image = barrel_distortion_correction_streaming(image_stream, height, width, k1, num_line_buffers)
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
