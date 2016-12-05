#!/bin/bash

LED_PATH="/sys/class/leds/input4::capslock/trigger"
if [ "$#" -ne 1 ]; then
    OPTIONS=$(cat $LED_PATH)
    echo "Your options are:"
    for option in $OPTIONS; do
        echo "  $option";
    done
    exit
fi


echo "Enabling $1..."
echo "$1" | sudo tee $LED_PATH
exit


