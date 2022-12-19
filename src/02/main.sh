#!/bin/bash

chmod +x ./stats.sh
bash ./stats.sh
echo -n "Wish to write this in a file? (y/n) "; read Answer
 if [[ "$Answer" == "y" || "$Answer" == "Y" ]]
    then
        Filename=$(date +"%d_%m_%y_%H_%M_%S")
        bash ./stats.sh > $Filename.status
        echo "File saved in the current directory."
    fi
