#!/bin/bash

mode=$(i3-msg -t get_bar_config bar-0 | jq .mode 2> /dev/null)

if [ "$mode" = '"invisible"' ]; then
    i3-msg -q bar mode hide 
else
    i3-msg -q bar mode invisible
fi
