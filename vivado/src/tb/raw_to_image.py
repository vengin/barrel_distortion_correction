import sys
from PIL import Image

def raw_to_image(input_raw_path, output_image_path, width, height):
  try:
    pixels = []
    with open(input_raw_path, 'r') as f:
      for line in f:
        hex_pixel = line.strip()
        if len(hex_pixel) == 6: # RRGGBB
          r = int(hex_pixel[0:2], 16)
          g = int(hex_pixel[2:4], 16)
          b = int(hex_pixel[4:6], 16)
          pixels.append((r, g, b))
        else:
          print(f"Warning: Skipping malformed pixel data: {hex_pixel}")

    if len(pixels) != width * height:
      print(f"Error: Mismatch between expected pixels ({width*height}) and actual pixels read ({len(pixels)}).")
      # Attempt to create image with available pixels, but warn
      # sys.exit(1) # Don't exit, try to create image anyway

    img = Image.new('RGB', (width, height))
    img.putdata(pixels[:width*height]) # Use only up to expected number of pixels

    img.save(output_image_path)
    print(f"Successfully converted raw pixel data from '{input_raw_path}' to image at '{output_image_path}'")

  except FileNotFoundError:
    print(f"Error: Input raw data file not found at '{input_raw_path}'")
    sys.exit(1)
  except Exception as e:
    print(f"An error occurred: {e}")
    sys.exit(1)

if __name__ == "__main__":
  if len(sys.argv) != 5:
    print("Usage: python raw_to_image.py <input_raw_path> <output_image_path> <width> <height>")
    sys.exit(1)

  input_path = sys.argv[1]
  output_path = sys.argv[2]
  width = int(sys.argv[3])
  height = int(sys.argv[4])
  raw_to_image(input_path, output_path, width, height)
