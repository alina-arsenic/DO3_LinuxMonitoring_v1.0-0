#!/bin/bash

chmod +x ./stats.sh

if ! [ $# -eq 4 ]; then
    echo "Please give 4 arguments."
else
    reg='[1-6]'
    for param in "$@"; do
        if ! [[ $param =~ $reg ]]; then
            err=1
        fi
    done
    if [[ "$err" == "1" || "$1" == "$2" || "$3" == "$4" ]]
    then
        echo "Incorrect arguments. Please rerun the script with correct arguments."
        echo "(four digits 1-6, the first != the second, the third != the fourth)"
    else
        Colors=$(bash ./color_translator.sh $@)
        bash ./stats.sh $Colors
    fi
fi
