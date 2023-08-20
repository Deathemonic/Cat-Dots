#!/bin/sh

catconfigs="$(xdg-user-dir CONFIG)/cat-configs"

screenshot="$catconfigs/bin/utilities/screenshot.sh"
screenshot="$catconfigs/bin/utilities/screenrecord.sh"
lockscreen="$catconfigs/bin/utilities/lockscreen.sh"

network="$catconfigss/rofi/network.ini"
alacritty="$catconfigs/alacritty/alacritty.yml"
dunst="$catconfigs/dunst/dunstrc"
polybar="$catconfigs/polybar/config.ini"
rofi="$catconfigs/rofi/colors.rasi"


invalid_color () {
  echo "Invalid colorpallete, try: latte, frappe, macchiato, mocha"
  exit
}


notification () {
  case $1 in
    latte)
      sed -i 's/background = ".*"/background = "#EFF1F5"/g' "$dunst"
      sed -i 's/foreground = ".*"/foreground = "#4C4F69"/g' "$dunst"
      sed -i 's/frame_color = ".*"/frame_color = "#FE640B"/g' "$dunst"

      sed -i 's/colorscheme=.*/colorscheme=latte/g' "$screenshot"
      sed -i 's/colorscheme=.*/colorscheme=latte/g' "$screenrecord"
      sed -i 's/icons\/.*\/network\.svg/icons\/latte\/network\.svg/g' "$network"
    ;;
    frappe)
      sed -i 's/background = ".*"/background = "#303446"/g' "$dunst"
      sed -i 's/foreground = ".*"/foreground = "#C6D0F5"/g' "$dunst"
      sed -i 's/frame_color = ".*"/frame_color = "#EF9F76"/g' "$dunst"

      sed -i 's/colorscheme=.*/colorscheme=frappe/g' "$screenshot"
      sed -i 's/colorscheme=.*/colorscheme=frappe/g' "$screenrecord"
      sed -i 's/icons\/.*\/network\.svg/icons\/frappe\/network\.svg/g' "$network"
    ;;
    macchiato)
      sed -i 's/background = ".*"/background = "#24273A"/g' "$dunst"
      sed -i 's/foreground = ".*"/foreground = "#CAD3F5"/g' "$dunst"
      sed -i 's/frame_color = ".*"/frame_color = "#F5A97F"/g' "$dunst"

      sed -i 's/colorscheme=.*/colorscheme=macchiato/g' "$screenshot"
      sed -i 's/colorscheme=.*/colorscheme=macchiato/g' "$screenrecord"
      sed -i 's/icons\/.*\/network\.svg/icons\/macchiato\/network\.svg/g' "$network"
    ;;
    mocha)
      sed -i 's/background = ".*"/background = "#1E1E2E"/g' "$dunst"
      sed -i 's/foreground = ".*"/foreground = "#CDD6F4"/g' "$dunst"
      sed -i 's/frame_color = ".*"/frame_color = "#FE6400"/g' "$dunst"

      sed -i 's/colorscheme=.*/colorscheme=macchiato/g' "$screenshot"
      sed -i 's/colorscheme=.*/colorscheme=macchiato/g' "$screenrecord"
      sed -i 's/icons\/.*\/network\.svg/icons\/mocha\/network\.svg/g' "$network"
    ;;
    *)
      invalid_color
    ;;
  esac

  sh "$catconfigs/bin/system/notifications.sh"
}

panel () {
  case $1 in
    latte)
      sed -i 's/palletes\/polybar\/.*\.ini/palletes\/polybar\/latte\.ini/g' "$polybar"
    ;;
    frappe)
      sed -i 's/palletes\/polybar\/.*\.ini/palletes\/polybar\/frappe\.ini/g' "$polybar"

    ;;
    macchiato)
      sed -i 's/palletes\/polybar\/.*\.ini/palletes\/polybar\/macchiato\.ini/g' "$polybar"

    ;;
    mocha)
      sed -i 's/palletes\/polybar\/.*\.ini/palletes\/polybar\/mocha\.ini/g' "$polybar"
    ;;
    *)
      invalid_color
    ;;
  esac

  sh "$catconfigs/bin/system/panel.sh"
}

