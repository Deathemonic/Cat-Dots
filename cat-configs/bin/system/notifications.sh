#!/bin/sh

if [ "$(pgrep dunst)" ]; then
	pkill dunst
fi

dunst -config "$(xdg-user-dir CONFIG)"/cat-configs/dunst/dunstrc &
