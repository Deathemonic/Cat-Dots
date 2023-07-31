#!/bin/sh

killall -q picom
while pgrep -u $(id -u) -x picom >/dev/null; do sleep 1; done
picom --config $HOME/.config/cat-configs/picom/picom.conf &

# If you have problems uncomment the line bellow and comment the line above or vice versa (This will enable experimental backend which is not recommended with low end devices)
# picom --experimental-backends --config ~/.config/sweetconfigs-xorg/picom/picom.conf
