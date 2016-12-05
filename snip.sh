#!/bin/bash

# A script to take a screenshot, save to a file *and* copy to clipboard.
# Because gnome-screenshot can't do both.
# Assumes you have `gnome-screenshot` and `xclip` installed

# Andrew Bennett <andrew.bennett@unsw.edu.au> 2016-11-05

USERNAME=$(whoami)
 
# set to where you want pictures to go to
BASE_DIR="/home/$USERNAME/Pictures/"

# set what you want your file to be called.
SCREENSHOT_STRING="Screenshot from %Y-%m-%d %H-%M-%S.png"

# fill that in with the actual date
DATE_STRING=$(date +"$SCREENSHOT_STRING")

# put them together
FILE_LOC="$BASE_DIR/$DATE_STRING"

# save it to a file first, because gnome-screenshot loses the clipboard
echo "Taking screenshot"
echo "Saving to $FILE_LOC"
gnome-screenshot -a -f "$FILE_LOC"

# then copy it to the clipboard manually with xclip
echo "Copying to clipboard"
TYPE=$(file -b --mime-type "$FILE_LOC")
xclip -selection clipboard -t "$TYPE" < "$FILE_LOC"



