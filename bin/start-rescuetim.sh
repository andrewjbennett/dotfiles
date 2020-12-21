#!/bin/bash

if pgrep "rescuetime" > /dev/null; 
then 
    echo -n "running yay"; 
else 
    echo -n "starting rescuetime...";
    rescuetime & 2> /dev/null
    exit
fi

#if pgrep "rescuetime" > /dev/null
#then
#    echo "running"

    #echo -n "not running"
    #date
    #/usr/bin/rescuetime &
    #echo "done"
#else
    #echo "rescuetime "
#    echo "not running"
#fi
