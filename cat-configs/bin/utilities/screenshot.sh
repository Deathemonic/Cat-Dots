#!/bin/sh

icon_path="$(xdg-user-dir CONFIG)/cat-configs/dunst/icons"
colorscheme=mocha

clock=$(date +%Y-%m-%d-%I-%M-%S)
geometry=$(xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current')

dir="$(xdg-user-dir PICTURES)/Screenshots"
file="Screenshot_${time}_${geometry}.png"

[ ! -d $dir ] && mkdir -p $dir

notify_user () {
	paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga &>/dev/null &
	notify-send \
	 	-a Clipboard \
	 	-i $icon_path/$colorscheme/clipboard.svg \
	 	-u low \
	 	-r 699 "Clipboard" "Screenshot saved on clipboard"
	
	xdg-open $dir/$file

	if [ -e $dir/$file ]; then
		notify-send -a Screenshot -u low -i $dir/$file "Screenshot Saved"
	else
		notify-send -a Screenshot -u low "Screenshot Deleted"
	fi
}

countdown () {
	for sec in `seq $1 -1 1`; do
		notify-send \
			-a Clock \
			-u normal \
			-t 1000 \
			-i $icon_path/$colorscheme/timer.svg \
			"Countdown" "Taking shot in : $sec"
		sleep 1
	done
}

effects () {
	convert $file +antialias \
		\( +clone  -alpha extract \
    	-draw 'fill black polygon 0,0 0,20 20,0 fill white circle 20,20 20,0' \
    	\( +clone -flip \) -compose Multiply -composite \
    	\( +clone -flop \) -compose Multiply -composite \
  		\) -alpha off -compose CopyOpacity -composite $file

	convert $file \
		\( +clone -background black -shadow 69x20+0+10 \) \
		+swap -background none -layers merge +repage $file
}

screen () {
	cd $dir 
	maim -u -f png $file 
	effects
	xclip -selection clipboard -t image/png -i $file
	notify_user
}

window () {
	cd $dir 
	maim -u -f png -i `xdotool getactivewindow` $file 
	effects 
	xclip -selection clipboard -t image/png -i $file
	notify_user
}

area () {
	cd $dir 
	maim -u -f png -s -b 2 -c 0.35,0.55,0.85,0.25 -l $file
	effects
	xclip -selection clipboard -t image/png -i $file
	notify_user
}

timer () {
	action=$(yad \
		--scale \
		--min-value 1 \
		--max-value 100 \
		--title "Set a number of seconds" \
		--on-top --center \
		--width 350 \
		--height 100
	)

	countdown $action
	sleep 1 
	screen
}

rofi () {
	config="$(xdg-user-dir CONFIG)/cat-dots/rofi/screen.rasi"

	screen=""
	area=""
	window=""
	timer=""

	options="$screen\n$area\n$window\n$inthree\n$inten\n$timer"
	chosen="$(echo -e "$options" | rofi -theme $config -p 'Take Screenshot' -dmenu -selected-row 0 -theme-str 'listview {lines: 6;}')"

	case $chosen in
  		$screen)
			screen
		;;
  		$area)
			area
		;;
  		$window)
			window
		;;
		$timer)
			timer
		;;
	esac
}

docs () {
	echo "
Usage:	screenshot [Options]
    --help	-	Prints this message
Options:
    --screen	-	Take screenshot of the screen
    --window	-	Take screenshot of the focused window
    --area	-	Take screenshot of the selected area
    --timer	-	Set a custom timer to take a screenshot
    --menu	-	Opens a gui selector
	"
}

case $1 in
	--screen)
		screen
	;;
	--window)
    	window
  	;;
  	--area)
		area
  	;;
	--timer)
		timer
  	;;
	--menu)
		rofi
	;;
  	--help | *)
		docs
  	;;
esac
