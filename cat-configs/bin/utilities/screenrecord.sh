#!/bin/sh

script_dir="$(cd "$(dirname "$0")" >/dev/null 2>&1 && pwd)"
icon_path="$(xdg-user-dir CONFIG)/cat-configs/dunst/icons"
colorscheme=mocha

clock=$(date +%Y-%m-%d-%I-%M-%S)
geometry=$(xrandr | head -n1 | cut -d',' -f2 | tr -d '[:blank:],current')

dir="$(xdg-user-dir VIDEOS)/Screenrecords"
file="Capture_${clock}_${geometry}.mp4"

[ ! -d "$dir" ] && mkdir -p "$dir"

pre_notify () {
  notify-send -u low -a Screenrecorder "Recording Now!" -t 1000 -i "$icon_path/$colorscheme/video.svg"
  sleep 1
}

notify_user () {
	if [ -e "$dir/$file" ]; then
		notify-send -u low -a Screenrecorder "Saved in $dir"
	else
		notify-send -u -a Screenrecorder "Video Deleted"
	fi
}

countdown () {
	for sec in $(seq "$1" -1 1); do
	    notify-send -u low -a Clock -i "$icon_path/$colorscheme/timer.svg" -t 1000 "Countdown" "Starting in : $sec"
	    sleep 1
	done
}

capture () {
	countdown '3'
	sleep 1

	if [ "$1" = "--noaudio" ]; then
    pre_notify
		ffmpeg -video_size "$geometry" -framerate 25 -f x11grab -i :0.0+0,0 "$dir/$file"
	else
	  pre_notify
		ffmpeg -video_size "$geometry" -framerate 25 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i default "$dir/$file"
	fi
	notify_user
}

area () {
	area_data=$(slop -f "%x %y %w %h") || exit
	read -r X Y W H < "$area_data"
	
	countdown '3'
	sleep 1

	if [ "$1" = "--noaudio" ]; then
    pre_notify
		ffmpeg -video_size "${W}x${H}" -framerate 25 -f x11grab -i :0.0+"${X},${Y}" "$dir/$file"
	else
    pre_notify
		ffmpeg -video_size "${W}x${H}" -framerate 25 -f x11grab -i :0.0+"${X},${Y}" -f pulse -ac 2 -i default "$dir/$file"
	fi

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

	countdown "$action"
	if [ "$1" = "--noaudio" ]; then
      pre_notify
	    ffmpeg -video_size "$geometry" -framerate 25 -f x11grab -i :0.0+0,0 "$dir/$file"
	else 
      pre_notify
	    ffmpeg -video_size "$geometry" -framerate 25 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i default "$dir/$file"
	fi
	
    notify_user
}

menu () {
	config="$(xdg-user-dir CONFIG)/cat-configs/rofi/screen.rasi"

	capture=""
	area=""
	timer=""
  stop=""
  withaudio=""
	withoutaudio=""

  sh "$script_dir/menu/accent.sh"

	chosen=$(printf "%s\n%s\n%s\n%s\n" "$capture" "$area" "$timer" "$stop" | rofi -theme "$config" -p 'Take Screenshot' -dmenu -selected-row 0 -theme-str 'listview {lines: 4;}')

    audio_chooser () {
        audio_chosen=$(printf "%s\n%s\n" "$withaudio" "$withoutaudio" | rofi -theme "$config" -p 'Choose' -dmenu -selected-row 0 -theme-str 'listview {lines: 2;}')
        
        if [ "$chosen" = "$capture" ]; then
            case "$audio_chosen" in
                "$withaudio")
                    capture
                ;;
                "$withoutaudio")
                    capture --noaudio
                ;;
            esac
        elif [ "$chosen" = "$area" ]; then
            case $audio_chosen in
                "$withaudio")
                    area
                ;;
                "$withoutaudio")
                    area --noaudio
                ;;
            esac
        elif [ "$chosen" = "$timer" ]; then
            case $audio_chosen in
                "$withaudio")
                    timer
                ;;
                "$withoutaudio")
                    timer --noaudio
                ;;
            esac
        fi
    }

	case "$chosen" in
  		"$capture")
            audio_chooser
		;;
  		"$area")
			audio_chooser
		;;
  		"$timer")
			audio_chooser
		;;
        "$stop")
            [ "$(pgrep ffmpeg)" ] && pkill ffmpeg
        ;;
	esac
}

docs () {
	echo "
Usage:	screenshot [Options] <Arguments>
    --help	-	Prints this message
Options:
    --capture	-	Record the screen
    --area	-	Record the selected area
    --timer	-	Set a custom timer to record
    --menu	-	Opens a gui selector
    --stop	-	Stops the record
Arguments:
    --noaudio   -	Removes the audio
	"
}

case $1 in
	--capture)
		capture "$2"
  	;;
  	--area)
        area "$2"
  	;;
    --timer)
        timer "$2"
    ;;
    --menu)
        menu
    ;;
  	--stop)
    	[ "$(pidof ffmpeg)" ] && pkill ffmpeg
  	;;
    --help | *)
        docs
    ;;
esac
