#!/bin/bash

killall xbattbar
sleep 2

DISPLAY=:0 gnome-screensaver-command --query | grep " active"
if [ $? == 0 ]; then
    echo "quitting"
    exit 1
fi

#if [ "`gnome-screensaver-command --query | head -1`" = "The screensaver is active" ]; then
#    exit 1;
#fi

/home/andrew/bin/xbattbar.sh &
