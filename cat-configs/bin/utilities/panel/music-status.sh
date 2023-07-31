#!/bin/sh

bar="cat-configs"
bar_pid=$(pgrep -a "polybar" | grep "$bar" | cut -d" " -f1)

players="spotify,%any,firefox,chromium,brave,mpd"
player_status=$(playerctl -p $players status)

script_dir=$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)
exit=$?

update_hooks () {
  echo $1 | while IFS= read -r id; do
    polybar-msg -p "$id" hook music-play-pause $2 1>/dev/null 2>&1
  done
}

zscroll () {
  zscroll -l 20 \
    --delay 1 \
    --scroll-padding " | " \
    --match-command "$script_dir/music-status.sh --status" \
    --match-text "Playing" "--scroll true" \
    --match-text "Paused" "--scroll false" \
    --match-text "No players found" "--scroll false" \
    --match-text "Offline" "--scroll false" \
    --update-check true "$script_dir/music-status.sh" &
  
  wait
}

if [ $exit -eq 0 ]; then
    status=$player_status
else
    status="Offline"
fi

if [ "$1" = "--status" ]; then
    echo $player_status
else 
  if [ "$player_status" = "Stopped" ]; then
    echo "Offline"
  elif [ "$player_status" = "Paused" ]; then
    update_hooks "$bar_pid" 2
    playerctl -p $players metadata --format '{{ artist }} - {{ title }}'
  elif [ "$player_status" = "Offline" ]; then
    echo $player_status
  else
    update_hooks "$bar_pid" 1
    playerctl -p $players metadata --format '{{ artist }} - {{ title }}'
  fi
fi


case $1 in
  --scroll)
    zscroll
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
