#!/bin/bash

# Directory where the books are stored
BOOKS_DIR="/data"

# Iterate over each directory in the books directory
for dir in "$BOOKS_DIR"/*/; do
  if [ -d "$dir" ]; then
    echo "Generating EPUB for directory: $dir"
    # Replace the following line with the actual command to generate EPUB
    # For example, you might use a tool like pandoc or calibre
    cd $dir
    pandoc -o /data/epub/$dir.epub metadata.yaml *.md
    cd "$OLDPWD"
  fi
done