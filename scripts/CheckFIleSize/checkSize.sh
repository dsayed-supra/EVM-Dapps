#!/bin/bash

# Check if the file name is passed as an argument
if [ $# -eq 0 ]; then
  echo "Please provide a file name."
  exit 1
fi

# Use the 'stat' command to get the file size in bytes
file_size_bytes=$(stat -c%s "$1")

# Convert bytes to kilobytes (1 KB = 1024 bytes)
file_size_kb=$(echo "scale=2; $file_size_bytes / 1024" | bc)

# Print the file size in bytes and kilobytes
echo "Size of the file '$1' is: $file_size_bytes bytes ($file_size_kb KB)."
