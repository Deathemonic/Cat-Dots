#!/bin/sh

# Powered by sed

# Note: There's also the copy method.
# Where I have a bunch of cached colorscheme and just overwrite it.
# Esentially we copy the contents from the cached file then overwrite the orginal file.
# `cp ./cache/mocha.ini ./config/colors.ini`
# The problem is when if I want to modify the file everthing gets replace so it's not really the best method.
# Also the problem of the sed method it just look bloated and complicated but it does the job right.

screenshot="$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/screenshot.sh"
dunstrc="$(xdg-user-dir CONFIG)/cat-configs/dunst/dunstrc"
colorsini="$(xdg-user-dir CONFIG)/cat-configs/polybar/colors.ini"
stlntryrc="$(xdg-user-dir CONFIG)/cat-configs/polybar/stalonetrayrc"

notification () {
  case $1 in
    latte)
      sed -i -e 's/background = ".*"/background = "#EFF1F5"/g' "$dunstrc"
      sed -i -e 's/foreground = ".*"/foreground = "#4C4F69"/g' "$dunstrc"
      sed -i -e 's/frame_color = ".*"/frame_color = "#FE640B"/g' "$dunstrc"

      sed -i -e 's/colorscheme=.*/colorscheme=latte/g' "$screenshot"
    ;;
    frappe)
      sed -i -e 's/background = ".*"/background = "#303446"/g' "$dunstrc"
      sed -i -e 's/foreground = ".*"/foreground = "#C6D0F5"/g' "$dunstrc"
      sed -i -e 's/frame_color = ".*"/frame_color = "#EF9F76"/g' "$dunstrc"

      sed -i -e 's/colorscheme=.*/colorscheme=frappe/g' "$screenshot"
    ;;
    macchiato)
      sed -i -e 's/background = ".*"/background = "#24273A"/g' "$dunstrc"
      sed -i -e 's/foreground = ".*"/foreground = "#CAD3F5"/g' "$dunstrc"
      sed -i -e 's/frame_color = ".*"/frame_color = "#F5A97F"/g' "$dunstrc"

      sed -i -e 's/colorscheme=.*/colorscheme=macchiato/g' "$screenshot"
    ;;
    mocha)
      sed -i -e 's/background = ".*"/background = "#1E1E2E"/g' "$dunstrc"
      sed -i -e 's/foreground = ".*"/foreground = "#CDD6F4"/g' "$dunstrc"
      sed -i -e 's/frame_color = ".*"/frame_color = "#FE6400"/g' "$dunstrc"

      sed -i -e 's/colorscheme=.*/colorscheme=mocha/g' "$screenshot"
    ;;
    *)
      echo "Invalid colorscheme, try: latte, frappe, macchiato, mocha"
      exit
    ;;
  esac

  sh "$(xdg-user-dir CONFIG)"/cat-configs/bin/system/notifications.sh
}

