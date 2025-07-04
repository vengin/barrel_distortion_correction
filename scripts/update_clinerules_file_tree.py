import os

def generate_file_tree(startpath='.', depth=4, ignore_dirs=None):
    """
    Generates a string representation of the file tree with indentation lines.
    :param startpath: The directory to start the tree generation from.
    :param depth: The maximum depth to traverse.
    :param ignore_dirs: A list of directory names to ignore.
    :return: A string representing the file tree.
    """
    if ignore_dirs is None:
        ignore_dirs = ['.git', '.vscode', '__pycache__']

    tree_str = []

    def _build_tree(current_dir, current_depth, prefix=""):
        if current_depth > depth:
            return

        contents = sorted(os.listdir(current_dir))
        dirs = [d for d in contents if os.path.isdir(os.path.join(current_dir, d)) and d not in ignore_dirs]
        files = [f for f in contents if os.path.isfile(os.path.join(current_dir, f))]

        for i, item in enumerate(dirs + files):
            path = os.path.join(current_dir, item)
            is_last = (i == len(dirs) + len(files) - 1)

            if os.path.isdir(path):
                connector = "└── " if is_last else "├── "
                tree_str.append(f"{prefix}{connector}{item}/")
                new_prefix = prefix + ("    " if is_last else "│   ")
                _build_tree(path, current_depth + 1, new_prefix)
            else:
                connector = "└── " if is_last else "├── "
                tree_str.append(f"{prefix}{connector}{item}")

    tree_str.append(".") # Start with the current directory marker
    _build_tree(startpath, 0)
    return "\n".join(tree_str)

def update_clinerules_file(clinerules_path='.clinerules', tree_depth=4):
    """
    Updates the .clinerules file with the current file tree.
    :param clinerules_path: Path to the .clinerules file.
    :param tree_depth: The depth for the generated file tree.
    """
    try:
        with open(clinerules_path, 'r', encoding='utf-8') as f:
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

        with open(clinerules_path, 'w', encoding='utf-8') as f:
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
