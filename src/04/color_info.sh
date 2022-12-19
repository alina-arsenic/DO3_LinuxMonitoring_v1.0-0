#!/bin/bash

echo
i=0
param=($@)
for middle in "1 background" "1 font color" "2 background" "2 font color"; do
    echo -n "Column $middle = "
    if [[ ${param[4]} -eq 1 ]]; then
        echo -n "default"
    else
        echo -n "${param[$i]}"
    fi
    echo -n " ("
    case "${param[$i]}" in
        "1" )
        echo -n "white"
        ;;
        "2" )
        echo -n "red"
        ;;
        "3" )
        echo -n "green"
        ;;
        "4" )
        echo -n "blue"
        ;;
        "5" )
        echo -n "purple"
        ;;
        "6" )
        echo -n "black"
        ;;
    esac
    echo ")"
    i=$(( $i + 1 ))
done
