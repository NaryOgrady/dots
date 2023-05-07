#!/bin/bash

function move {
    grouped = $(hyprctl activewindow -j | jq '.grouped | .[0]')
    echo $grouped

    if [[ $grouped != "" ]]; then
        hyprctl dispatch moveoutofgroup
        hyprctl dispatch movewindow $1
        exit
    fi

    hyprctl dispatch moveintogroup $1
    hyprctl dispatch movewindow $1
}


if [ "$1" == "move" ]; then
    move $2
elif [ "$1" == "network" ]; then
    echo  "Other action"
else
    notify-send "invalid param"
fi
