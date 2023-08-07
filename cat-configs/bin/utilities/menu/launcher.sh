#!/bin/sh

rofi \
	-show "$1" \
	-modi "clipboard:greenclip print",run,ssh,drun,window,filebrowser,emoji  \
	-no-lazy-grab \
	-scroll-method 0 \
	-drun-match-fields all \
	-drun-display-format "{name}" \
	-no-drun-show-actions \
	-terminal "$(xdg-user-dir CONFIG)/cat-configs/bin/utilities/terminal.sh" \
	-kb-cancel Alt-F1 \
	-theme "$(xdg-user-dir CONFIG)/cat-configs/rofi/launcher.rasi"