#!/bin/zsh
base_directory="research_project"
for file in "$base_directory"/**/*.txt; do
    # Generate timestamp using the date command
    timestamp=$(date +%Y%m%d%H%M%S)
    # Rename the file by adding the timestamp as a prefix
    mv "$file" "${file:h}/${timestamp}_${file:t}"
done