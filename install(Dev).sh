#!/bin/sh

# Installer Version: 1.9
# A fork of https://github.com/manas140/dotfiles install.sh

# Use the comments to navigate

# Colors
cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

clear # To remove some text from above to make it easier to read

# Logo
printf "${cb}  ____    _  _____     ____   ___ _____ ____\n"
printf "${cg} / ___|  / \|_   _|   |  _ \ / _ \_   _/ ___|\n"
printf "${cr}| |     / _ \ | |_____| | | | | | || | \___ |\n"
printf "${cg}| |___ / ___ \| |_____| |_| | |_| || |  __) |\n"
printf "${cb} \____/_/   \_\_|     |____/ \___/ |_| |____/\n"
printf "${cr}     The Dotfiles with catppuccin colors\n"

# Spaces
echo " "
echo " "

# Dev Text
printf "${cb}[*] DEV TEST (Note: This is just a dev test to see if the installer works)\n"

# Warning
printf "${cg}[*] PROCEDING WILL MAKE A BACKUP FOR ALL YOUR CONFIGS IN ($HOME/.config/backups)\n" && sleep 1 # The Sleep makes the installation not spam in the terminal
printf "${cr}"
read -p "[-] DO YOU WANT TO PROCEED [Y/N] : " install

# Directory
dir="$HOME/.config $HOME/.dotfiles $HOME/Pictures/Wallpapers $HOME/.local/bin $HOME/.fonts $HOME/.config/backups"

# Abort
case $install in
    N*|n*)
    clear
    printf "${cr}[-] Aborting!\n"
esac

# Install
case $install in
    Y*|y*)
    for a in $dir; do 
        mkdir -p $a # Makes the directories
    done
    clear

# Packages (Arch Only)
printf "${cr}"
read -p "[-] ARE YOU USING ARCHLINUX [Y/N] : " arch

case $arch in
    Y*|y*)
    # Package (Arch Linux)
    clear
    printf "${cg}[*] Updating System\n" && sleep 2
    echo "sudo pacman --noconfirm -Syu"

    printf "${cb}[*] Installing Dependencies\n" && sleep 2
    echo "sudo pacman -S --noconfirm --needed rofi feh xorg rust"

    # AUR
    printf "${cr}[*] Select a AUR helper (Required)\n"
    printf "${cr}"
    read -p "[-] (P)paru | (Y)yay : " helper

    # Paru
        case $helper in
            P*|p*)
            echo "cd $HOME/.dotfiles"
            echo "git clone https://aur.archlinux.org/paru.git"
            echo "cd ./paru"
            echo "makepkg -si"
            echo "paru -S --noconfirm"
        esac
    # Yay
        case $helper in
            Y*|y*) 
            echo "cd $HOME/.dotfiles"
            echo "git clone https://aur.archlinux.org/yay.git"
            echo "cd ./yay"
            echo "makepkg -si"
            echo "yay -S --noconfirm"
        esac
esac

# Copying Files
    clear
    printf "${cb}[*] Getting dotfiles\n" && sleep 2
    echo "cd $HOME/.dotfiles"
    echo "git clone https://github.com/Deathemonic/Cat-Dots.git && cd ./Cat-Dots"
    printf "${cr}[*] Making backups\n" && sleep 5
    echo "mkdir $HOME/.config/backups"
    echo "mv $HOME/.config/bspwm/ $HOME/.config/backups"
    echo "mv $HOME/.config/sxhkd/ $HOME/.config/backups"
    echo "mv $HOME/.config/polybar/ $HOME/.config/backups"
    echo "mv $HOME/.config/networkmanager-dmenu/ $HOME/.config/backups"
    echo "mv $HOME/.config/eww/ $HOME/.config/backups"
    echo "mv $HOME/.config/kitty/ $HOME/.config/backups"
    echo "mv $HOME/.config/dunst/ $HOME/.config/backups"
    echo "mv $HOME/.config/zathura/ $HOME/.config/backups"
    echo "mv $HOME/.config/cava $HOME/.config/backups"
    echo "mv $HOME/.config/picom.conf $HOME/.config/backups"
    printf "${cr}[*] Deleting old configs\n" && sleep 2
    printf "${cg}[*] Copying dotfiles\n" && sleep 3
    printf "${cb}[*] Copying configs\n" && sleep 4
    echo "cp -ra ./config/* $HOME/.config"
    echo "cp -ra ./home/* $HOME/."
    printf "${cg}[*] Configs copied\n" && sleep 2
    printf "${cb}[*] Copying scripts\n" && sleep 3
    echo "cp -ra ./bin/* $HOME/.local/bin/"
    printf "${cg}[*] Scripts copied\n" && sleep 2
    printf "${cb}[*] Copying wallpapers\n" && sleep 3
    echo "cp -ra ./walls/* $HOME/Pictures/Wallpapers"
    printf "${cg}[*] Wallpapers copied\n" && sleep 2
    printf "${cb}[*] Copying fonts\n" && sleep 3
    echo "cp -ra ./fonts/* $HOME/.fonts"
    echo "fc-cache -fv"
    printf "${cg}[*] Fonts copied\n" && sleep 2
    printf "${cg}[*] Dotfiles installed\n" && sleep 2

# Finishing    
    printf "${cb}[-] Done\n" && sleep 3
    clear
    printf "${cr}[*] Please Reboot your system!!\n"
    echo " "
    printf "${cb}[|] If the installer has problem installing or missing feature please summit a pull requise or issue on the Github Page\n" # This is a message
    printf "${cb}[|] For extra information like spotify setup or firefox setup please go to this Cat-Dot's Github Wiki Page\n"
    printf "${cb}[|] Please go to the Cat-Dot's Github Wiki Page for Manual Installation and fixes\n"
    echo " "
    printf "${cr}[-] Exiting!\n"
esac
# This need some optimazation maybe v2.0
# Might add some stuff maybe v3.0