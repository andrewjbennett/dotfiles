#!/bin/bash
# this file exists because I'm too lazy [or something] to get 
# battery status popups when stuff goes flat
percent=`acpi | cut -d'%' -f1 | cut -d',' -f2 | tr -d ' '`
if [[ $percent -lt 5 ]]; then
  echo -n "VERYYYY"
fi
if [[ $percent -lt 10 ]]; then
  echo "LOW BATTERY!!!!!"
fi

