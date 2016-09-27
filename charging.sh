#!/bin/bash

# set up color array

outer[0]="00ff00" # green
outer[1]="ffff00" # magenta

inner[0]="ff0000" # red
inner[1]="ff8800" # orange?

color[0]="bb00ff"
color[1]="aabbcc"
color[2]="bb33ee"
color[3]="00ffff"
color[4]="00ff00"
color[5]="0000ff"

orangered[0]="ff0000"
orangered[1]="ff8800"
orangered[2]="ff3300"
orangered[3]="ff1100"


POWERSUPPLY="/sys/class/power_supply/ACAD/online" # could be different on your system!
NOT_CHARGING="0"

STATUS=$(cat $POWERSUPPLY)

#RANDNUM1=$[ $RANDOM % 5 ]

# this is how entropy works right?
unusednu=$[ $RANDOM % 5 ]
unusedni=$[ $RANDOM % 5 ]

RANDNUM2=$[ $RANDOM % 5 ]
RANDNUM1=$[ $RANDOM % 4 ]

OUTERRAND=$[ $RANDOM % 2 ]
# INNERRAND=$[ $RANDOM % 2 ]
INNERRAND=0


TIMETHING=$(($(date +%s%N | cut -c1-10) % 2))

if [ $STATUS = $NOT_CHARGING ]
then
    echo "<fc=#${outer[$TIMETHING]}>!!!</fc> <fc=#${inner[$INNERRAND]}>NOT PLUGGED IN</fc> <fc=#${outer[$TIMETHING]}>!!!</fc>"
    # echo "<fc=#${outer[$OUTERRAND]}>!!!</fc> <fc=#${inner[$INNERRAND]}>NOT PLUGGED IN</fc> <fc=#${outer[$OUTERRAND]}>!!!</fc>"
    # echo "<fc=#${color[$RANDNUM2]}>!!!</fc> <fc=#ff0000>NOT PLUGGED IN</fc> <fc=#${color[$RANDNUM2]}>!!!</fc>"
    # echo "<fc=#${color[$RANDNUM2]}>!!!</fc> <fc=#${color[$RANDNUM1]}>NOT PLUGGED IN</fc> <fc=#${color[$RANDNUM2]}>!!!</fc>"
fi

exit 0

