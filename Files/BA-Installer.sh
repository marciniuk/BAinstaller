#!/bin/bash
# ____    _      ___           _        _ _           
#| __ )  / \    |_ _|_ __  ___| |_ __ _| | | ___ _ __ 
#|  _ \ / _ \    | || '_ \/ __| __/ _` | | |/ _ \ '__|
#| |_) / ___ \   | || | | \__ \ || (_| | | |  __/ |   
#|____/_/   \_\ |___|_| |_|___/\__\__,_|_|_|\___|_|   
#

################################ @@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Determining the current date # @ Określanie bieżącej daty @
################################ @@@@@@@@@@@@@@@@@@@@@@@@@@@@
	Data=$(date +%d-%m-%G\ %H:%M:%S)

##################### @@@@@@@@@@@@@@@@@@@@@@@@
# Color definitions # @ Definiowanie kolorów @
##################### @@@@@@@@@@@@@@@@@@@@@@@@
	if [ -x "$(command -v tput)" ]; then
	# Foreground
		bold="$(tput bold)"
		black="$(tput setaf 0)"
		blue="$(tput setaf 4)"
		reset="$(tput sgr0)"
	# Background
		blue_bg="$(tput setab 4)"
	fi


#############################################################

########### @@@@@@@@@@@@@@@
# Welcome # @ Przywitanie @
########### @@@@@@@@@@@@@@@
	clear
	echo "${black}${blue_bg}${bold} BlackArrow installer 1/6 - Welcome in BlackArrow Installer ${reset}
	"
	echo "${blue}	 ____  _            _        _                           
	| __ )| | __ _  ___| | __   / \\   _ __ _ __ _____      __
	|  _ \\| |/ _\` |/ __| |/ /  / _ \\ | '__| '__/ _ \\ \\ /\\ / /
	| |_) | | (_| | (__|   <  / ___ \\| |  | | | (_) \\ V  V / 
	|____/|_|\\__,_|\\___|_|\\_\\/_/   \\_\\_|  |_|  \\___/ \\_/\\_/  
	${reset}"
	echo "	Welcome to the installer of my Arch Linux configuration. I hope you will like it!

	"
		#FAQ
		read -r -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo Ok! Get Ready!
		else
			exit 0
			clear
		fi
		#FAQ

	if cd ~/ &> /dev/null; then echo ""; else echo "Fail: cd ~/"; fi
	git clone https://gitlab.com/xXBlackMaskXx/blackarrow
	cd ~/blackarrow && git submodule update --init --recursive && cd - || echo "not working"
	clear


############################################# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Checking if AUR Helper is installed (yay) # @ Sprawdzanie czy jest "yay" @
############################################# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	echo "${black}${blue_bg}${bold} BlackArrow installer 1,5/6 - Installing AUR Helper ${reset}
	"
	echo "We will check if you have ~yay~"

		#FAQ
		read -r -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi
		#FAQ

	if yay --version &> /dev/null; then
		echo "AUR Helper - ~Yay~ is installed"
	else
		git clone https://aur.archlinux.org/yay.git
		cd yay || exit
		makepkg -si
		cd ..
		rm -rf yay
	fi
	clear


######################################### @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Programs from the official repository # @ Programy z oficjalnego repo @
######################################### @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	echo "${black}${blue_bg}${bold} BlackArrow installer 2/6 - Installing from repository ${reset}
	"
	echo "Now we will install the necessary programs"

		#FAQ
		read -r -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi
		#FAQ

	yay
	sudo pacman --needed -S noto-fonts-cjk sxiv mpv maim light i3-gaps xss-lock noto-fonts-emoji dunst wireless_tools python-pip compton termite thunar pamixer papirus-icon-theme telegram-desktop rofi nitrogen ttf-dejavu neovim zsh polkit-gnome unclutter xcape pacman-contrib gsimplecal gnome-font-viewer zsh-syntax-highlighting neofetch figlet lolcat xorg-server xdg-user-dirs lightdm-gtk-greeter |& tee -a ~/yay-log\ "$Data".log
	clear


##################### @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Programs from AUR # @ Programy z AUR (repo użytkowników) @
##################### @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	echo "${black}${blue_bg}${bold} BlackArrow installer 3/6 - Installing from AUR ${reset}
	"
	echo "Other necessary programs :D "

		#FAQ
		read -r -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi
		#FAQ

	yay --needed -S color-picker zsh-syntax-highlighting ttf-symbola i3lock google-chrome ttf-dejavu-sans-mono-powerline-git polybar antigen-git |& tee -a ~/yay-log\ "$Data".log
	clear


################ @@@@@@@@@@@@@@@@@@@@@@@
# Moving files # @ Przenoszenie plików @
################ @@@@@@@@@@@@@@@@@@@@@@@
	echo "${black}${blue_bg}${bold} BlackArrow installer 4/6 - Moving configs ${reset}
	"
	echo "And finally transferring configuration files! Required root password (used ~sudo~ command). You can interrupt and move configurations manually. The commands you need are at the very bottom of the blackarrow.sh file"

		#FAQ
		read -r -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi
		#FAQ

	#Old @Stare
	sudo mkdir ~/OldC
		sudo mv ~/.themes ~/OldC
		sudo mv ~/.scripts ~/OldC
		sudo mv ~/.profile ~/OldC
		sudo mv ~/.xprofile ~/OldC
		sudo mv ~/.Xresources ~/OldC
		sudo mv ~/.termite ~/OldC
		sudo mv ~/.zshrc ~/OldC
		sudo mv ~/.antigen ~/OldC
			#.config
			sudo mv ~/.config/dunst ~/OldC
			sudo mv ~/.config/dmenu ~/OldC
			sudo mv ~/.config/gsimplecal/ ~/OldC
			sudo mv ~/.config/i3/ ~/OldC
			sudo mv ~/.config/polybar/ ~/OldC
			sudo mv ~/.config/termite/ ~/OldC
			sudo mv ~/.config/rofi/ ~/OldC
			sudo mv ~/.config/ranger/ ~/OldC
			sudo mv ~/.config/neofetch/ ~/OldC
			sudo mv ~/.config/gtk-3.0/ ~/OldC
			sudo mv ~/.config/compton.conf ~/OldC
			sudo mv ~/.config/nvim/ ~/OldC
			sudo mv /etc/systemd/system/lock.service/ ~/OldC
			sudo mv /etc/X11/xorg.conf.d/30-touchpad.conf/ ~/OldC
			sudo mv /usr/bin/i3lock-fancy/ ~/OldC
	#Moving @Przenoszenie
	if cd ~/blackarrow/blackarrow/ 2> /dev/null; then echo ""; else echo "Fail: cd ~/blackarrow/blackarrow/"; fi
		sudo cp .profile ~/
		sudo cp .xprofile ~/
		sudo cp .Xresources ~/
		sudo cp .zshrc ~/
		sudo cp .gtkrc-2.0 ~/
		sudo cp -r ~/blackarrow/blackarrow/.scripts ~/
		sudo cp -r ~/blackarrow/blackarrow/.themes ~/
		sudo cp -r ~/blackarrow/blackarrow/backgrounds /usr/share/
		sudo cp -r ~/blackarrow/blackarrow/lightdm /etc 
			mkdir ~/.local
			mkdir ~/.local/share
			mkdir ~/.local/share/fonts
		sudo cp ~/blackarrow/blackarrow/fonts/* ~/.local/share/fonts/
			#.config
			sudo cp -r ~/blackarrow/blackarrow/.config/dunst ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/dmenu ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/gsimplecal ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/i3/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/polybar/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/termite/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/rofi/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/ranger/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/neofetch/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/gtk-3.0/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/compton.conf ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/nvim ~/.config
			sudo cp ~/blackarrow/blackarrow/lock.service/ /etc/systemd/system/
			sudo cp ~/blackarrow/blackarrow/30-touchpad.conf/ /etc/X11/xorg.conf.d/
			sudo cp ~/blackarrow/blackarrow/i3lock-fancy/ /usr/bin/i3lock-fancy/	
				sudo mkdir ~/.config/nvim/bundle && cd ~/.config/nvim/bundle && sudo chown -R "$USER" ~/.config
					git clone https://github.com/Shougo/deoplete.nvim
					git clone https://github.com/junegunn/goyo.vim
					git clone https://github.com/PotatoesMaster/i3-vim-syntax
					git clone https://github.com/itchyny/lightline.vim
					git clone https://github.com/rafaqz/ranger.vim
					git clone https://github.com/romainl/vim-cool
					git clone https://github.com/octol/vim-cpp-enhanced-highlight
					git clone https://github.com/ap/vim-css-color
					git clone https://github.com/itchyny/vim-gitbranch
					git clone https://github.com/reedes/vim-pencil
					git clone https://github.com/tpope/vim-speeddating
					cp -r ~/blackarrow/blackarrow/.config/lightline-biual ~/.config/nvim/bundle
	#Granting permissions @Przyznawanie uprawnień
	if cd ~/ &> /dev/null; then echo ""; else echo "Fail: cd ~/"; fi
		sudo chown -R "$USER" ~/OldC
		sudo chown "$USER" ~/.profile
		sudo chown "$USER" ~/.xprofile
		sudo chown "$USER" ~/.Xresources
		sudo chown "$USER" ~/.zshrc
		sudo chown -R "$USER" ~/.scripts
		sudo chown -R "$USER" ~/.themes
		sudo chown "$USER" ~/.gtkrc-2.0
		sudo chown -R "$USER" /usr/share/backgrounds
	clear


############################### @@@@@@@@@@@@@@@@@@@@@@@@@
# Commands after installation # @ Komendy po instalacji @
############################### @@@@@@@@@@@@@@@@@@@@@@@@@
	echo "${black}${blue_bg}${bold} BlackArrow installer 5/6 - Configuring programs ${reset}
	"
	echo "Now we will launch the programs"

		#FAQ
		read -r -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi
		#FAQ

	sudo pip3 install ueberzug
	systemctl enable lightdm.service
	xdg-user-dirs-update
	nitrogen --set-auto ~/wallpaper/wallpaper.jpg
	chsh -s /usr/bin/zsh
	mkdir ~/.yay-log
	mkdir "$(xdg-user-dir PICTURES)"/ScreenShots
	sudo pip3 install neovim
	yes | LC_ALL=en_US.UTF-8 sudo pacman -Rs rofi-dmenu
	cd ~/.config/dmenu && sudo make clean install && cd - || echo ""
	clear


########## @@@@@@@@@@@@@@@
# Ending # @ Zakończenie @
########## @@@@@@@@@@@@@@@
	echo "${black}${blue_bg}${bold} BlackArrow installer 6/6 - Ending ${reset}
	"

	echo "${bold}
	                      ##
	                     ####
	                    ######
	                   ########
	                  ##########
	                 ############
	                ##############          ____  _            _        _
	               ################        | __ )| | __ _  ___| | __   / \\   _ __ _ __ _____      __
	              ##################       |  _ \\| |/ _\` |/ __| |/ /  / _ \\ | '__| '__/ _ \\ \\ /\\ / /
	             ####################      | |_) | | (_| | (__|   <  / ___ \\| |  | | | (_) \\ V  V /
	            ######################     |____/|_|\\__,_|\\___|_|\\_\\/_/   \\_\\_|  |_|  \\___/ \\_/\\_/
	           ##########    ##########
	          ##########      ##########
	         ###########      ###########
	        ##########          ##########
	       #######                  #######
	      ####                          ####
	     ###                              ###
	    #                                    #
	${reset}"

	read -r -p "Thanks for using my installer! I'm hoping that you'll like my job! But... are you sure you want to leave??? <y>" prompt
	if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
	then
	        clear
		exit 0
	else
		#next
	        figlet "Oooooooo..."
	        read -r -p "I love you too but you have to go! <y> " prompt
	        if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
	        then
	                exit 0
	        else
	                figlet "Get the fuck out!!!"
	                exit 0
	        fi
		#end
	fi

#  _     _                  ___                       _             _           #
# | |__ | |___      __     |_ _|  _   _ ___  ___     / \   _ __ ___| |__       ###
# | '_ \| __\ \ /\ / /      | |  | | | / __|/ _ \   / _ \ | '__/ __| '_ \     #####
# | |_) | |_ \ V  V / _ _   | |  | |_| \__ \  __/  / ___ \| | | (__| | | |   ### ###
# |_.__/ \__| \_/\_(_|_|_) |___|  \__,_|___/\___| /_/   \_\_|  \___|_| |_|  ###   ###
#
# __  __           _        _           
#|  \/  | __ _  __| | ___  | |__  _   _   _
#| |\/| |/ _` |/ _` |/ _ \ | '_ \| | | | (_)
#| |  | | (_| | (_| |  __/ | |_) | |_| |  _ 
#|_|  |_|\__,_|\__,_|\___| |_.__/ \__, | (_)
#                                 |___/    
#    _       _      _               __  __                _       _       _   
#   / \   __| |_ __(_) __ _ _ __   |  \/  | __ _ _ __ ___(_)_ __ (_)_   _| | __
#  / _ \ / _` | '__| |/ _` | '_ \  | |\/| |/ _` | '__/ __| | '_ \| | | | | |/ /
# / ___ \ (_| | |  | | (_| | | | | | |  | | (_| | | | (__| | | | | | |_| |   < 
#/_/   \_\__,_|_|  |_|\__,_|_| |_| |_|  |_|\__,_|_|  \___|_|_| |_|_|\__,_|_|\_\
#
