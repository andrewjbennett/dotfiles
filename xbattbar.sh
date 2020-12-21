#!/bin/bash

source /home/andrew/.bashrc
export DISPLAY=':0.0' 
echo "hello $(date)" >> /tmp/asdfasdf

xbattbar -a -c -t 4  -i \#0e8bff -o \#ec251a -I \#8bff0e right 2>/tmp/qwer &
