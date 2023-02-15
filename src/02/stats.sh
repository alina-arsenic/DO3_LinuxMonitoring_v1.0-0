#!/bin/bash
source /etc/os-release

echo "HOSTNAME = $HOSTNAME"
echo -n "TIMEZONE = "; cat /etc/timezone | tr "\n" " "; date +"%-:::z"
echo "USER = $USER"
echo "OS = $PRETTY_NAME"
echo -n "DATE = "; date +"%-d %B %Y %T"
echo -n "UPTIME = "; uptime -p | cut -b 4-
echo -n "UPTIME_SEC = "; Uptime=$(</proc/uptime); echo ${Uptime%%.*}
IP=$(hostname -I); echo "IP = $IP"
Mask=$(ip a | grep $IP); Mask=${Mask##*/}; Mask=${Mask%% *}; echo "MASK = /$Mask"
Gate=$(ip r | grep "default"); Gate=${Gate##default via }; Gate=${Gate%% *}; echo "GATEWAY = $Gate"
Mem=($(free -b | grep Mem))
echo -n "RAM_TOTAL = "; echo -n $(echo "scale=3;x=${Mem[1]}/1073741824; if(x<1) print 0; x" | bc); echo " GB"
echo -n "RAM_USED = "; echo -n $(echo "scale=3;x=${Mem[2]}/1073741824; if(x<1) print 0; x" | bc); echo " GB"
echo -n "RAM_FREE = "; echo -n $(echo "scale=3;x=${Mem[3]}/1073741824; if(x<1) print 0; x" | bc); echo " GB"
Space=($(df -B1 / | grep /))
echo -n "SPACE_ROOT = "; echo -n $(echo "scale=2;x=${Space[1]}/1048576; if(x<1) print 0; x" | bc); echo " MB"
echo -n "SPACE_ROOT_USED = "; echo -n $(echo "scale=2;x=${Space[2]}/1048576; if(x<1) print 0; x" | bc); echo " MB"
echo -n "SPACE_ROOT_FREE = "; echo -n $(echo "scale=2;x=${Space[3]}/1048576; if(x<1) print 0; x" | bc); echo " MB"
