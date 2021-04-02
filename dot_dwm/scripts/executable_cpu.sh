#!/usr/bin/env bash

usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $3 + $4}')

echo -ne "cpu[$usage%]"
