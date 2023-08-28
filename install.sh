#!/bin/sh

# Installer Version: 4.2.6
# Based on https://github.com/manas140/dotfiles installer

cr="$(tput setaf 1)"
cg="$(tput setaf 2)"
cb="$(tput setaf 4)"

cache_dir="$HOME/.cache"
cache="$cache_dir/Cat-Dots"
home_config="$HOME/.config"

packages="bspwm sxhkd \
polybar rofi zsh alacritty picom-ftlabs-git dunst \
gtk3 gtk4 gtk-engine-murrine gnome-themes-extra \
pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber alsa-utils pamixer \
feh brightnessctl bluez-utils i3lock-color \
yad xclip stalonetray maim gpick imagemagick ffmpeg \
nerd-fonts-jetbrains-mono ttf-jetbrains-mono ttf-sarasa-gothic ttf-roboto \
mpd mpdris2 ncmpcpp playerctl zscroll-git \
polkit-gnome xfce4-power-manager \
libnotify notify-send-py \
xdg-utils xdg-user-dirs xdo xsettingsd \
python3 python-gobject"

clear

make_backups () {
    [ ! -d "$HOME/.backups" ] && mkdir "$HOME/.backups" 2>/dev/null
    [ ! -d "$HOME/.fonts" ] && mkdir "$HOME/.fonts" 2>/dev/null
    [ ! -d "$HOME/.themes" ] && mkdir "$HOME/.themes" 2>/dev/null
    [ ! -d "$HOME/.icons" ] && mkdir "$HOME/.icons" 2>/dev/null

    tempdir=$(mktemp -d -p "$HOME/.backups")
    [ -d "$home_config/bspwm" ] && mv "$home_config/bspwm" "$tempdir"
    [ -d "$home_config/mpDris2" ] && mv "$home_config/mpDris2" "$tempdir"
    [ -f "$home_config/user-dirs.dirs" ] && mv "$home_config/user-dirs.dirs" "$tempdir"
    [ -d "$HOME/.mpd" ] && mv "$HOME/.mpd" "$tempdir"
    [ -d "$HOME/.ncmpcpp" ] && mv "$HOME/.ncmpcpp" "$tempdir"
}

install_packages () {
    echo
    printf "%s  ____    _  _____     ____   ___ _____ ____\n" "${cr}"
    printf "%s / ___|  / \|_   _|   |  _ \ / _ \_   _/ ___|\n" "${cg}"
    printf "%s| |     / _ \ | |_____| | | | | | || | \___ |\n" "${cr}"
    printf "%s| |___ / ___ \| |_____| |_| | |_| || |  __) |\n" "${cg}"
    printf "%s \____/_/   \_\_|     |____/ \___/ |_| |____/\n" "${cr}"
    printf "%s The Dotfiles themed with catppuccin colors\n" "${cr}"
    echo
    echo
    printf "%s[*] PROCEDING WILL MAKE A BACKUP FOR ALL YOUR CONFIGS IN ($HOME/.backups)\n" "${cg}" && sleep 1
    printf "%s[-] DO YOU WANT TO PROCEED [Y/N] : " "${cr}"
    read -r install

    case $install in
        N|n)
            printf "%s[-] Aborting!\n" "${cr}"
            exit 0
        ;;
        Y|y)
            if command -v pacman; then
                printf "%s[*] Updating System\n" "${cg}" && sleep 2
                sudo pacman --noconfirm --needed -Syu git wget xorg base-devel
                aur_helper
            else
                printf "%s[-] System is not archlinux\n" "${cr}" && sleep 1
                printf "%s[*] Using manual mode\n" "${cb}" && sleep 1
                printf "%s[-] The installer will not install the dependencies\n" "${cr}" && sleep 2
                copying_files
            fi
	    ;;
    esac
}

install_aur () {
    if command -v "$1"; then
        # shellcheck disable=SC2086
        $1 -S $packages --needed
    else
        git clone "$2"
        cd "$1" || exit 1
        makepkg -si
        # shellcheck disable=SC2086
        $1 -S $packages --needed
    fi
    copying_files
}

aur_helper () {
    printf "%s[*] Select a AUR helper (Required)\n" "${cr}"
    printf "%s[-] (1)paru | (2)yay : " "${cr}"
    read -r helper

    case $helper in
        1)
            install_aur paru https://aur.archlinux.org/paru-bin.git
        ;;
        2)
            install_aur yay https://aur.archlinux.org/yay-bin.git
        ;;
    esac
}

copying_files () {
    printf "%s[*] Getting dotfiles\n" "${cb}" && sleep 2

    if [ -d "./cat-configs" ]; then
        printf "%s[!] Detected local dotfiles..." "${cr}"
        
        cp -rf "./bspwm" "$home_config"
        cp -rf "./cat-configs" "$home_config"
        cp -rf "./misc/home/*" "$HOME"

        if command -v pacman; then
            cd "./misc/fonts" || exit 1
            makepkg -g >> PKGBUILD && makepkg -si
        fi
    else
        cd "$cache_dir" && git clone https://github.com/Deathemonic/Cat-Dots.git    
    
        cp -rf "$cache/bspwm" "$home_config"
        cp -rf "$cache/cat-configs" "$home_config"
        cp -rf "$cache/misc/home/*" "$HOME" 

        if command -v pacman; then
            cd "$cache/misc/fonts" || exit 1
            makepkg -g >> PKGBUILD && makepkg -si
        fi
    fi

    chmod +x $home_config/cat-configs/bin/system/*
    chmod +x $home_config/cat-configs/bin/utilities/*
    
    xdg-user-dirs-update
    fc-cache -fv

    installing_themes
}

installing_themes () {
    cd "$cache_dir" && git clone --recurse-submodules https://github.com/catppuccin/gtk.git cat-gtk
    cd cat-gtk || exit 1
    python3 -m venv venv
    # shellcheck disable=SC1091
    . ./venv/bin/activate
    pip install -r requirements.txt
    python3 install.py all -a all -s standard -d ~/.themes

    cd "$cache_dir" && git clone https://github.com/catppuccin/papirus-folders.git cat-folders
    cd cat-folders || exit 1
    wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh
    cp -r ./src/* "$HOME/.icons/Papirus"
    cp ./papirus-folders "$HOME/.local/bin"

    finishing
}

finishing () {
    printf "%s[-] Done\n" "${cb}" && sleep 3
    echo
    printf "%s[*] Log out at your session for the changes to apply!\n" "${cr}"
    echo
    printf "%s[|] Any problems with the dotfiles don't be affraid to submit an issue at https://github.com/Deathemonic/Cat-Dots/issues\n" "${cb}"
    printf "%s[|] Please go to the Cat-Dot's Github Wiki Page for Manual Installation and fixes\n" "${cb}"
    echo
    printf "%s[-] Exiting!\n" "${cr}"
}

docs () {
    printf %s "${cb}"
    echo "
Usage:	install [Options]
    
Options:
    backup     -   just create backups (does not install)   
    nobackup   -   install but doesn't create a backup
    install    -   standard install
	"
}

setup () {
    docs
    
    echo
    printf "%s[*] Choose what do you want to do\n" "${cg}"
    echo
    printf "%s[*] backup, nobackup, or install\n" "${cb}"
    echo
    printf "%s[*] <Ctrl + C> to exit/cancel\n" "${cb}"
    echo
    printf "%s[-] Operation : " "${cr}"
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
            clear
            setup
        ;;
    esac
}

setup
