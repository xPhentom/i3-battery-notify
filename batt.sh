#!/bin/bash

while true; do

clicked=false

percentage=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | cut -d ":" -f2 | xargs | cut -d '%' -f1`
 
state=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state | cut -d ":" -f2 | xargs`

sleep 5s

if [ $percentage -le 10 -a $state = "discharging" -a $clicked=false ]; then
	i3-nagbar -m "Your battery is at $percentage %"
	$clicked=true

elif [ $percentage -ge 95 -a $state = "charging" -a $clicked=false ]; then
	i3-nagbar -t warning -m "Your battery is fully charged"
	$clicked=true
else
	$clicked=false
fi

done
