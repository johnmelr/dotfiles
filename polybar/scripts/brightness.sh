#!/bin/sh

# Script for adjusting adjusting screen brightness using brightnessctl

brightness="$(brightnessctl | grep -E "[0-9]*%" | gawk 'match ($0, /[0-9]*%/, arr) { print arr[0] }' | tr % ' ')"

if [ -z "$1" ]; then
    echo "$brightness"
elif [ "$1" = "increase_brightness" ]; then
    inc="$((brightness+5))"
    echo $inc
    brightnessctl s "$inc%"
elif [ "$1" = "decrease_brightness" ]; then
    dec="$((brightness-5))"
    brightnessctl s "$dec%"
fi
