#!/usr/bin/env bash

ROOT_SOURCE_PATH="/Users/vrudyk/Library/Containers/com.isaacmarovitz.Whisky/Bottles/33A3F3ED-5BFE-4A89-B521-F2020B5A80C1/drive_c/Counter-Strike-Original/cstrike"
ROOT_DESTINATION_PATH="."

declare -A PATHS_MAP=(
    ["$ROOT_SOURCE_PATH/maps"]="$ROOT_DESTINATION_PATH/maps/maps"
    ["$ROOT_SOURCE_PATH/gfx"]="$ROOT_DESTINATION_PATH/maps/gfx"
    ["$ROOT_SOURCE_PATH/models"]="$ROOT_DESTINATION_PATH/maps/models"
    ["$ROOT_SOURCE_PATH/overviews"]="$ROOT_DESTINATION_PATH/maps/overviews"
    ["$ROOT_SOURCE_PATH/sound"]="$ROOT_DESTINATION_PATH/maps/sound"
    ["$ROOT_SOURCE_PATH/sprites"]="$ROOT_DESTINATION_PATH/maps/sprites"
)

# Copy files
for SOURCE in "${!PATHS_MAP[@]}"; do
    DESTINATION="${PATHS_MAP[$SOURCE]}"
    
    # Check if source directory exists
    if [ ! -d "$SOURCE" ]; then
        echo "Warning: Source directory $SOURCE does not exist. Skipping."
        continue
    fi
    
    echo "Copying $SOURCE to $DESTINATION"
    ./update-resources.sh "$SOURCE" "$DESTINATION"
    
    # Check if update-resources.sh executed successfully
    if [ $? -ne 0 ]; then
        echo "Warning: Failed to copy from $SOURCE to $DESTINATION"
    fi
done

echo "Copy operation completed."