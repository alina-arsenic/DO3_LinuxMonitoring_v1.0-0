#!/bin/bash

start=$(date +%s%N)

if [ "/" = "$(echo $1 | rev | cut -c1)" ] && [ -d $1 ]; then
    bash ./folders.sh $1
    bash ./file_counts.sh $1
    bash ./file_sizes.sh $1
    end=$(date +%s%N)
    echo "Script execution time (in seconds) = $(echo "scale=2;x=$(( $end - $start ))/1000000000; if(x<1) print 0; x" | bc)"
else
    >&2 echo "Please give as an argument one existing directory with a '/' as a last character."
fi
