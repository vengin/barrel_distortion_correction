import numpy as np
import os
import cv2
import time
from collections import deque

# Input and output file paths
dir = 'D:/work/vivado/pynq/barrel_distortion_correction/hls_brl_corr1/src/'
img = ('img_100x100.png', 'img4_250x167.png', 'img_2x3.png', 'checkered_bg_1080x1080.jpg')
input_file  = dir +  'img_in/' + img[3]
output_file = dir + 'img_out/' + img[3]

# Distortion parameters
K1 = -0.005
# Set a more realistic number of line buffers for a hardware implementation
N_LINE_BUFS = 220 # Try with 1, 10, 64, etc. to see the effect

# Debug coordinates for print
X_DBG=500
Y_DBG=500


#################################################################################
def barrel_distortion_correction_streaming(image, image_stream, height, width, K1_float, N_LINE_BUFS):
  """
  Simulates barrel distortion correction with a true streaming line buffer architecture.
  The function processes the image line by line, and can only access pixels
  from the lines currently held in the buffer.

  Args:
    image_stream: An iterator that yields one line of the image at a time.
    height: The total height of the source image.
    width: The total width of the source image.
    K1_float: Primary distortion coefficient (floating-point).
    N_LINE_BUFS: The number of physical line buffers available.
  """
  # --- True Streaming Line Buffer ---
  # This buffer holds the most recent lines from the stream.
  line_buffer = deque(maxlen=N_LINE_BUFS)
  # Tracks the starting line number of the buffer window.
  buffer_start_line = 0
  buf_idx_hi = 0
  buf_idx_lo = 0


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
  K1 = int(K1_float * SCALE)
  x_c = int(width / 2 * SCALE)
  y_c = int(height / 2 * SCALE)

  # Create an empty output image
  corrected_image = np.zeros((height, width, 3), dtype=np.uint8)
  cnt_in = 0
  cnt_out = 0
  is_in_img = False
  y_d_int_offs = 0
  max_y_deviation = 0

  # First fill the line buffer to the max
  for buf_idx_hi in range (N_LINE_BUFS):
    # Add the new line to the buffer. The deque will handle eviction if full.
    line_buffer.append(image[buf_idx_hi])

  # Process the image stream line by line
  for y_d_int in range(height):
    # Add the new line to the buffer. The deque will handle eviction if full.
    y_d_int_offs = y_d_int + int(N_LINE_BUFS/2)

    if y_d_int_offs > buf_idx_hi  and  y_d_int_offs < height:
      buf_idx_hi += 1
      buf_idx_lo += 1
      #line_buffer.append(current_line)
      # if y_d_int_offs == 32:
      #   print('break')
      line_buffer.append(image[buf_idx_hi])
      # print(f"y_d_int_offs={y_d_int_offs}, y_d_int={y_d_int}")

    # # Update the starting line number of our buffer window.
    len_buf = len(line_buffer)
    # if len_buf == N_LINE_BUFS:
    #   if y_d_int >= N_LINE_BUFS -1:
    #     buffer_start_line = y_d_int - N_LINE_BUFS + 1

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
      term = (K1 * r_sq_scaled) >> FRACT_BITS
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
        # Detect maximum y-deviation to determine required line buffer depth
        deviation = abs(y_nn - y_d_int)
        if deviation > max_y_deviation:
            max_y_deviation = deviation
        cnt_in += 1
        is_in_img = True
        # Check if the required line is within the current buffer's range.
        #if buffer_start_line <= y_nn < buffer_start_line + len_buf:
        if buf_idx_lo <= y_nn < buf_idx_hi:
          # The line is in the buffer. Calculate its index within the deque.
          buf_rd_idx = y_nn - buf_idx_lo
          pixel_val = line_buffer[buf_rd_idx][x_nn]
          is_in_buffer = True
        else:
          # The line is not accessible (either too old or not yet received).
          pixel_val = 0
          is_in_buffer = False
          buf_rd_idx = -1 # Indicates not in buffer
          # if y_d_int % Y_DBG == (Y_DBG-1)  and  x_d_int % X_DBG == (X_DBG-1):
          #   buf_rd_idx = -1
      else:
        cnt_out += 1
        is_in_img = False
        # The line is not accessible (either too old or not yet received).
        pixel_val = 0
        is_in_buffer = False
        buf_rd_idx = -1 # Indicates not in buffer
        # return pixel_val, y_u_unscaled, x_u_unscaled, is_in_buffer, buf_rd_idx

      # return pixel_val, y_nn, x_nn, is_in_buffer, buf_rd_idx
    # --- End of Streaming Line Buffer ---
##################################
      corrected_image[y_d_int, x_d_int] = pixel_val

      # Debug
      if y_d_int % Y_DBG == (Y_DBG-1)  and  x_d_int % X_DBG == (X_DBG-1):
        if is_in_img:
          if is_in_buffer:
            print(f"o[{y_d_int:3d}][{x_d_int:3d}] <- i[{y_nn:3d}][{x_nn:3d}] = {pixel_val}")
          else:
            print(f"OUT o[{y_d_int:3d}][{x_d_int:3d}] <- i[{y_nn:3d}][{x_nn:3d}] = {pixel_val}")
            buf_rd_idx = -1
        else:
          print(f"o[{y_d_int:3d}][{x_d_int:3d}] = 0")

  cnt = cnt_in + cnt_out
  print(f"cnt_in={cnt_in}  {float(cnt_in*100/cnt):.1f}%, cnt_out={cnt_out}  {float(cnt_out*100/cnt):.1f}%")
  print(f"Maximum Y deviation (y_nn - y_d_int): {max_y_deviation} pixels.")
  print(f"Recommended N_LINE_BUFS: {2 * max_y_deviation}")

  return corrected_image


################################################################################
def main():
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
    print(f"K1 coefficient: {K1}")
    print(f"Simulating with {N_LINE_BUFS} streaming line buffer(s).")

    start_time = time.time()
    # Apply barrel distortion correction using the streaming model
    corrected_image = barrel_distortion_correction_streaming(image, image_stream, height, width, K1, N_LINE_BUFS)
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
