#!/bin/bash

param=$(bash ./config_check.sh)

colors=$(bash ./color_translator.sh ${param[@]:0:7})
bash ./stats.sh $colors

bash ./color_info.sh $param
