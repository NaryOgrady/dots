#!/bin/bash
MONITOR1=("1" "3" "5" "7" "9")
MONITOR2=("2" "4" "6" "8" "10")

function move {
    grouped=$(hyprctl activewindow -j | jq '.grouped | .[0]')

    if [[ $grouped != "null" ]]; then
        if [[ $1 == "u" || $1 == "d" ]]; then
            hyprctl dispatch moveoutofgroup
            exit
        elif [ $1 == "r" ]; then
            hyprctl dispatch changegroupactive f
        elif [ $1 == "l" ]; then
            hyprctl dispatch changegroupactive b
        fi
        exit
    fi

    grouped_windows=$(hyprctl clients -j | jq '.[] | .grouped | .[]' | wc -l)
    hyprctl dispatch moveintogroup $1
    new_grouped_windows=$(hyprctl clients -j | jq '.[] | .grouped | .[]' | wc -l)
    echo $grouped_windows
    echo $new_grouped_windows
    if [ $grouped_windows != $new_grouped_windows ]; then
        exit
    fi
    hyprctl dispatch movewindow $1
}

function scroll {
    active_monitor=$(hyprctl activeworkspace -j | jq -r '.monitor')
    monitor_id=$(hyprctl monitors -j | jq '.[] | select(.name == '\"$active_monitor\"') | .id')
    active_workspace=$(hyprctl activeworkspace -j | jq '.id')
    eval "ws_array=(\"\${MONITOR${monitor_id}[@]}\")"
    index=0
    for ws in "${ws_array[@]}"
    do
        if [ $ws == $active_workspace ]; then
            break
        fi
        ((index=index+1))
    done
    if [ $1 == "f" ]; then
        ((index=index+1))
    elif [ $1 == "b" ]; then
        ((index=index-1))
    fi
    new_ws="${ws_array[index]}"
    hyprctl dispatch workspace $new_ws
}


if [ "$1" == "move" ]; then
    move $2
elif [ "$1" == "scroll" ]; then
    scroll $2
else
    notify-send "invalid param"
fi
