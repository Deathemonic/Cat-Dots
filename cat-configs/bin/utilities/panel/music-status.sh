#!/bin/sh

bar_pid=$(pgrep -a "polybar" | grep "cat-configs" | cut -d" " -f1)

players="spotify,%any,firefox,chromium,brave,mpd"
player_status=$(playerctl -p $players status)

script_dir=$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)
exit=$?

update_hooks () {
  echo "$1" | while IFS= read -r id; do
    polybar-msg -p "$id" hook music-play-pause "$2" 1>/dev/null 2>&1
  done
}

if [ $exit -eq 0 ]; then
  status="$player_status"
else
  status="Offline"
fi

scroll () {
  zscroll \
    -l 20 \
    --delay 1 \
    --scroll-padding " | " \
    --match-command "echo $status" \
    --match-text "Playing" "--scroll true" \
    --match-text "Paused" "--scroll false" \
    --match-text "Offline" "--scroll false" \
    --update-check true \
    "$script_dir/music-status.sh" &
  wait
}

case $player_status in
  Stopped)
    echo "$status"
  ;;
  Paused)
    update_hooks "$bar_pid" 2
    playerctl -p "$players" metadata --format '{{ artist }} - {{ title }}'
  ;;
  Offline)
    echo "Offline"
  ;;
  *)
    update_hooks "$bar_pid" 1
    playerctl -p $players metadata --format '{{ artist }} - {{ title }}'
  ;;
esac

case $1 in
  --scroll)
    scroll
  ;;
  --next)
    playerctl -p $players next
  ;;
	--previous)
    playerctl -p $players previous
  ;;
	--toggle)
    playerctl -p $players play-pause
  ;;
esac

