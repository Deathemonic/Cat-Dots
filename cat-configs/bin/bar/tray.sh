#!/bin/sh

hidden=/tmp/polytray.lock
config="$HOME/.config/cat-configs/polybar/modules.ini"

if [[ $(pidof stalonetray) ]]; then
    if [[ ! -e $hidden ]]; then
        polybar-msg action "#tray.hook.1"
        xdo hide -n stalonetray
        touch "$hidden"
        sed -i 's/tray\ninitial=.*/tray\ninitial=2/g' "$config"
    else
        polybar-msg action "#tray.hook.0"
        xdo show -n stalonetray
        xdo raise -n stalonetray
        rm "$hidden"
        sed -i 's/tray\ninitial=.*/tray\ninitial=1/g' "$config"
    fi
else
    stalonetray -c $HOME/.config/cat-configs/polybar/stalonetrayrc &
fi