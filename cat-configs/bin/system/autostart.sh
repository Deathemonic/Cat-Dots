#!/bin/sh

# Warning: This file is important don't delete or modify anything unless know what your doing

# Kill already running processs
process="xsettingsd sxhkd polybar picom dunst mpd mpDris2 xfce4-power-manager bspc"
for processed in $process; do
  if [ "$(pidof "$processed")" ]; then
	  killall -9 "$processed"
  fi
done

# Load Xresources
xrdb "$HOME"/.Xresources

# Load xsettingsd &
xsettingsd &

# Fix cursor
xsetroot -cursor_name left_ptr &

# Fix Java programs
export _JAVA_AWT_WM_NONREPARENTING=1

# Polkit agent (Gnome)
if [ ! "$(pidof polkit-gnome-authentication-agent-1)" ]; then
  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi

# Power Management
xfce4-power-manager &

# Set/Restore wallpaper
feh --bg-fill -r "$HOME/.wall" &

# Panel
sh "$(xdg-user-dir CONFIG)/cat-configs/bin/system/panel.sh" &

# Notification
sh "$(xdg-user-dir CONFIG)/cat-configs/bin/system/notifications.sh" &

# Compositor
sh "$(xdg-user-dir CONFIG)/cat-configs/bin/system/compositor.sh" &

# Keybinds
sxhkd -c "$(xdg-user-dir CONFIG)/bspwm/sxhkdrc" &

# Start programs
exec mpd &
exec mpDris2 &
