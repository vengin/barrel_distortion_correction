import os

def generate_file_tree(startpath='.', depth=4, ignore_dirs=None):
    """
    Generates a string representation of the file tree.
    :param startpath: The directory to start the tree generation from.
    :param depth: The maximum depth to traverse.
    :param ignore_dirs: A list of directory names to ignore.
    :return: A string representing the file tree.
    """
    if ignore_dirs is None:
        ignore_dirs = ['.git', '.vscode', '__pycache__']

    tree_str = []
    for root, dirs, files in os.walk(startpath):
        # Calculate current depth
        current_depth = root.count(os.sep) - startpath.count(os.sep)

        # Filter out ignored directories for the current level
        dirs[:] = [d for d in dirs if d not in ignore_dirs]

        if current_depth > depth:
            del dirs[:] # Stop descending into subdirectories
            continue

        # Indentation for current level
        indent = '    ' * current_depth

        # Add current directory to tree
        if root != startpath:
            tree_str.append(f"{indent}{os.path.basename(root)}/")

        # Add files in current directory
        for f in sorted(files):
            tree_str.append(f"{indent}    {f}")

    return "\n".join(tree_str)

def update_clinerules_file(clinerules_path='.clinerules', tree_depth=4):
    """
    Updates the .clinerules file with the current file tree.
    :param clinerules_path: Path to the .clinerules file.
    :param tree_depth: The depth for the generated file tree.
    """
    try:
        with open(clinerules_path, 'r') as f:
            content = f.readlines()

        start_marker = "# Curent File Structure\n"

        try:
            start_index = content.index(start_marker)
        except ValueError:
            print(f"Error: Start marker '{start_marker.strip()}' not found in {clinerules_path}")
            return

        # Generate the new file tree, starting from the parent directory of the script
        # This assumes the script is in 'scripts/' and .clinerules is in the parent
        current_file_tree = generate_file_tree(startpath='..', depth=tree_depth)

        # Find the end of the existing file structure (or end of file)
        end_index = start_index + 1
        while end_index < len(content) and content[end_index].strip() != "":
            end_index += 1

        # Reconstruct the content
        new_content = content[:start_index + 1] # Keep everything before and including the marker
        new_content.append(current_file_tree + "\n") # Add the new tree
        new_content.extend(content[end_index:]) # Add everything after the old tree

        with open(clinerules_path, 'w') as f:
            f.writelines(new_content)
        print(f"Successfully updated file tree in {clinerules_path}")

    except FileNotFoundError:
        print(f"Error: File not found at {clinerules_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    # The script is in 'scripts/', so we need to go up one level to the root directory
    # to generate the tree for the entire project.
    # The .clinerules file is also in the parent directory.
    update_clinerules_file(clinerules_path='.clinerules', tree_depth=2)
