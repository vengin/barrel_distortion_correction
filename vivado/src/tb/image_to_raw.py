import sys
from PIL import Image

def image_to_raw(input_image_path, output_raw_path):
  try:
    img = Image.open(input_image_path)
    img = img.convert("RGB") # Ensure RGB format

    width, height = img.size

    with open(output_raw_path, 'w') as f:
      for y in range(height):
        for x in range(width):
          r, g, b = img.getpixel((x, y))
          # Format as 24-bit hexadecimal (RRGGBB)
          f.write(f"{r:02x}{g:02x}{b:02x}\n")
    
    print(f"Successfully converted '{input_image_path}' to raw pixel data at '{output_raw_path}'")
    print(f"Image dimensions: {width}x{height}")
    return width, height

  except FileNotFoundError:
    print(f"Error: Input image file not found at '{input_image_path}'")
    sys.exit(1)
  except Exception as e:
    print(f"An error occurred: {e}")
    sys.exit(1)

if __name__ == "__main__":
  if len(sys.argv) != 3:
    print("Usage: python image_to_raw.py <input_image_path> <output_raw_path>")
    sys.exit(1)
  
  input_path = sys.argv[1]
  output_path = sys.argv[2]
  image_to_raw(input_path, output_path)
