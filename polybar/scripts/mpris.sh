#!/bin/sh

# If multiple players are running, look for the first instance
# that is currently playing
player_list=$(playerctl -l | tr "\n" " " 2> /dev/null)
running_player=""

for player in $player_list
do
    player_status=$(playerctl --player="$player" status 2> /dev/null)

    if [ "$player_status" = "Playing" ]; then
        running_player="$player"
        break
    fi
done

if [ "$running_player" != "" ]; then
    title=$(playerctl --player="$running_player" metadata title)
    artist=$(playerctl --player="$running_player" metadata artist)

    echo "$title - $artist" 
else
    echo "No players found"
fi
