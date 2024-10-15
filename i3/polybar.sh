#!/usr/bin/env sh

# Terminate running polybar instance
killall -q polybar

# Wait until all process has been terminated
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar -c $HOME/.config/polybar/simple/config.ini &
