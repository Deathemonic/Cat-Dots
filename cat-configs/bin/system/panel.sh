#!/bin/sh

cache="$(xdg-user-dir CACHE)/polybar"
config="$(xdg-user-dir CONFIG)/cat-configs/polybar"

mkdir -p "$cache" 2>/dev/null

get_values () {
  card=$(brightnessctl -l | awk '/backlight/ {gsub(/'\''/, "", $2); print $2; exit}')
  battery=$(upower -i "$(upower -e | grep 'BAT')" | grep 'native-path' | cut -d':' -f2 | tr -d '[:blank:]')
  adapter=$(upower -i "$(upower -e | grep 'AC')" | grep 'native-path' | cut -d':' -f2 | tr -d '[:blank:]')
  interface=$(ip link | awk '/state UP/ {print $2}' | tr -d :)
}

set_values () {
  if [ "$adapter" ]; then
    sed -i -e "s/adapter = .*/adapter = $adapter/g" "$config/system.ini"
  fi

  if [ "$battery" ]; then
    sed -i -e "s/battery = .*/battery = $battery/g" "$config/system.ini"
  fi

  if [ "$card" ]; then
    sed -i -e "s/graphics_card = .*/graphics_card = $card/g" "$config/system.ini"
  fi
	
  if [ "$interface" ]; then
    sed -i -e "s/network_interface = .*/network_interface = $interface/g" "$config/system.ini"
  fi
}


launch_bar () {
	killall -q polybar
  while pgrep -u "$(id -u)" -x polybar >/dev/null; do sleep 1; done

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q main -c "$config/config.ini" &
	done
}

if [ ! -f "$cache/system.ini" ]; then
  get_values
  set_values
  touch "$cache/system.ini"
fi

launch_bar
