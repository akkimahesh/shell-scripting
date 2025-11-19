#!/bin/bash

DIRECTORY="/tem/shellscripts"

if [ ! -d "$DIRECTORY" ]; then
  echo "Directory $DIRECTORY does not exist."
fi


FILES=$(find "$DIRECTORY" -type f -mtime +14 -name "*.log") #type f means files only

while IFS= read -r file; do
  echo "Deleting file: $file"
  rm -rf "$file"
done <<< "$FILES"

