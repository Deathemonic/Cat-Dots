#!/bin/sh

config="$(xdg-user-dir CONFIG)/cat-configs/picom/picom.conf"

killall -q picom
while pgrep -u "$(id -u)" -x picom >/dev/null; do sleep 1; done

# picom --config "$config" &
# If you have problems uncomment the line bellow and comment the line above or vice versa (This will enable experimental backend which is not recommended with low end devices)
# picom --experimental-backends --config "$config" &
# Same goes to --legacy-backends
picom --legacy-backends --config "$config" &
