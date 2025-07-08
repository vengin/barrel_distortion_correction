import numpy as np
import os

# Output directory
output_dir = "c:/LUT_output"
os.makedirs(output_dir, exist_ok=True)
print("Files saved in:", output_dir)

# LUT generator with barrel distortion correction
def generate_lut(width, height, k1, k2, k3):
    x_center = width / 2
    y_center = height / 2

    lut_x = np.zeros((height, width), dtype=np.uint16)
    lut_y = np.zeros((height, width), dtype=np.uint16)

    for y_d in range(height):
        for x_d in range(width):
            r_d = np.sqrt((x_d - x_center)**2 + (y_d - y_center)**2)
            r_u = r_d * (1 + k1 * r_d**2 + k2 * r_d**4 + k3 * r_d**6)

            if r_d != 0:
                x_u = x_center + (x_d - x_center) * (r_u / r_d)
                y_u = y_center + (y_d - y_center) * (r_u / r_d)
            else:
                x_u, y_u = x_center, y_center

            lut_x[y_d, x_d] = int(np.clip(x_u, 0, width - 1))
            lut_y[y_d, x_d] = int(np.clip(y_u, 0, height - 1))

    return lut_x, lut_y

# Save to .coe file
def save_coe(filename, data):
    flat_data = data.flatten()
    with open(filename, 'w') as f:
        f.write("memory_initialization_radix=10;\n")
        f.write("memory_initialization_vector=\n")
        for i, value in enumerate(flat_data):
            f.write(f"{value}")
            if i < len(flat_data) - 1:
                f.write(",\n")
            else:
                f.write(";\n")

# Settings
width = 640
height = 480
k1, k2, k3 = -0.5, 0.2, -0.05  # Enhanced distortion

lut_x, lut_y = generate_lut(width, height, k1, k2, k3)

# Debug: print value ranges
print("Min X:", np.min(lut_x), "Max X:", np.max(lut_x))
print("Min Y:", np.min(lut_y), "Max Y:", np.max(lut_y))
print("Number of values in each LUT:", width * height)

# Save LUT files
save_coe(os.path.join(output_dir, "lut_x.coe"), lut_x)
save_coe(os.path.join(output_dir, "lut_y.coe"), lut_y)
