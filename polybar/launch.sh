#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "----" | tee -a /tmp/polybar_top.log /tmp/polybar_bottom.log
polybar top -c ~/.config/polybar/config-top.ini 2>&1 &
#polybar bottom -c ~/.config/polybar/config-bottom.ini 2>&1 &

echo "Bars launched..."
