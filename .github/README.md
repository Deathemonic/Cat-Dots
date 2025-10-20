<h3 align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
	Cat-Dots
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<h6 align="center">
  <a href="https://github.com/catppuccin/catppuccin#-palette">Palette</a>
  ·
  <a href="https://github.com/Deathemonic/Cat-Dots/wiki">Wiki</a>
</h6>

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="285" /></p>

<p align="center">
	<a href="https://github.com/Deathemonic/Cat-Dots/stargazers">
		<img alt="Stargazers" src="https://img.shields.io/github/stars/deathemonic/cat-dots?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/Deathemonic/Cat-Dots/issues">
		<img alt="Issues" src="https://img.shields.io/github/issues/deathemonic/cat-dots?style=for-the-badge&logo=gitbook&color=B5E8E0&logoColor=D9E0EE&labelColor=302D41"></a>
</p>

![github_showcase](https://github.com/Deathemonic/Cat-Dots/assets/65948476/38dd0818-c3a1-4787-859f-61b037903084)

## Installation
<details open>
	<summary><b><samp>AUTO INSTALL</samp></b></summary>
<br>

<kbd>RECOMMENDED</kbd>

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Deathemonic/Cat-Dots/main/install.sh)"
```

> **Note:** <br>
> You need ``curl`` and ``git`` installed in your system.
> Also if you are not using ``archlinux`` the installer won't install the dependencies automatically you have to manually install them.
> Check out this [link](https://github.com/Deathemonic/Cat-Dots/wiki/Pre-Installation#dependencies) for the list of dependencies

</details>

<details>
	<summary><b><samp>MANUAL INSTALL</samp></b></summary>
<br>

> **Note:** <br>
> First up install the dependencies, they are needed in order for the dotfiles to work.
> Check out this [link](https://github.com/Deathemonic/SweetDots/wiki/Documentation#dependencies) for the list of dependencies

1. Clone the repo and go to that directory
	
```sh
git clone https://github.com/Deathemonic/Cat-Dots.git && cd Cat-Dots
```

2. Make a backup folder for the conflicting folders and configs
	
```sh
mkdir ~/.backups
```

3. Move the conflicting folders to the backup folder depending if you have them

```sh
mv ~/.config/bspwm ~/.backups
mv ~/.config/mpDris2 ~/.backups
mv ~/.config/user-dirs/dirs ~/.backups
mv ~/.mpd ~/.backups
mv ~/.ncmpcpp ~/.backups
```

4. Copy the ``cat-configs`` to your ``~/.config``
	
```sh
cp -rf cat-configs ~/.config
```

5. Copy the bspwm folder you config in your ``~/.config``

```sh
cp -rf bspwm ~/.config
```

6. Change the scripts into exutables

```sh
chmod +x ~/.config/cat-configs/bin/system/*
chmod +x ~/.config/cat-configs/bin/utilities/*
```

7. Copy the home configs to your home directory ``~``

```sh
cp -rf misc/home/. ~
```

8. Install the extra fonts

	* Archlinux:
		1. Go to ``misc/fonts`` directory

		```sh
		cd misc/fonts
		```

		2. Add the ``sha256`` to the ``PKGBUILD``

		```sh
		makepkg -g >> PKGBUILD
		```

		3. Install the fonts using makepkg

		```sh
		makepkg -si
		```

	* Other Distros:
		1. Download the official phosphor fonts
		
    	> https://raw.githubusercontent.com/phosphor-icons/web/master/src/bold/Phosphor-Bold.ttf

    	> https://raw.githubusercontent.com/phosphor-icons/web/master/src/duotone/Phosphor-Duotone.ttf
		
    	> https://raw.githubusercontent.com/phosphor-icons/web/master/src/fill/Phosphor-Fill.ttf

    	> https://raw.githubusercontent.com/phosphor-icons/web/master/src/light/Phosphor-Light.ttf

    	> https://raw.githubusercontent.com/phosphor-icons/web/master/src/regular/Phosphor.ttf

    	> https://raw.githubusercontent.com/phosphor-icons/web/master/src/thin/Phosphor-Thin.ttf

		2. Copy them to your ``/usr/share/fonts`` or ``~/.fonts``

		```sh
		sudo cp Phosphor-Bold.ttf /usr/share/fonts/TTF/Phosphor-Bold.ttf
		sudo cp Phosphor-Duotone.ttf /usr/share/fonts/TTF/Phosphor-Duotone.ttf
		sudo cp Phosphor-Fill.ttf /usr/share/fonts/TTF/Phosphor-Fill.ttf
		sudo cp Phosphor-Light.ttf /usr/share/fonts/TTF/Phosphor-Light.ttf
		sudo cp Phosphor.ttf /usr/share/fonts/TTF/Phosphor.ttf
		sudo cp Phosphor-Thin.ttf /usr/share/fonts/TTF/Phosphor-Thin.ttf
		```

9. Install the gtk themes and icons

	* GTK

		```sh
		git clone --recurse-submodules https://github.com/catppuccin/gtk.git cat-gtk
		cd cat-gtk
		# You can use either venv or virtualenv
		python3 -m venv venv
		source ./venv/bin/activate
		pip install -r requirements.txt
		# Themes must be insalled at the user themes directory
		python3 install.py all -a all -s standard -d ~/.themes
		```

	* Icons

		```sh
		git clone https://github.com/catppuccin/papirus-folders.git cat-folders
    	cd cat-folders
		# Icons must be installed at the user icons directory
    	wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh
    	cp -r ./src/* ~/.icons/Papirus
		# Use the modified papirus-folders script
    	cp ./papirus-folders ~/.local/bin
		```

10. You should be done just log out at your session or restart your system to apply the changes

</details>

<details>
	<summary><b><samp>NIX INSTALL</samp></b></summary>
<br>

# WIP

</details>

<br>

<details>
<summary><b><samp>SCREENSHOTS</samp></b></summary>
<br>

WIP
> Desktop
![desktop_preview](https://github.com/Deathemonic/Cat-Dots/assets/65948476/6635bc1c-118c-42fb-a2cf-289de68b69ae)

</details>

<details>
<summary><b><samp>THANKS TO</samp></b></summary>
<br>

- <img src="https://avatars.githubusercontent.com/u/93489351?v=4" width="25"/> [**Catppuccin**](https://github.com/Catppuccin) - For the color palette and theming
- <img src="https://avatars.githubusercontent.com/u/64472354?v=4" width="25"/> [**Manas140**](https://github.com/Manas140) - For his dotfiles I make as the base
- <img src="https://avatars.githubusercontent.com/u/26059688?v=4" width="25"/> [**adi1090x**](https://github.com/adi1090x) - For his configs and archcraft
- <img src="https://avatars.githubusercontent.com/u/35840154?v=4" width="25"> [**andreasgrafen**](https://www.reddit.com/r/unixporn/comments/sak598/yabai_catppuccin_is_taking_over_and_i_love_it/) - For the inspiration and Cascade
- <img src="https://avatars.githubusercontent.com/u/93292023?v=4" width="25"> [**rxyhn**](https://github.com/rxyhn) - For his scripts
- <img src="https://avatars.githubusercontent.com/u/61628558?v=4" width="25"> [**obliviousofcraps**](https://github.com/obliviousofcraps) - For the kitty mappings and tabbar configs

***And you - For checking out my Dotfiles***

</details>

<details>
<summary><b><samp>SUPPORT</samp></b></summary>
<br>

**Like my work consider supporting me**

[![LiberaPay](https://img.shields.io/badge/Liberapay-F6C915?style=for-the-badge&logo=liberapay&logoColor=black)](https://liberapay.com/Zinth)

</details>

<details>
<summary><b><samp>OTHER DOTFILES</samp></b></summary>
<br>

[**SweetDots**](https://github.com/Deathemonic/SweetDots) - A **sweetpastel** themed dotfiles

[**Kyuketsuki**](https://github.com/Deathemonic/Kyuketsuki) - A minimalist **dracula** theme dotfiles (**Archived**)

</details>
<br>

Made with :heart: by [Deathemonic](https://github.com/Deathemonic)

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center"><a href="https://github.com/Deathemonic/Cat-Dots/blob/main/.github/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=GPL&logoColor=d9e0ee&colorA=302d41&colorB=c9cbff"/></a></p>
