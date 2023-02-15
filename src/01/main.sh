#!/bin/bash

if [ $# -eq 1 ]
then
    is_number='^[+-]?[0-9]+([.][0-9]+)?$'
    if ! [[ $1 =~ $is_number ]]
    then
        echo $1
    else
        echo "The argument is a number."
    fi
else
    echo "Please give 1 argument."
fi
