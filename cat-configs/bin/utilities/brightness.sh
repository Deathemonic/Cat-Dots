#!/bin/sh

icon_path="$(xdg-user-dir CONFIG)/cat-configs/dunst/icons"
colorscheme=mocha

notify () {
  brightness=$(brightnessctl i | grep -oP '\(\K[^%\)]+')

    if [ "$brightness" -lt "35" ]; then
        icon="$icon_path/$colorscheme/moon.svg"
    elif [ "$brightness" -lt "75" ]; then
        icon="$icon_path/$colorscheme/sun-dim.svg"
    else
        icon="$icon_path/$colorscheme/sun.svg"
    fi

    notify-send -a Brightness -i "$icon" -t 2000 -r 969696 "Brightness : $brightness"
}

docs () {
	echo "
Usage:	brightness [Options]
    
Options:
    up      -   Increase the brightness
    down    -   Decrease the brightness
	"
}

case $1 in
    --up)
        brightnessctl set 5%+ -q
        notify
    ;;
    --down)
        brightnessctl set 5%- -q
        notify
    ;;
    --help | *)
        docs
    ;;
esac
