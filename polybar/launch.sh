#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
echo "----" | tee -a /tmp/polybar_main.log /tmp/polybar_right.log
polybar main -c ~/.config/polybar/config-main-monitor.ini 2>&1 &
polybar right -c ~/.config/polybar/config-right-monitor.ini 2>&1 &

echo "Bars launched..."
