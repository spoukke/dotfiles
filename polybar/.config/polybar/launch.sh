#!/bin/sh

# Terminate already running polybar instances
pkill -x polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch Polybar on all monitors
if type "xrandr" >/dev/null 2>&1; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mybar &
    done
else
    polybar --reload mybar &
fi

echo "Polybar launched!"
