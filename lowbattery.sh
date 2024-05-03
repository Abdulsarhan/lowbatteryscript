#!/usr/bin/env sh

while true ; do

#Get battery % of bat0 and bat1
bat0capacity=$(cat /sys/class/power_supply/BAT0/capacity)
bat1capacity=$(cat /sys/class/power_supply/BAT1/capacity) 

#Get charging status of bat0 and bat1 (Charging or Not charging)
isbat0charging=$(cat /sys/class/power_supply/BAT0/status)
isbat1charging=$(cat /sys/class/power_supply/BAT1/status)

	if 
	[ "$bat0capacity" -le 10 ] &&
	[ "$bat0capacity" -ge 6 ] &&
	[ "$isbat0charging" = "Not charging" ] && 
	[ "$isbat1charging" = "Not charging" ]; 
		then
		notify-send -u normal -t 5000 "WARNING" "Low Battery!"
		lowbatwarningissued=1
	fi

	if
	[ "$bat0capacity" -le 5 ] &&
	[ "$isbat0charging" = "Not charging" ] &&
	[ "$isbat1charging" = "Not charging" ]; 
		then
		notify-send -u critical -t 5000 "WARNING" "BATTERY STATUS CRITICAL!"
		critbatwarningissued=1
	fi

	sleep 60;
done;
