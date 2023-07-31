#!/bin/sh

if [ `pidof dunst` ]; then
	pkill dunst
fi

dunst -config $HOME/.config/cat-configs/dunst/dunstrc &
