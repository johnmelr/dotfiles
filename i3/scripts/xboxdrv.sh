#!/bin/bash

# Kill all existing xboxdrv process
killall xboxdrv

# Wait until all process has been kills
while pgrep -x xboxdrv >/dev/null; do sleep 1; done

xboxdrv --evdev /dev/btjoy --config $HOME/.config/xboxdrv/dobe.conf
