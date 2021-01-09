#!/bin/env bash

essid="$(iwconfig 2>/dev/null | grep ESSID | cut -d: -f2)"
wifiawk="$(echo $essid | awk -F',' '{gsub(/"/, "", $1); print $1}')"
status="$(echo $wifiawk | cut -d' ' -f1)"
echo -ne " ${status}"
