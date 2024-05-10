#!/bin/bash

# Check if the source path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/external/drive/Chromium"
  exit 1
fi

SOURCE_DIR=$1
DEST_DIR=~/.config/chromium

# Copy Chromium profile using rsync
echo "Importing Chromium profiles..."
rsync -avh "$SOURCE_DIR" "$DEST_DIR"

# Change ownership and permissions
echo "Setting correct permissions..."
sudo chown -R $USER:$USER "$DEST_DIR"
find "$DEST_DIR" -type d -exec chmod 755 {} \;
find "$DEST_DIR" -type f -exec chmod 644 {} \;

echo "Import completed. Profiles are in $DEST_DIR"
