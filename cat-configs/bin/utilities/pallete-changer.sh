#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"
catconfigs="$(xdg-user-dir CONFIG)/cat-configs"

screenshot="$catconfigs/bin/utilities/screenshot.sh"
screenrecord="$catconfigs/bin/utilities/screenrecord.sh"
lockscreen="$catconfigs/bin/utilities/lockscreen.sh"
volume="$catconfigs/bin/utilities/volume.sh"
brightness="$catconfigs/bin/utilities/brightness.sh"
accent="$catconfigs/bin/utilities/menu/accent.sh"

network="$catconfigs/rofi/network.ini"
alacritty="$catconfigs/alacritty/alacritty.yml"
dunst="$catconfigs/dunst/dunstrc"
stalonetray="$catconfigs/polybar/stalonetrayrc"
polybar="$catconfigs/polybar/config.ini"
rofi="$catconfigs/rofi/colors.rasi"
wallpapers="$catconfigs/wallpapers"

themes="$HOME/.themes"
gtk_4="$(xdg-user-dir CONFIG)/gtk-4.0"
xsettingsd="$(xdg-user-dir CONFIG)/xsettingsd/xsettingsd.conf"


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

      sed -i 's/colorscheme=.*/colorscheme=latte/g' "$screenshot" "$screenrecord" "$volume" "$brightness"
      sed -i 's/icons\/.*\/network\.svg/icons\/latte\/network\.svg/g' "$network"
    ;;
    frappe)
      sed -i 's/background = ".*"/background = "#303446"/g' "$dunst"
      sed -i 's/foreground = ".*"/foreground = "#C6D0F5"/g' "$dunst"
      sed -i 's/frame_color = ".*"/frame_color = "#EF9F76"/g' "$dunst"

      sed -i 's/colorscheme=.*/colorscheme=frappe/g' "$screenshot" "$screenrecord" "$volume" "$brightness"
      sed -i 's/icons\/.*\/network\.svg/icons\/frappe\/network\.svg/g' "$network"
    ;;
    macchiato)
      sed -i 's/background = ".*"/background = "#24273A"/g' "$dunst"
      sed -i 's/foreground = ".*"/foreground = "#CAD3F5"/g' "$dunst"
      sed -i 's/frame_color = ".*"/frame_color = "#F5A97F"/g' "$dunst"

      sed -i 's/colorscheme=.*/colorscheme=macchiato/g' "$screenshot" "$screenrecord" "$volume" "$brightness"
      sed -i 's/icons\/.*\/network\.svg/icons\/macchiato\/network\.svg/g' "$network"
    ;;
    mocha)
      sed -i 's/background = ".*"/background = "#1E1E2E"/g' "$dunst"
      sed -i 's/foreground = ".*"/foreground = "#CDD6F4"/g' "$dunst"
      sed -i 's/frame_color = ".*"/frame_color = "#FE6400"/g' "$dunst"

      sed -i 's/colorscheme=.*/colorscheme=mocha/g' "$screenshot" "$screenrecord" "$volume" "$brightness"
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
      sed -i 's/background .*/background "#EFF1F5"/g' "$stalonetray"
    ;;
    frappe)
      sed -i 's/palletes\/alacritty\/.*\.yml/palletes\/alacritty\/frappe\.yml/g' "$alacritty"
      sed -i 's/background .*/background "#303446"/g' "$stalonetray"
    ;;
    macchiato)
      sed -i 's/palletes\/alacritty\/.*\.yml/palletes\/alacritty\/macchiato\.yml/g' "$alacritty"
      sed -i 's/background .*/background "#24273A"/g' "$stalonetray"
    ;;
    mocha)
      sed -i 's/palletes\/alacritty\/.*\.yml/palletes\/alacritty\/mocha\.yml/g' "$alacritty"
      sed -i 's/background .*/background "#1E1E2E"/g' "$stalonetray"
    ;;
    *)
      invalid_color
    ;;
  esac
}

