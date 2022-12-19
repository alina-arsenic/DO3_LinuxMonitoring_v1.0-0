#!/bin/bash

case "$2" in
    "1" )
    echo -n "\033[37;1;" # white text
    ;;
    "2" )
    echo -n "\033[31;" # red text
    ;;
    "3" )
    echo -n "\033[32;" # green text
    ;;
    "4" )
    echo -n "\033[34;" # blue text
    ;;
    "5" )
    echo -n "\033[35;" # purple text
    ;;
    "6" )
    echo -n "\033[30;" # black text
    ;;
esac
case "$1" in
    "1" )
    echo -n "47;1" # white background
    ;;
    "2" )
    echo -n "41" # red background
    ;;
    "3" )
    echo -n "42" # green background
    ;;
    "4" )
    echo -n "44" # blue background
    ;;
    "5" )
    echo -n "45" # purple background
    ;;
    "6" )
    echo -n "40" # black background
    ;;
esac
echo -n "m "

case "$4" in
    "1" )
    echo -n "\033[37;1;" # white text
    ;;
    "2" )
    echo -n "\033[31;" # red text
    ;;
    "3" )
    echo -n "\033[32;" # green text
    ;;
    "4" )
    echo -n "\033[34;" # blue text
    ;;
    "5" )
    echo -n "\033[35;" # purple text
    ;;
    "6" )
    echo -n "\033[30;" # black text
    ;;
esac
case "$3" in
    "1" )
    echo -n "47;1" # white background
    ;;
    "2" )
    echo -n "41" # red background
    ;;
    "3" )
    echo -n "42" # green background
    ;;
    "4" )
    echo -n "44" # blue background
    ;;
    "5" )
    echo -n "45" # purple background
    ;;
    "6" )
    echo -n "40" # black background
    ;;
esac
echo -n "m "

echo "\033[0m "
