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

	Data=$(date '+%d-%m-%y')
	Data2=$(date '+%H')
	Data3=$(date '+%M')
	Data4=$(date '+%S')

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

######################################################

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

	!!! Installer intended for clean (empty) system installations! If you already have your configuration files,
	make a copy of them or cancel BlackArrow installations !!!
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
	
	if cd ~/ &> /dev/null; then echo ""; else echo "Fail: cd ~/" && exit 0; fi
	git clone https://gitlab.com/xXBlackMaskXx/blackarrow
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

	yay
	yes | LC_ALL=en_US.UTF-8 sudo pacman --needed -S i3-gaps wireless_tools python-pip compton termite thunar pamixer papirus-icon-theme telegram-desktop rofi nitrogen ttf-dejavu neovim zsh polkit-gnome unclutter xcape pacman-contrib gsimplecal gnome-font-viewer zsh-syntax-highlighting neofetch figlet lolcat xorg-server xdg-user-dirs lightdm-gtk-greeter |& tee -a ~/yay-log\ "$Data"\ "$Data2":"$Data3":"$Data4".log
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

	yes | LC_ALL=en_US.UTF-8 yay --needed -S zsh-syntax-highlighting light i3lock-fancy-git google-chrome ttf-dejavu-sans-mono-powerline-git polybar antigen-git |& tee -a ~/yay-log\ "$Data"\ "$Data2":"$Data3":"$Data4".log
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
	#Wallpaper @Tapeta
	sudo mkdir /home/wallpaper && sudo chown -R "$USER" /home/wallpaper
		cp ~/blackarrow/blackarrow/wallpaper.jpg /home/wallpaper
		cp ~/blackarrow/blackarrow/wallpaper2.png /home/wallpaper
	#Old @Stare
	sudo mkdir ~/OldC
		if cd /usr/share/themes/oomox-numix 2> /dev/null; then sudo mv /usr/share/themes/oomox-numix ~/OldC && cd || echo ""; else cd || echo ""; fi
		if sudo mv ~/.themes ~/OldC 2> /dev/null; else echo ".themes is empty"
		if sudo mv ~/.scripts ~/OldC 2> /dev/null; else echo ".scripts is empty"
		if sudo mv ~/.profile ~/OldC 2> /dev/null; else echo ".profile is empty"
		if sudo mv ~/.xprofile ~/OldC 2> /dev/null; else echo ".xprofile is empty"
		if sudo mv ~/.Xresources ~/OldC 2> /dev/null; else echo ".Xresources is empty"
		if sudo mv ~/.termite ~/OldC 2> /dev/null; else echo ".termite is empty"
		if sudo mv ~/.zshrc ~/OldC 2> /dev/null; else echo ".zshrc is empty"
		if sudo mv ~/.antigen ~/OldC 2> /dev/null; else echo ".antigen is empty"
			#.config
			if sudo mv ~/.config/gsimplecal/ ~/OldC; else echo ".config/gsimplecal/ is empty"
			if sudo mv ~/.config/i3/ ~/OldC; else echo ".config/i3/ is empty"
			if sudo mv ~/.config/polybar/ ~/OldC; else echo ".config/polybar/ is empty"
			if sudo mv ~/.config/termite/ ~/OldC; else echo ".config/termite/ is empty"
			if sudo mv ~/.config/rofi/ ~/OldC; else echo ".config/rofi/ is empty"
			if sudo mv ~/.config/ranger/ ~/OldC; else echo ".config/ranger/ is empty"
			if sudo mv ~/.config/neofetch/ ~/OldC; else echo ".config/neofetch/ is empty"
			if sudo mv ~/.config/gtk-3.0/ ~/OldC; else echo ".config/gtk-3.0/ is empty"
			if sudo mv ~/.config/nitrogen/ ~/OldC; else echo ".config/nitrogen/ is empty"
			if sudo mv ~/.config/compton.conf ~/OldC; else echo ".config/compton.conf is empty"
			if sudo mv ~/.config/nvim/ ~/OldC; else echo ".config/nvim/ is empty"
	#Moving @Przenoszenie
	if cd ~/blackarrow/blackarrow/ &> /dev/null; then echo ""; else echo "Fail: cd ~/blackarrow/blackarrow/"; fi
		sudo cp .profile ~/
		sudo cp .xprofile ~/
		sudo cp .Xresources ~/
		sudo cp .zshrc ~/
		sudo cp .gtkrc-2.0 ~/
		sudo cp -r ~/blackarrow/blackarrow/.scripts ~/
		sudo cp -r ~/blackarrow/blackarrow/.themes ~/
		sudo cp -r ~/blackarrow/blackarrow/themes/oomox-numix /usr/share/themes
		sudo cp -r ~/blackarrow/blackarrow/backgrounds /usr/share/
		sudo cp -r ~/blackarrow/blackarrow/lightdm /etc 
		sudo cp -r ~/blackarrow/blackarrow/fonts/* ~/.local/share/fonts/
			#.config
			sudo cp -r ~/blackarrow/blackarrow/.config/gsimplecal ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/i3/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/polybar/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/termite/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/rofi/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/ranger/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/neofetch/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/gtk-3.0/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/nitrogen/ ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/compton.conf ~/.config
			sudo cp -r ~/blackarrow/blackarrow/.config/nvim ~/.config
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

	systemctl enable lightdm.service
	xdg-user-dirs-update
	nitrogen --set-auto ~/wallpaper/wallpaper.jpg
	chsh -s /usr/bin/zsh
	mkdir ~/.yay-log
	mkdir "$(xdg-user-dir PICTURES)"/ScreenShots
	sudo pip3 install neovim
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
