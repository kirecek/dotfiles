#!/bin/env bash

status="$(cat /sys/class/power_supply/AC/online)"
battery="$(cat /sys/class/power_supply/BAT0/capacity)"
echo -ne "bat[${battery}%]"
