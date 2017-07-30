#!/usr/bin/bash

# Terminate already running instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar>/dev/null; do sleep 1; done

# Launch polybar
polybar example
