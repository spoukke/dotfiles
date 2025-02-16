#!/bin/sh

# Kill existing Polybar instances
pkill -x polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch Polybar on all monitors
if type "xrandr" >/dev/null 2>&1; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --config=~/.config/polybar/config.ini --reload main &
    done
else
    polybar --config=~/.config/polybar/config.ini --reload main &
fi

echo "Polybar launched!"
