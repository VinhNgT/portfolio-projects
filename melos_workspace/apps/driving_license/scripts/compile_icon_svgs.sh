#!/bin/bash

# This script compiles all .svg files within the 'icons' folder of the
# app_workspace/assets directory

set -e

# Add aliases if on windows
case "$OSTYPE" in
msys* | cygwin*)
    vector_graphics_compiler() {
        vector_graphics_compiler.bat "$@"
    }
    ;;
esac

cd app_workspace/assets

# Find all directories within the 'icons' folder
find icons -type d | while read -r dir; do
    # Check if there are any .svg files in the current directory
    svg_files=()
    if ! ls "$dir"/*.svg 1>/dev/null 2>&1; then
        # echo "No .svg files in $dir, skipping..."
        continue
    else
        # Add .svg files to the list
        for svg_file in "$dir"/*.svg; do
            svg_files+=("$svg_file")
        done
    fi

    # Create the _compiled directory within the current directory
    rm -rf "$dir/_compiled"
    mkdir -p "$dir/_compiled"

    # Run the vector_graphics_compiler command
    echo "Compiling .svg files in $dir..."
    vector_graphics_compiler --input-dir "$dir" --out-dir "$dir/_compiled" --no-optimize-overdraw
done