terminal () {
  case $1 in
    latte)
      sed -i 's/palletes\/alacritty\/.*\.yml/palletes\/alacritty\/latte\.yml/g' "$alacritty"
    ;;
    frappe)
      sed -i 's/palletes\/alacritty\/.*\.yml/palletes\/alacritty\/frappe\.yml/g' "$alacritty"

    ;;
    macchiato)
      sed -i 's/palletes\/alacritty\/.*\.yml/palletes\/alacritty\/macchiato\.yml/g' "$alacritty"

    ;;
    mocha)
      sed -i 's/palletes\/alacritty\/.*\.yml/palletes\/alacritty\/mocha\.yml/g' "$alacritty"
    ;;
    *)
      invalid_color
    ;;
  esac
}

menu () {
  case $1 in
    latte)
      sed -i 's/palletes\/rofi\/.*/palletes\/rofi\/latte/g' "$rofi"
    ;;
    frappe)
      sed -i 's/palletes\/rofi\/.*/palletes\/rofi\/frappe/g' "$rofi"
    ;;
    macchiato)
      sed -i 's/palletes\/rofi\/.*/palletes\/rofi\/macchiato/g' "$rofi"

    ;;
    mocha)
      sed -i 's/palletes\/rofi\/.*/palletes\/rofi\/mocha/g' "$rofi"
    ;;
    *)
      invalid_color
    ;;
  esac
}

lockscreen () {
  case $1 in
    latte)
      sed -i 's/base=.*/base=#eff1f5/g' "$lockscreen"
      sed -i 's/mantle=.*/mantle=#e6e9ef/g' "$lockscreen"
      sed -i 's/green=.*/green=#40a02b/g' "$lockscreen"
      sed -i 's/red=.*/red=#d20f39/g' "$lockscreen"
      sed -i 's/text=.*/text=#4c4f69/g' "$lockscreen"
    ;;
    frappe)
      sed -i 's/base=.*/base=#303446/g' "$lockscreen"
      sed -i 's/mantle=.*/mantle=#292c3c/g' "$lockscreen"
      sed -i 's/green=.*/green=#a6d189/g' "$lockscreen"
      sed -i 's/red=.*/red=#e78284/g' "$lockscreen"
      sed -i 's/text=.*/text=#c6d0f5/g' "$lockscreen"
    ;;
    macchiato)
      sed -i 's/base=.*/base=#24273a/g' "$lockscreen"
      sed -i 's/mantle=.*/mantle=#1e2030/g' "$lockscreen"
      sed -i 's/green=.*/green=#a6da95/g' "$lockscreen"
      sed -i 's/red=.*/red=#ed8796/g' "$lockscreen"
      sed -i 's/text=.*/text=#cad3f5/g' "$lockscreen"
    ;;
    mocha)
      sed -i 's/base=.*/base=#1e1e2e/g' "$lockscreen"
      sed -i 's/mantle=.*/mantle=#181825/g' "$lockscreen"
      sed -i 's/green=.*/green=#a6e3a1/g' "$lockscreen"
      sed -i 's/red=.*/red=#f38ba8/g' "$lockscreen"
      sed -i 's/text=.*/text=#cdd6f4/g' "$lockscreen"
    ;;
    *)
      invalid_color
    ;;
  esac
}

case $1 in
  --terminal | -t)
    terminal "$2"
  ;;
  --notification | -n)
    notification "$2"
  ;;
  --panel | -p)
    panel "$2"
  ;;
  --menu | -m)
    menu "$2"
  ;;
  --lockscreen | -l)
    lockscreen "$2"
  ;;
esac

