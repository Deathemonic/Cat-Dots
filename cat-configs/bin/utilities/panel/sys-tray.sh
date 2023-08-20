#!/bin/sh

cache="$(xdg-user-dir CACHE)/polybar/tray.lock"
config="$(xdg-user-dir CONFIG)/cat-configs/polybar/modules.ini"

if [ "$(pgrep stalonetray)" ]; then
    if [ ! -e "$cache" ]; then
        polybar-msg action "#tray.hook.1"
        xdo hide -n stalonetray
        touch "$cache"
        sed -i 's/tray\ninitial=.*/tray\ninitial=2/g' "$config"
    else
        polybar-msg action "#tray.hook.0"
        xdo show -n stalonetray
        xdo raise -n stalonetray
        rm "$cache"
        sed -i 's/tray\ninitial=.*/tray\ninitial=1/g' "$config"
    fi
else
    stalonetray -c "$(xdg-user-dir CONFIG)"/polybar/stalonetrayrc &
fi
