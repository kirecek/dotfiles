#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='gruvbox'

## Run
wofi \
    --show drun \
    --style ${dir}/${theme}.rasi
