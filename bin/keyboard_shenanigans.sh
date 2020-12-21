#!/bin/bash
LOGFILE=/tmp/keyboard_shenanigans.log
echo "RUN: at `date` by `whoami` act $ACTION \$1 $1 DEVPATH $DEVPATH DEVNAME $DEVNAME" >> ${LOGFILE}

HOME=/home/andrew
XAUTHORITY=/run/user/1000/gdm/Xauthority
DISPLAY=:0
export HOME XAUTHORITY DISPLAY

#echo "About to run xinput list:" >> ${LOGFILE}
#xinput list >> ${LOGFILE}
#echo "Just ran xinput list:" >> ${LOGFILE}

# Bluetooth keytboard ID
BLUETOOTH_KEYBOARD_ID=$(xinput list | grep Bluetooth | egrep "slave +keyboard" | egrep -o "id=[0-9]+" | cut -d'=' -f2)

# Built-in keyboard ID
INTERNAL_KEYBOARD_ID=$(xinput list | grep "AT Translated" | egrep "slave +keyboard" | egrep -o "id=[0-9]+" | cut -d'=' -f2)


echo "Bluetooth ID: $BLUETOOTH_KEYBOARD_ID, Internal ID: $INTERNAL_KEYBOARD_ID" >> ${LOGFILE}


if [ "$ACTION" == "bind" ];
then
    echo "Connected to bluetooth (ID=$BLUETOOTH_KEYBOARD_ID)" >> ${LOGFILE}
    echo "Disabling internal keyboard (ID=$INTERNAL_KEYBOARD_ID)" >> ${LOGFILE}

    # Bluetooth keyboard added, so disable internal keyboard
    xinput disable $INTERNAL_KEYBOARD_ID

fi

if [ "$ACTION" == "remove" ];
then
    echo "Disconnected from bluetooth, re-enabling internal keyboard (ID=$INTERNAL_KEYBOARD_ID)" >> ${LOGFILE}
    xinput enable $INTERNAL_KEYBOARD_ID
fi

echo >> ${LOGFILE}
