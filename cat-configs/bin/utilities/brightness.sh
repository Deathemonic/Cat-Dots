#!/bin/sh

icon_path="$(xdg-user-dir CONFIG)/cat-configs/dunst/icons"
colorscheme=mocha

notify () {
  brightness=$(brightnessctl i | grep -oP '\(\K[^%\)]+')

    if [ "$brightness" -lt "15" ]; then
        icon="$icon_path/$colorscheme/brightness-1.svg"
    elif [ "$brightness" -lt "30" ]; then
        icon="$icon_path/$colorscheme/brightness-2.svg"
    elif [ "$brightness" -lt "45" ]; then
        icon="$icon_path/$colorscheme/brightness-3.svg"
    elif [ "$brightness" -lt "60" ]; then
        icon="$icon_path/$colorscheme/brightness-4.svg"
    elif [ "$brightness" -lt "75" ]; then
        icon="$icon_path/$colorscheme/brightness-5.svg"
    elif [ "$brightness" -lt "90" ]; then
        icon="$icon_path/$colorscheme/brightness-6.svg"
    else
        icon="$icon_path/$colorscheme/brightness-7.svg"
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
