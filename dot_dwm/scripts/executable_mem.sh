#!/usr/bin/env bash

mem=`free -h | awk '/Mem/ {printf "%.2f/%.2f Gi\n", $3, $2}'`
echo -en " $mem"
