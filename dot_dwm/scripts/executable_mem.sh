#!/usr/bin/env bash

mem=`free -h | awk '/Mem/ {printf "%s/%s\n", $3, $2}'`
echo -en "mem[$mem]"
