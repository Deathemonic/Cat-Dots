#!/bin/sh

config="$(xdg-user-dir CONFIG)/cat-configs/alacritty/alacritty.yml"

case $1 in
  --float)
    alacritty --class 'alacritty_floating' --config-file "$config"
  ;;
  --full)
    alacritty --class 'alacritty_fullscreen' --config-file "$config" -o window.startup_mode=fullscreen window.padding.x=30 window.padding.y=30 font.size=10
  ;;
  *)
    alacritty --config-file "$config" $2 $3
  ;;
esac
