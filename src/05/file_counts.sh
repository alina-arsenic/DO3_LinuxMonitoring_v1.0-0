#!/bin/bash

file_count=0
file_conf_count=0
file_text_count=0
file_exe_count=0
file_log_count=0
file_archive_count=0
file_link_count=0

end=0
search_dir=$1*
while [ $end -eq 0 ]; do
    for file in $search_dir; do
        info=$(file $file)
        file_count=$[ $file_count + 1 ]
        file_exe_count=$[ $file_exe_count + $(echo $info | grep -c -e "executable$" -e "executable[^:.*]") ]
        file_text_count=$[ $file_text_count + $(echo $info | grep -c -e "text$" -e "text[^:.*]") ]
        file_link_count=$[ $file_link_count + $(echo $info | grep -c -e "symbolic link$" -e "symbolic link[^:.*]") ]
        file_archive_count=$[ $file_archive_count + $(echo $info | grep -c -e "archive$" -e "archive[^:.*]") ]
        file_conf_count=$[ $file_conf_count + $(echo $info | grep -c "*.conf") ]
        file_log_count=$[ $file_log_count + $(echo $info | grep -c "*.log") ]
        end=$(echo $info | grep -c "No such file or directory")
    done
    search_dir=$search_dir/*
done

echo "Total number of files = $file_count"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $file_conf_count"
echo "Text files = $file_text_count"
echo "Executable files = $file_exe_count"
echo "Log files (with the extension .log) = $file_log_count"
echo "Archive files = $file_archive_count"
echo "Symbolic links = $file_link_count"
