#!/bin/sh

preview="$(xdg-user-dir CONFIG)/cat-configs/wallpapers/assets"
config="$(xdg-user-dir CONFIG)/cat-configs/rofi/pallete.rasi"
script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"

latte="$preview/latte_preview.png"
frappe="$preview/frappe_preview.png"
macchiato="$preview/macchiato_preview.png"
mocha="$preview/mocha_preview.png"

sh "$script_dir/accent.sh"

# Some posix shell like dash doesn't support escape sequence for hexadecemal so we convert it to octal
chosen="$(printf "Latte\0icon\037%s\nFrappe\0icon\037%s\nMacchiato\0icon\037%s\nMocha\0icon\037%s" "$latte" "$frappe" "$macchiato" "$mocha" | rofi -dmenu -theme "$config" -p "Pick a pallete")"

case $chosen in
  Latte)
    sh "$script_dir"/../pallete-changer.sh -a latte
  ;;
  Frappe)
    sh "$script_dir"/../pallete-changer.sh -a frappe
  ;;
  Macchiato)
    sh "$script_dir"/../pallete-changer.sh -a macchiato
  ;;
  Mocha)
    sh "$script_dir"/../pallete-changer.sh -a mocha
  ;;
esac

