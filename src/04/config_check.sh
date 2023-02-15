#!/bin/bash

Chars=$(wc -m config); Chars=${Chars%% *}
Lines=$(wc -l config); Lines=${Lines%% *}
err=0

if [[ $Chars -eq 86 && $Lines -eq 3 ]] || [[ $Chars -eq 88 && $Lines -eq 4 ]]; then
    p1=$(cat config | grep "column1_background=" | cut -c 20)
    p2=$(cat config | grep "column1_font_color=" | cut -c 20)
    p3=$(cat config | grep "column2_background=" | cut -c 20)
    p4=$(cat config | grep "column2_font_color=" | cut -c 20)
    for param in $p1 $p2 $p3 $p4; do
        if ! [[ "$param" =~ [1-6] ]]; then
            err=1
        fi
    done
else
    err=1
fi

if [[ $err -eq 1 ]]; then
    p1=6; p2=4; p3=6; p4=3
fi

echo $p1 $p2 $p3 $p4 $err
