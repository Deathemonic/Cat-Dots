#!/bin/sh

# Colors
base=#1e1e2e
mantle=#181825
green=#a6e3a1
red=#f38ba8
text=#cdd6f4

font="JetBrains Mono"
background="$HOME/.lock"

i3lock \
    --fill \
    -i "$background" \
	-n -e \
    -c 00000000 \
    --pass-media-keys \
    --pass-power-keys \
    --pass-screen-keys \
    --pass-volume-keys \
    --indicator \
    --line-uses-inside \
    --force-clock i3lock \
    --show-failed-attempts  \
    --radius 69 \
    --modif-size 9 \
    --modif-pos "w/2:h/2-20" \
    --time-str "%I:%M %p" \
    --time-pos "w/2+0:h/2-200" \
    --date-pos "w/2+0:h/2-150" \
    --time-color "$base" \
    --date-color "$base" \
    --time-size 69 \
    --date-size 25 \
    --time-font "$font" \
    --date-font "$font" \
    --verif-text "Verifying" \
    --verif-color "$green" \
    --verif-size 15 \
    --verif-pos "w/2-0:h/2+100" \
    --verif-font "$font" \
    --wrong-text "Incorrect, Try Again" \
    --wrong-color "$red" \
    --wrong-size 15 \
    --wrong-pos "w/2-0:h/2+100" \
    --wrong-font "$font" \
    --greeter-text "" \
    --greeter-color "$green" \
    --greeter-size 60 \
    --greeter-font "Phosphor" \
    --greeter-pos "w/2-0:h/2+230" \
    --ring-color "$base" \
    --ringver-color "$green" \
    --ringwrong-color "$red" \
    --ring-width 5 \
    --insidever-color "$mantle" \
    --insidewrong-color "$mantle" \
    --inside-color "$mantle" \
    --ind-pos "w/2-0:h/2+200" \
	--lock-text "Locking" \
	--lockfailed-text "Lock Failed!" \
    --status-pos "w/2-0:h/2+100" \
    --noinput-text "No Input" \
    --keyhl-color "$text" \
    --bshl-color "$text" \
    --separator-color "$text" \
    --pointer default
