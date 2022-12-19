#!/bin/bash
source /etc/os-release

# $1 name color
# $2 number color
# $3 default

Timezone=$(cat /etc/timezone | tr "\n" " "; date +"%-:::z")
Date=$(date +"%-d %B %Y %T")
Uptime=$(uptime -p | cut -b 4-)
Uptime_sec=$(Uptime=$(</proc/uptime); echo ${Uptime%%.*})
IP=$(hostname -I)
Mask=$(ip a | grep $IP); Mask=${Mask##*/}; Mask=${Mask%% *}
Gate=$(ip r | grep "default"); Gate=${Gate##default via }; Gate=${Gate%% *}
Mem=($(free -b | grep Mem))
Space=($(df -B1 / | grep /))

echo -e "$1HOSTNAME$3 = $2$HOSTNAME$3"
echo -e "$1TIMEZONE$3 = $2$Timezone$3"
echo -e "$1USER$3 = $2$USER$3"
echo -e "$1OS$3 = $2$PRETTY_NAME$3"
echo -e "$1DATE$3 = $2$Date$3"
echo -e "$1UPTIME$3 = $2$Uptime$3"
echo -e "$1UPTIME_SEC$3 = $2$Uptime_sec$3"
echo -e "$1IP$3 = $2$IP$3"
echo -e "$1MASK$3 = $2/$Mask$3"
echo -e "$1GATEWAY$3 = $2$Gate$3"
echo -e "$1RAM_TOTAL$3 = $2$(echo "scale=3;x=${Mem[1]}/1073741824; if(x<1) print 0; x" | bc) GB$3"
echo -e "$1RAM_USED$3 = $2$(echo "scale=3;x=${Mem[2]}/1073741824; if(x<1) print 0; x" | bc) GB$3";
echo -e "$1RAM_FREE$3 = $2$(echo "scale=3;x=${Mem[3]}/1073741824; if(x<1) print 0; x" | bc) GB$3";
echo -e "$1SPACE_ROOT$3 = $2$(echo "scale=2;x=${Space[1]}/1048576; if(x<1) print 0; x" | bc) MB$3"
echo -e "$1SPACE_ROOT_USED$3 = $2$(echo "scale=2;x=${Space[2]}/1048576; if(x<1) print 0; x" | bc) MB$3"
echo -e "$1SPACE_ROOT_FREE$3 = $2$(echo "scale=2;x=${Space[3]}/1048576; if(x<1) print 0; x" | bc) MB$3"
