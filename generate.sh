#!/bin/bash

# Directory where the books are stored
BOOKS_DIR="/data"

# Iterate over each directory in the books directory
for dir in "$BOOKS_DIR"/*/; do
  if [ -d "$dir" ]; then
    if [ "$(basename $dir)" = "epub" ]; then
        echo "Ignoring EPUB directory: $dir"
        continue
    fi
    echo "Generating EPUB for directory: $dir"
    cd $dir
    pandoc -o "/data/epub/$(basename $dir).epub" "$dir/metadata.yaml" $dir/*.md
    cd "$OLDPWD"
  fi
done