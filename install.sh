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
    viewnior maim libnotify notify-send-py \
    xdg-utils xdg-user-dirs"

clear

make_backups () {
    [ ! -d $HOME/.backups ] && mkdir $HOME/.backups 2>/dev/null
    [ ! -d $HOME/.fonts ] && mkdir $HOME/.fonts 2>/dev/null
    
    tempdir=$(mktemp -d -p $HOME/.backups)
    [ -d $home_config/bspwm ] && mv $home_config/bspwm $tempdir
}

install_packages () {
    echo
    printf "${cb}  ____    _  _____     ____   ___ _____ ____\n"
    printf "${cg} / ___|  / \|_   _|   |  _ \ / _ \_   _/ ___|\n"
    printf "${cr}| |     / _ \ | |_____| | | | | | || | \___ |\n"
    printf "${cg}| |___ / ___ \| |_____| |_| | |_| || |  __) |\n"
    printf "${cb} \____/_/   \_\_|     |____/ \___/ |_| |____/\n"
    printf "${cr} The Dotfiles themed with catppuccin colors\n"
    echo

    echo
    printf "${cg}[*] PROCEDING WILL MAKE A BACKUP FOR ALL YOUR CONFIGS IN ($HOME/.backups)\n" && sleep 1
    printf "${cr}"
    read -p "[-] DO YOU WANT TO PROCEED [Y/N] : " install

    case $install in
        N|n)
            printf "${cr}[-] Aborting!\n "
	    exit 0
        ;;
        Y|y)
	    if command -v pacman; then
            	printf "${cg}[*] Updating System\n" && sleep 2
            	sudo pacman --noconfirm --needed -Syu git xorg base-devel
            	aur_helper
	    else
		printf "${cr}[-] System is not archlinux\n" && sleep 1
  		printf "${cb}[*] Using manual mode\n" && sleep 2
    		copying_files
            fi
        ;;
    esac
}

aur_helper () {
    printf "${cr}[*] Select a AUR helper (Required)\n"
    printf "${cr}"
    read -p "[-] (1)paru | (2)yay : " helper

    case $helper in
        1)
            if command -v paru; then
                paru -S $packages --needed
            else
                cd $cache_dir
                git clone https://aur.archlinux.org/paru-bin.git
                cd paru-bin
                makepkg -si
                paru -S $packages --needed
            fi
	    
	    copying_files
        ;;
        2)
            if command -v yay; then
                yay -S $packages --needed
            else
                cd $cache_dir
                git clone https://aur.archlinux.org/yay-bin.git
                cd yay-bin
                makepkg -si
                yay -S $packages --needed
            fi
	    
	    copying_files
        ;;
    esac
}

copying_files () {
    printf "${cb}[*] Getting dotfiles\n" && sleep 2
    cd $cache_dir && git clone https://github.com/Deathemonic/Cat-Dots.git

    cp -rf $cache/bspwm $home_config
    cp -rf $cache/cat-configs $home_config
    cp -f $cache/misc/fonts/* $HOME/.fonts

    chmod +x $home_config/cat-configs/bin/bar/*
    chmod +x $home_config/cat-configs/bin/menu/*
    chmod +x $home_config/cat-configs/bin/system/*
    chmod +x $home_config/cat-configs/bin/utilities/*
    
    finishing
}

finishing () {
    printf "${cb}[-] Done\n" && sleep 3
    echo
    printf "${cr}[*] Please Reboot your system!!\n"
    echo
    printf "${cb}[|] If the installer has problem installing or missing feature please summit a pull requise or issue on the Github Page\n" # This is a message
    printf "${cb}[|] For extra information like spotify setup or firefox setup please go to this Cat-Dot's Github Wiki Page\n"
    printf "${cb}[|] Please go to the Cat-Dot's Github Wiki Page for Manual Installation and fixes\n"
    echo
    printf "${cr}[-] Exiting!\n"
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
    printf "${cg}[*] Choose what do you want to do\n"
    echo
    printf "${cb}[*] backup, nobackup, or install\n"
    echo
    printf "${cr}"
    read -p "[-] Operation : " choice

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
