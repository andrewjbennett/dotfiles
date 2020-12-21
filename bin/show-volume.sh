#!/bin/bash
volume=$(amixer get Master | egrep -o "[0-9]+%" | tr -d '%')

if [[ $volume -lt 1 ]]; then
    echo -n '<fn=1></fn>'
elif [[ $volume -lt 30 ]]; then
    echo -n '<fn=1></fn>'
else
    echo -n '<fn=1></fn>'
fi
echo " $volume%"

exit



if [[ $volume -lt 10 ]]; then
    echo -n '<fn=1></fn>'
elif [[ $volume -lt 25 ]]; then
    echo -n '<fn=1></fn>'
elif [[ $volume -lt 51 ]]; then
    echo -n '<fn=1></fn>'
elif [[ $volume -lt 80 ]]; then
    echo -n '<fn=1></fn>'
else
    echo -n '<fn=1><</fn>'
fi

echo " $volume%"
