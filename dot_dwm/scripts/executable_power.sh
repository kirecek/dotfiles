#!/bin/env bash

status="$(cat /sys/class/power_supply/AC/online)"
battery="$(cat /sys/class/power_supply/BAT0/capacity)"
if [ "${status}" == 1 ]; then
  echo -ne " ${battery}%"
else
  echo -ne " ${battery}%"
fi
