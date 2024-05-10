#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 history_file1 history_file2"
    exit 1
fi

# Assign arguments to variables
HISTORY1=$1
HISTORY2=$2

# Define backup and temp filenames
CURRENT_HISTORY="$HOME/.zsh_history"
BACKUP_HISTORY="$HOME/.zsh_history.bak"
MERGED_HISTORY="$HOME/merged_history.zsh"
SORTED_HISTORY="$HOME/sorted_history.zsh"

# Create a backup of the current .zsh_history
if [ -f "$CURRENT_HISTORY" ]; then
    cp "$CURRENT_HISTORY" "$BACKUP_HISTORY"
    echo "Backup of current .zsh_history created at $BACKUP_HISTORY"
else
    echo "No existing .zsh_history found to backup."
fi

# Combine the provided history files
cat "$HISTORY1" "$HISTORY2" > "$MERGED_HISTORY"
echo "Combined history files into $MERGED_HISTORY"

# Sort the combined file by timestamp
sort -t ';' -k1,1n "$MERGED_HISTORY" > "$SORTED_HISTORY"
echo "Sorted combined history saved to $SORTED_HISTORY"

# Replace the current .zsh_history with the sorted history
mv "$SORTED_HISTORY" "$CURRENT_HISTORY"
echo "Replaced current .zsh_history with sorted history."

# Cleanup temporary files
rm "$MERGED_HISTORY"
echo "Cleaned up temporary files."

echo "History merge and sort complete."
