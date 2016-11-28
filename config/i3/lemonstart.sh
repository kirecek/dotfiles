#!/bin/sh

pkill gobarout &>/dev/null
pkill lemonbar &>/dev/null

gobarout | lemonbar -B "#000000" -F "#FFFFFF" -u 3 -p -d | sh