menu () {
  case $1 in
    latte)
      sed -i 's/palletes\/rofi\/.*/palletes\/rofi\/latte"/g' "$rofi"
      # shellcheck disable=SC2016
      sed -i 's/pallete=.*/pallete="$latte"/g' "$accent"
    ;;
    frappe)
      sed -i 's/palletes\/rofi\/.*/palletes\/rofi\/frappe"/g' "$rofi"
      # shellcheck disable=SC2016
      sed -i 's/pallete=.*/pallete="$frappe"/g' "$accent"
    ;;
    macchiato)
      sed -i 's/palletes\/rofi\/.*/palletes\/rofi\/macchiato"/g' "$rofi"
      # shellcheck disable=SC2016
      sed -i 's/pallete=.*/pallete="$macchiato"/g' "$accent"
    ;;
    mocha)
      sed -i 's/palletes\/rofi\/.*/palletes\/rofi\/mocha"/g' "$rofi"
      # shellcheck disable=SC2016
      sed -i 's/pallete=.*/pallete="$mocha"/g' "$accent"
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

wallpapers () {
  case $1 in
    latte)
      feh --bg-fill -r "$wallpapers/latte.png"
      cp "$wallpapers/latte.png" "$HOME/.wall"
    ;;
    frappe)
      feh --bg-fill -r "$wallpapers/frappe.png"
      cp "$wallpapers/frappe.png" "$HOME/.wall"
    ;;
    macchiato)
      feh --bg-fill -r "$wallpapers/macchiato.png"
      cp "$wallpapers/macchiato.png" "$HOME/.wall"
    ;;
    mocha)
      feh --bg-fill -r "$wallpapers/mocha.png"
      cp "$wallpapers/mocha.png" "$HOME/.wall"
    ;;
    *)
      invalid_color
    ;;
  esac
}

color_randomizer () {
  schemes="rosewater flamingo pink mauve red maroon peach yellow green teal sky sapphire blue lavender"
  length=$(echo "$schemes" | wc -w)
  index=$(awk -v n="$length" 'BEGIN {srand (); print int (1+rand ()*n)}')
  echo "$schemes" | cut -d " " -f "$index"
}

