#!/bin/bash

# Check if a directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 [directory]"
  exit 1
fi

# Verify that the directory exists
if [ ! -d "$1" ]; then
  echo "Error: Directory '$1' does not exist."
  exit 1
fi

# Header
echo "File Name | File Size (Bytes) | Word Count"

# Iterate over each file in the directory
for file in "$1"/*; do
  # Check if it is a file and not a directory
  if [ -f "$file" ]; then
    # Get file size
    filesize=$(stat -c %s "$file")

    # Get word count
    wordcount=$(wc -w < "$file")

    # Output information
    echo "$file | $filesize | $wordcount"
  fi
done


