#!/bin/bash

# Check if both source and destination paths are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_path> <destination_path>"
    exit 1
fi

SOURCE_PATH="$1"
DESTINATION_PATH="$2"

# Ensure the source path exists
if [ ! -d "$SOURCE_PATH" ]; then
    echo "Error: Source path '$SOURCE_PATH' does not exist or is not a directory."
    exit 1
fi

# Ensure the destination directory exists, create it if necessary
mkdir -p "$DESTINATION_PATH"

# Copy files recursively
cp -r "$SOURCE_PATH"/* "$DESTINATION_PATH"

echo "Resources copied from '$SOURCE_PATH' to '$DESTINATION_PATH' successfully."