#!/bin/sh

# Installer Version: 3.1.0
# Based on https://github.com/manas140/dotfiles installer

cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

cache_dir="$HOME/.cache"
cache="$cache_dir/Cat-Dots"
home_config="$HOME/.config"

packages="bspwm sxhkd \
    polybar rofi zsh alacritty picom-ftlabs-git dunst \
    gtk3 gtk4 gtk-engine-murrine gnome-themes-extra \
    pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber alsa-utils pamixer \
    feh brightnessctl bluez-utils i3lock-color \
    yad xclip stalonetray \
    nerd-fonts-jetbrains-mono ttf-jetbrains-mono ttf-sarasa-gothic ttf-roboto \
    mpd mpdris2 ncmpcpp playerctl \
    polkit-gnome xfce4-power-manager \
    gpick maim libnotify notify-send-py \
    xdg-utils xdg-user-dirs \
    python3 pypy3 python-gobject" \

clear

make_backups () {
    [ ! -d "$HOME/.backups" ] && mkdir "$HOME/.backups" 2>/dev/null
    [ ! -d "$HOME/.fonts" ] && mkdir "$HOME/.fonts" 2>/dev/null
    
    tempdir=$(mktemp -d -p "$HOME/.backups")
    [ -d "$home_config/bspwm" ] && mv "$home_config/bspwm" "$tempdir"
}

install_packages () {
    echo
    printf "%s  ____    _  _____     ____   ___ _____ ____\n" "${cb}"
    printf "%s / ___|  / \|_   _|   |  _ \ / _ \_   _/ ___|\n" "${cg}"
    printf "%s| |     / _ \ | |_____| | | | | | || | \___ |\n" "${cr}"
    printf "%s| |___ / ___ \| |_____| |_| | |_| || |  __) |\n" "${cg}"
    printf "%s \____/_/   \_\_|     |____/ \___/ |_| |____/\n" "${cb}"
    printf "%s The Dotfiles themed with catppuccin colors\n" "${cr}"
    echo

    echo
    printf "%s[*] PROCEDING WILL MAKE A BACKUP FOR ALL YOUR CONFIGS IN ($HOME/.backups)\n" "${cg}" && sleep 1
    printf %s "${cr}"
    echo "[-] DO YOU WANT TO PROCEED [Y/N] : \c"
    read -r install

    case $install in
        N|n)
            printf "%s[-] Aborting!\n " "${cr}"
	    exit 0
        ;;
        Y|y)
	    if command -v pacman; then
            	printf "%s[*] Updating System\n" "${cg}" && sleep 2
            	sudo pacman --noconfirm --needed -Syu git xorg base-devel
            	aur_helper
	    else
		printf "%s[-] System is not archlinux\n" "${cr}" && sleep 1
  		printf "%s[*] Using manual mode\n" "${cb}" && sleep 2
    		copying_files
            fi
        ;;
    esac
}

aur_helper () {
    printf "%s[*] Select a AUR helper (Required)\n" "${cr}"
    printf %s "${cr}"
    echo "[-] (1)paru | (2)yay : \c"
    read -r helper

    case $helper in
        1)
            if command -v paru; then
                paru -S "$packages" --needed
            else
                cd "$cache_dir" || exit
                git clone https://aur.archlinux.org/paru-bin.git
                cd paru-bin || exit
                makepkg -si
                paru -S "$packages" --needed
            fi
	    
	    copying_files
        ;;
        2)
            if command -v yay; then
                yay -S "$packages" --needed
            else
                cd "$cache_dir" || exit
                git clone https://aur.archlinux.org/yay-bin.git
                cd yay-bin || exit
                makepkg -si
                yay -S "$packages" --needed
            fi
	    
	    copying_files
        ;;
    esac
}

copying_files () {
    printf "%s[*] Getting dotfiles\n" "${cb}" && sleep 2
    cd "$cache_dir" && git clone https://github.com/Deathemonic/Cat-Dots.git

    cp -rf "$cache/bspwm" "$home_config"
    cp -rf "$cache/cat-configs" "$home_config"
    cp -rf "$cache/misc/home/*" "$HOME"

    chmod +x "$home_config/cat-configs/bin/system/*"
    chmod +x "$home_config/cat-configs/bin/utilities/*"

    xdg-user-dirs-update

    cd "$cache/misc/fonts" || exit
    makepkg -g >> PKGBUILD && makepkg -si
    fc-cache -fv
    
    finishing
}

finishing () {
    printf "%s[-] Done\n" "${cb}" && sleep 3
    echo
    printf "%s[*] Please Reboot your system!!\n" "${cr}"
    echo
    printf "%s[|] If the installer has problem installing or missing feature please summit a pull requise or issue on the Github Page\n" "${cb}"
    printf "%s[|] For extra information like spotify setup or firefox setup please go to this Cat-Dot's Github Wiki Page\n" "${cb}"
    printf "%s[|] Please go to the Cat-Dot's Github Wiki Page for Manual Installation and fixes\n" "${cb}"
    echo
    printf "%s[-] Exiting!\n" "${cr}"
}

docs () {
    echo "
Usage:	install [Options]
    
Options:
    backup     -   Just create backups (Will not install)   
    nobackup   -   Install but doesn't create a backup
    install    -   Standard install
	"
}

first_choice () {
    docs
    echo
    printf "%s[*] Choose what do you want to do\n" "${cg}"
    echo
    printf "%s[*] backup, nobackup, or install\n" "${cb}"
    echo
    printf %s "${cr}"
    echo "[-] Operation : \c"
    read -r choice

    case $choice in
        backup)
            make_backups
        ;;
        nobackup)
            install_packages
        ;;
        install)
            make_backups
            install_packages
        ;;
        *)
            docs
            first_choice
        ;;
    esac
}

first_choice
