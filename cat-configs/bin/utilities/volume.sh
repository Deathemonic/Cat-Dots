#!/bin/sh

icon_path="$(xdg-user-dir CONFIG)/cat-configs/dunst/icons"
colorscheme=mocha

notify () {
    volume=$(pamixer --get-volume)

    if [ "$volume" -lt "35" ]; then
        icon="$icon_path/$colorscheme/volume-none.svg"
    elif [ "$volume" -lt "70" ]; then
        icon="$icon_path/$colorscheme/volume-low.svg"
    else
        icon="$icon_path/$colorscheme/volume-high.svg"
    fi

    notify-send -a "Volume" -u normal -i "$icon" -r 696969 "Volume : $volume"
}

docs () {
	echo "
Usage:	volume [Options]
    --help    -   Prints this message
Options:
    --up      -   Increase the volume
    --down    -   Decrease the volume
    --mute    -   Mute the volume
	"
}

case $1 in
    --up)
	    pamixer -i 5 --set-limit 100
	    notify
    ;;
    --down)
	    pamixer -d 5 --set-limit 100
	    notify
    ;;
    --mute)
	    pamixer -t
        if [ "$(pamixer --get-mute)" = "true" ]; then
            icon="$icon_path/$colorscheme/volume-mute.svg"
            notify-send -a Volume -i "$icon" -r 699 "Volume : Muted"
        else
            notify
        fi
    ;;
    --help | *)
        docs
    ;;
esac
