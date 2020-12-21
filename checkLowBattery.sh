#!/bin/bash

POWERSUPPLY="/sys/class/power_supply/ACAD/online" # could be different on your system!
TOO_LOW=20 # how low is too low?
NOT_CHARGING="0"
ICON="/usr/share/icons/ubuntu-mono-dark/status/24/battery-low.svg" # eye candy

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

BATTERY_LEVEL=$(acpi -b | grep -v "rate information unavailable" | grep -P -o '[1-9]+(?=%)') # | head -1)
STATUS=$(cat $POWERSUPPLY)

if [ $BATTERY_LEVEL -le $TOO_LOW -a $STATUS = $NOT_CHARGING ]
then
    /usr/bin/notify-send -u critical -i "$ICON" -t 3000 "Battery low" "Battery level is ${BATTERY_LEVEL}%!"
fi

exit 0

