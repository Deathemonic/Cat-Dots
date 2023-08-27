#!/bin/sh

config="$(xdg-user-dir CONFIG)/cat-configs/rofi/colors.rasi"

# shellcheck disable=SC2034
latte="#1e66f5 #7287fd #209fb5 #04a5e5 #179299 #40a02b #df8e1d #fe640b #e64553 #d20f39 #8839ef #ea76cb #dd7878 #dc8a78"
# shellcheck disable=SC2034
frappe="#8caaee #babbf1 #85c1dc #99d1db #81c8be #a6d189 #e5c890 #ef9f76 #ea999c #e78284 #ca9ee6 #f4b8e4 #eebebe #f2d5cf"
# shellcheck disable=SC2034
macchiato="#8aadf4 #b7bdf8 #7dc4e4 #91d7e3 #8bd5ca #a6da95 #eed49f #f5a97f #ee99a0 #ed8796 #c6a0f6 #f5bde6 #f0c6c6 #f4dbd6"
# shellcheck disable=SC2034
mocha="#89b4fa #b4befe #74c7ec #89dceb #94e2d5 #a6e3a1 #f9e2af #fab387 #eba0ac #f38ba8 #cba6f7 #f5c2e7 #f2cdcd #f5e0dc"

pallete="$mocha"

length=$(echo "$pallete" | wc -w)
index=$(awk -v n="$length" 'BEGIN {srand (); print int (1+rand ()*n)}')
color=$(echo "$pallete" | cut -d " " -f "$index")

sed -i "s/accent: .*;/accent: $color;/g" "$config"