# Note that changing the theme in the root filesystem requires a password to proceed
# Which is not ideal to do for a pallete changer
# But if you still want to use the root filesystem you can just add /usr/share/themes and /usr/share/icons to your user
themes () {
  color=$(color_randomizer)
  first_char=$(printf "%s" "${color%"${color#?}"}" | tr '[:lower:]' '[:upper:]')
  color_uppercase="${first_char}${color#?}"

  [ ! -d "$gtk_4" ] && mkdir -p "$gtk_4"
  
  case $1 in
    latte)
      gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Latte-Standard-$color_uppercase-Light"
      ln -sf "$themes/Catppuccin-Latte-Standard-$color_uppercase-Light/gtk-4.0/assets" "$gtk_4/assets"
      ln -sf "$themes/Catppuccin-Latte-Standard-$color_uppercase-Light/gtk-4.0/gtk.css" "$gtk_4/gtk.css"
      ln -sf "$themes/Catppuccin-Latte-Standard-$color_uppercase-Light/gtk-4.0/gtk-dark.css" "$gtk_4/gtk-dark.css"
      sed -i "s/Net\/ThemeName \".*\"/Net\/ThemeName \"Catppuccin-Latte-Standard-$color_uppercase-Light\"/g" "$xsettingsd"
      pkill xsettingsd
      xsettingsd &
    ;;
    frappe)
      gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Frappe-Standard-$color_uppercase-Dark"
      ln -sf "$themes/Catppuccin-Frappe-Standard-$color_uppercase-Dark/gtk-4.0/assets" "$gtk_4/assets"
      ln -sf "$themes/Catppuccin-Frappe-Standard-$color_uppercase-Dark/gtk-4.0/gtk.css" "$gtk_4/gtk.css"
      ln -sf "$themes/Catppuccin-Frappe-Standard-$color_uppercase-Dark/gtk-4.0/gtk-dark.css" "$gtk_4/gtk-dark.css"
      sed -i "s/Net\/ThemeName \".*\"/Net\/ThemeName \"Catppuccin-Frappe-Standard-$color_uppercase-Dark\"/g" "$xsettingsd"
      pkill xsettingsd
      xsettingsd &
    ;;
    macchiato)
      gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-$color_uppercase-Dark"
      ln -sf "$themes/Catppuccin-Macchiato-Standard-$color_uppercase-Dark/gtk-4.0/assets" "$gtk_4/assets"
      ln -sf "$themes/Catppuccin-Macchiato-Standard-$color_uppercase-Dark/gtk-4.0/gtk.css" "$gtk_4/gtk.css"
      ln -sf "$themes/Catppuccin-Macchiato-Standard-$color_uppercase-Dark/gtk-4.0/gtk-dark.css" "$gtk_4/gtk-dark.css"
      sed -i "s/Net\/ThemeName \".*\"/Net\/ThemeName \"Catppuccin-Macchiato-Standard-$color_uppercase-Dark\"/g" "$xsettingsd"
      pkill xsettingsd
      xsettingsd &
    ;;
    mocha)
      gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-$color_uppercase-Dark"
      ln -sf "$themes/Catppuccin-Mocha-Standard-$color_uppercase-Dark/gtk-4.0/assets" "$gtk_4/assets"
      ln -sf "$themes/Catppuccin-Mocha-Standard-$color_uppercase-Dark/gtk-4.0/gtk.css" "$gtk_4/gtk.css"
      ln -sf "$themes/Catppuccin-Mocha-Standard-$color_uppercase-Dark/gtk-4.0/gtk-dark.css" "$gtk_4/gtk-dark.css"
      sed -i "s/Net\/ThemeName \".*\"/Net\/ThemeName \"Catppuccin-Mocha-Standard-$color_uppercase-Dark\"/g" "$xsettingsd"
      pkill xsettingsd
      xsettingsd &
    ;;
    *)
      invalid_color
    ;;
  esac
}

icons () {
  color=$(color_randomizer)

  case $1 in
    latte)
      gsettings set org.gnome.desktop.interface icon-theme Papirus-Light
      papirus-folders -C "cat-latte-$color" --theme Papirus-Light
      sed -i 's/Net\/IconThemeName ".*"/Net\/IconThemeName "Papirus-Light"/g' "$xsettingsd"
      pkill xsettingsd
      xsettingsd &
    ;;
    frappe)
      gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
      papirus-folders -C "cat-frappe-$color" --theme Papirus-Dark
      sed -i 's/Net\/IconThemeName ".*"/Net\/IconThemeName "Papirus-Light"/g' "$xsettingsd"
      pkill xsettingsd
      xsettingsd &
    ;;
    macchiato)
      gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
      papirus-folders -C "cat-macchiato-$color" --theme Papirus-Dark
      sed -i 's/Net\/IconThemeName ".*"/Net\/IconThemeName "Papirus-Light"/g' "$xsettingsd"
      pkill xsettingsd
      xsettingsd &
    ;;
    mocha)
      gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
      papirus-folders -C "cat-mocha-$color" --theme Papirus-Dark
      sed -i 's/Net\/IconThemeName ".*"/Net\/IconThemeName "Papirus-Dark"/g' "$xsettingsd"
      pkill xsettingsd
      xsettingsd &
    ;;
  esac
}

case $1 in
  --all | -a)
    terminal "$2"
    notification "$2"
    panel "$2"
    menu "$2"
    lockscreen "$2"
    wallpapers "$2"
    themes "$2"
    icons "$2"
  ;;
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
  --wallpapers | -w)
    wallpapers "$2"
  ;;
  --themes | -g)
    themes "$2"
  ;;
  --icons | -i)
    icons "$2"
  ;;
esac

