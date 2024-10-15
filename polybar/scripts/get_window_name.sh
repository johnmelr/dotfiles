#!/bin/sh

window_title=$(xdotool getactivewindow  getwindowname 2> /dev/null)
window_name=$(xdotool getactivewindow getwindowclassname 2> /dev/null)

active_window=$(xdotool getactivewindow 2> /dev/null)

if [ -z "$active_window" ]; then
    echo "Arch Linux"
else
    echo "$window_name - $window_title"
fi

echo $active_window
# echo "$window_name - $window_title"