panel () {
  case $1 in
    latte)
      sed -i 's/base = .*/base = #eff1f5/g' "$colorsini"
      sed -i 's/mantle = .*/mantle = #e6e9ef/g' "$colorsini"
      sed -i 's/crust = .*/crust = #dce0e8/g' "$colorsini"
      
      sed -i 's/text = .*/text = #4c4f69/g' "$colorsini"
      sed -i 's/subtext0 = .*/subtext0 = #6c6f85/g' "$colorsini"
      sed -i 's/subtext1 = .*/subtext1 = #5c5f77/g' "$colorsini"
      
      sed -i 's/surface0 = .*/surface0 = #ccd0da/g' "$colorsini"
      sed -i 's/surface1 = .*/surface1 = #bcc0cc/g' "$colorsini"
      sed -i 's/surface2 = .*/surface2 = #acb0be/g' "$colorsini"
      
      sed -i 's/overlay0 = .*/overlay0 = #9ca0b0/g' "$colorsini"
      sed -i 's/overlay1 = .*/overlay1 = #8c8fa1/g' "$colorsini"
      sed -i 's/overlay2 = .*/overlay2 = #7c7f93/g' "$colorsini"
      
      sed -i 's/blue = .*/blue = #1e66f5/g' "$colorsini"
      sed -i 's/lavender = .*/lavender = #7287fd/g' "$colorsini"
      sed -i 's/sapphire = .*/sapphire = #209fb5/g' "$colorsini"
      sed -i 's/sky = .*/sky = #04a5e5/g' "$colorsini"
      sed -i 's/teal = .*/teal = #179299/g' "$colorsini"
      sed -i 's/green = .*/green = #40a02b/g' "$colorsini"
      sed -i 's/yellow = .*/yellow = #df8e1d/g' "$colorsini"
      sed -i 's/peach = .*/peach = #fe640b/g' "$colorsini"
      sed -i 's/maroon = .*/maroon = #e64553/g' "$colorsini"
      sed -i 's/red = .*/red = #d20f39/g' "$colorsini"
      sed -i 's/mauve = .*/mauve = #8839ef/g' "$colorsini"
      sed -i 's/pink = .*/pink = #ea76cb/g' "$colorsini"
      sed -i 's/flamingo = .*/flamingo = #dd7878/g' "$colorsini"
      sed -i 's/rosewater = .*/rosewater = #dc8a78/g' "$colorsini"

      sed -i 's/background ".*"/background "#eff1f5"/g' "$stlntryrc"
    ;;
    frappe)
      sed -i 's/base = .*/base = #303446/g' "$colorsini"
      sed -i 's/mantle = .*/mantle = #292c3c/g' "$colorsini"
      sed -i 's/crust = .*/crust = #232634/g' "$colorsini"

      sed -i 's/text = .*/text = #c6d0f5/g' "$colorsini"
      sed -i 's/subtext0 = .*/subtext0 = #a5adce/g' "$colorsini"
      sed -i 's/subtext1 = .*/subtext1 = #b5bfe2/g' "$colorsini"

      sed -i 's/surface0 = .*/surface0 = #414559/g' "$colorsini"
      sed -i 's/surface1 = .*/surface1 = #51576d/g' "$colorsini"
      sed -i 's/surface2 = .*/surface2 = #626880/g' "$colorsini"

      sed -i 's/overlay0 = .*/overlay0 = #737994/g' "$colorsini"
      sed -i 's/overlay1 = .*/overlay1 = #838ba7/g' "$colorsini"
      sed -i 's/overlay2 = .*/overlay2 = #949cbb/g' "$colorsini"

      sed -i 's/blue = .*/blue = #8caaee/g' "$colorsini"
      sed -i 's/lavender = .*/lavender = #babbf1/g' "$colorsini"
      sed -i 's/sapphire = .*/sapphire = #85c1dc/g' "$colorsini"
      sed -i 's/sky = .*/sky = #99d1db/g' "$colorsini"
      sed -i 's/teal = .*/teal = #81c8be/g' "$colorsini"
      sed -i 's/green = .*/green = #a6d189/g' "$colorsini"
      sed -i 's/yellow = .*/yellow = #e5c890/g' "$colorsini"
      sed -i 's/peach = .*/peach = #ef9f76/g' "$colorsini"
      sed -i 's/maroon = .*/maroon = #ea999c/g' "$colorsini"
      sed -i 's/red = .*/red = #e78284/g' "$colorsini"
      sed -i 's/mauve = .*/mauve = #ca9ee6/g' "$colorsini"
      sed -i 's/pink = .*/pink = #f4b8e4/g' "$colorsini"
      sed -i 's/flamingo = .*/flamingo = #eebebe/g' "$colorsini"
      sed -i 's/rosewater = .*/rosewater = #f2d5cf/g' "$colorsini"

      sed -i 's/background ".*"/background "#303446"/g' "$stlntryrc"
    ;;
    macchiato)
      sed -i 's/base = .*/base = #24273a/g' "$colorsini"
      sed -i 's/mantle = .*/mantle = #1e2030/g' "$colorsini"
      sed -i 's/crust = .*/crust = #181926/g' "$colorsini"

      sed -i 's/text = .*/text = #cad3f5/g' "$colorsini"
      sed -i 's/subtext0 = .*/subtext0 = #a5adcb/g' "$colorsini"
      sed -i 's/subtext1 = .*/subtext1 = #b8c0e0/g' "$colorsini"

      sed -i 's/surface0 = .*/surface0 = #363a4f/g' "$colorsini"
      sed -i 's/surface1 = .*/surface1 = #494d64/g' "$colorsini"
      sed -i 's/surface2 = .*/surface2 = #5b6078/g' "$colorsini"

      sed -i 's/overlay0 = .*/overlay0 = #6e738d/g' "$colorsini"
      sed -i 's/overlay1 = .*/overlay1 = #8087a2/g' "$colorsini"
      sed -i 's/overlay2 = .*/overlay2 = #939ab7/g' "$colorsini"

      sed -i 's/blue = .*/blue = #8aadf4/g' "$colorsini"
      sed -i 's/lavender = .*/lavender = #b7bdf8/g' "$colorsini"
      sed -i 's/sapphire = .*/sapphire = #7dc4e4/g' "$colorsini"
      sed -i 's/sky = .*/sky = #91d7e3/g' "$colorsini"
      sed -i 's/teal = .*/teal = #8bd5ca/g' "$colorsini"
      sed -i 's/green = .*/green = #a6da95/g' "$colorsini"
      sed -i 's/yellow = .*/yellow = #eed49f/g' "$colorsini"
      sed -i 's/peach = .*/peach = #f5a97f/g' "$colorsini"
      sed -i 's/maroon = .*/maroon = #ee99a0/g' "$colorsini"
      sed -i 's/red = .*/red = #ed8796/g' "$colorsini"
      sed -i 's/mauve = .*/mauve = #c6a0f6/g' "$colorsini"
      sed -i 's/pink = .*/pink = #f5bde6/g' "$colorsini"
      sed -i 's/flamingo = .*/flamingo = #f0c6c6/g' "$colorsini"
      sed -i 's/rosewater = .*/rosewater = #f4dbd6/g' "$colorsini"

      sed -i 's/background ".*"/background "#24273a"/g' "$stlntryrc"
    ;;
    mocha)
      sed -i 's/base = .*/base = #1e1e2e/g' "$colorsini"
      sed -i 's/mantle = .*/mantle = #181825/g' "$colorsini"
      sed -i 's/crust = .*/crust = #11111b/g' "$colorsini"

      sed -i 's/text = .*/text = #cdd6f4/g' "$colorsini"
      sed -i 's/subtext0 = .*/subtext0 = #a6adc8/g' "$colorsini"
      sed -i 's/subtext1 = .*/subtext1 = #bac2de/g' "$colorsini"

      sed -i 's/surface0 = .*/surface0 = #313244/g' "$colorsini"
      sed -i 's/surface1 = .*/surface1 = #45475a/g' "$colorsini"
      sed -i 's/surface2 = .*/surface2 = #585b70/g' "$colorsini"

      sed -i 's/overlay0 = .*/overlay0 = #6c7086/g' "$colorsini"
      sed -i 's/overlay1 = .*/overlay1 = #7f849c/g' "$colorsini"
      sed -i 's/overlay2 = .*/overlay2 = #9399b2/g' "$colorsini"

      sed -i 's/blue = .*/blue = #89b4fa/g' "$colorsini"
      sed -i 's/lavender = .*/lavender = #b4befe/g' "$colorsini"
      sed -i 's/sapphire = .*/sapphire = #74c7ec/g' "$colorsini"
      sed -i 's/sky = .*/sky = #89dceb/g' "$colorsini"
      sed -i 's/teal = .*/teal = #94e2d5/g' "$colorsini"
      sed -i 's/green = .*/green = #a6e3a1/g' "$colorsini"
      sed -i 's/yellow = .*/yellow = #f9e2af/g' "$colorsini"
      sed -i 's/peach = .*/peach = #fab387/g' "$colorsini"
      sed -i 's/maroon = .*/maroon = #eba0ac/g' "$colorsini"
      sed -i 's/red = .*/red = #f38ba8/g' "$colorsini"
      sed -i 's/mauve = .*/mauve = #cba6f7/g' "$colorsini"
      sed -i 's/pink = .*/pink = #f5c2e7/g' "$colorsini"
      sed -i 's/flamingo = .*/flamingo = #f2cdcd/g' "$colorsini"
      sed -i 's/rosewater = .*/rosewater = #f5e0dc/g' "$colorsini"

      sed -i 's/background ".*"/background "#1e1e2e"/g' "$stlntryrc"
    ;;
    *)
      echo "Invalid colorscheme, try: latte, frappe, macchiato, mocha"
      exit
    ;;
  esac

  sh "$(xdg-user-dir CONFIG)/cat-configs/bin/system/panel.sh"
}

case $1 in
  --notification | -n)
    notification "$2"
  ;;
  --panel | -p)
    panel "$2"
  ;;
esac

