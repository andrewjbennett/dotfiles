#!/bin/bash
percent=`acpi | cut -d'%' -f1 | cut -d',' -f2 | tr -d ' '`
if [[ $percent -lt 5 ]]; then
  echo "LOW BATTERY!!!!!"
fi

