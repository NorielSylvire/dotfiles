#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -euo pipefail

# Check if a directory argument was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

SOURCE_DIR="$1"
TARGET_DIR="$HOME/.local/bin"

# Verify the source is a valid directory
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Ensure the target directory exists
mkdir -p "$TARGET_DIR"

# Loop through all .sh files in the provided directory
for file in "$SOURCE_DIR"/*.sh; do
    # Check if the file actually exists (handles the case where no .sh files exist)
    [ -e "$file" ] || continue

    # Get the absolute path of the source file so the symlink works from anywhere
    abs_file=$(realpath "$file")

    # Get just the filename (e.g., "wallpaper.sh")
    filename=$(basename "$file")

    # Strip the .sh extension (e.g., "wallpaper")
    link_name="${filename%.sh}"

    # Create the symbolic link (-s for symlink, -f to overwrite if it already exists)
    ln -sf "$abs_file" "$TARGET_DIR/$link_name"
    
    echo "Linked: $TARGET_DIR/$link_name -> $abs_file"
done

echo "Done! Make sure $TARGET_DIR is in your \$PATH."
