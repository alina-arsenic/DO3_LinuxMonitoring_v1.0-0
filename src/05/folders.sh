#!/bin/bash

dir_count=$(find $1 -type d | wc -l)
big_dirs=($(du $1 -h 2>/dev/null | sort -hr | head -n 5))

echo "Total number of folders (including all nested ones) = $dir_count"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
for (( i=0; i < $[ ${#big_dirs[@]} / 2 ]; i++ )); do
    echo "$(( i + 1 )) - ${big_dirs[$(( i * 2 + 1 ))]}, ${big_dirs[$(( i * 2 ))]}"
done
