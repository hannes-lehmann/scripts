#!/bin/bash

# Check if the external drive path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/external/drive"
  exit 1
fi

EXTERNAL_DRIVE_PATH=$1

# Ensure Chromium is closed
echo "Please close Chromium before continuing."
read -p "Press Enter to continue..."

# Define the source and destination directories
SOURCE_DIR=~/Library/Application\ Support/Chromium
DEST_DIR="$EXTERNAL_DRIVE_PATH/Chromium"

# Copy Chromium profile using rsync
echo "Exporting Chromium profiles..."
rsync -avh "$SOURCE_DIR" "$DEST_DIR"

echo "Export completed. Profiles are saved to $DEST_DIR"
