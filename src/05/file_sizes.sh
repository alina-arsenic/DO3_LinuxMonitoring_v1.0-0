#!/bin/bash

big_files=($(find $1 -type f -print0 | du -h --files0-from=- 2>/dev/null | sort -hr | head))
big_exe_files=($(find $1 -type f -executable -print0 | du -h --files0-from=- 2>/dev/null | sort -hr | head))

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
big_files_count=$(( ${#big_files[@]} / 2))
for (( i=0; i < $big_files_count; i++ )); do
    type=$(file ${big_files[$(( i * 2 + 1 ))]}); type=${type##*: }
    echo "$(( i + 1 )) - ${big_files[$(( i * 2 + 1 ))]}, ${big_files[$(( i * 2 ))]}, $type"
done

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
big_exe_files_count=$(( ${#big_exe_files[@]} / 2))
for (( i=0; i < $big_exe_files_count; i++ )); do
    hash=$(md5sum ${big_exe_files[$(( i * 2 + 1 ))]}); hash=${hash%% *}
    echo "$(( i + 1 )) - ${big_exe_files[$(( i * 2 + 1 ))]}, ${big_exe_files[$(( i * 2 ))]}, $hash"
done
