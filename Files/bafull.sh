# _____      _ _   ___           _        _ _       _   _
#|  ___|   _| | | |_ _|_ __  ___| |_ __ _| | | __ _| |_(_) ___  _ __
#| |_ | | | | | |  | || '_ \/ __| __/ _` | | |/ _` | __| |/ _ \| '_ \
#|  _|| |_| | | |  | || | | \__ \ || (_| | | | (_| | |_| | (_) | | | |
#|_|   \__,_|_|_| |___|_| |_|___/\__\__,_|_|_|\__,_|\__|_|\___/|_| |_|

#####################
# Color definitions #
#####################

if [ -x "$(command -v tput)" ]; then
  # Foreground
  bold="$(tput bold)"
  black="$(tput setaf 0)"
  green="$(tput setaf 2)"
  yellow="$(tput setaf 3)"
  blue="$(tput setaf 4)"
  reset="$(tput sgr0)"
  # Background
  red_bg="$(tput setab 1)"
  blue_bg="$(tput setab 4)"
fi

######################################################

###############
# Przywitanie #
###############
	clear
	echo "${black}${blue_bg} BlackArrow installer 1/6 - Welcome in BlackArrow Installer ${reset}
	"
	echo "	 ____  _            _        _                           
	| __ )| | __ _  ___| | __   / \   _ __ _ __ _____      __
	|  _ \| |/ _\` |/ __| |/ /  / _ \ | '__| '__/ _ \ \ /\ / /
	| |_) | | (_| | (__|   <  / ___ \| |  | | | (_) \ V  V / 
	|____/|_|\__,_|\___|_|\_\/_/   \_\_|  |_|  \___/ \_/\_/  
	"
	echo "	Welcome to the installer of my Arch Linux configuration. I hope you will like it!

	!!! Installer intended for clean (empty) system installations! If you already have your configuration files,
	make a copy of them or cancel BlackArrow installations !!!
	"
		#zap
		read -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo Ok! Get Ready!
		else
			exit 0
			clear
		fi
	cd ~/
	git clone https://gitlab.com/xXBlackMaskXx/blackarrow
	cd
	clear
##########################################################
# Checking if AUR Helper is installed (sprawdzanie yay?) #
##########################################################

	echo "${black}${blue_bg} BlackArrow installer 1,5/6 - Installing AUR Helper ${reset}
	"
	echo "We will check if you have "yay""

		#zap
		read -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi

	if yay --version &> /dev/null; then
	  echo "AUR Helper - Yay is installed"
	else
	  git clone https://aur.archlinux.org/yay.git
	  cd yay || exit
	  makepkg -si
	  cd ..
	  rm -rf yay
	fi
	clear
###################
# Programy z repo #
###################

	echo "${black}${blue_bg} BlackArrow installer 2/6 - Installing from repository ${reset}
	"
	echo "Now we will install the necessary programs"

		#zap
		read -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi

	yay
	sudo pacman -S i3-gaps compton termite pamixer rofi nitrogen ttf-font-awesome ttf-dejavu neovim zsh polkit-gnome qutebrowser unclutter xcape
	clear
##################
# Programy z AUR #
##################

	echo "${black}${blue_bg} BlackArrow installer 3/6 - Installing from AUR ${reset}
	"
	echo "Other necessary programs :D "

		#zap
		read -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi

	yay -S light i3lock-fancy-git neofetch lolcat figlet ttf-dejavu-sans-mono-powerline-git polybar antigen-git lightdm-gtk-greeter xorg-server xdg-user-dirs 
	clear
###################################
# Komendy po instalacji programów #
###################################

	echo "${black}${blue_bg} BlackArrow installer 4/6 - Starting programs ${reset}
	"
	echo "Now we will launch the programs"

		#zap
		read -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi

	systemctl enable lightdm.service
	xdg-user-dirs-update
	clear
#######################
# Przenoszenie plików #
#######################

	echo "${black}${blue_bg} BlackArrow installer 5/6 - Moving configs ${reset}
	"
	echo "And finally transferring configuration files! Required root password (used "sudo" command). You can interrupt and move configurations manually. The commands you need are at the very bottom of the blackarrow.sh file"

		#zap
		read -p "Are you sure you want to continue? <y/N> " prompt
		if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
		then
			echo "Ok! Get Ready!"
		else
			exit 0
			clear
		fi

	cd ~/
	sudo mkdir ~/OldC&S
	sudo mv ~/.config ~/OldC&S
	sudo mv ~/.scripts ~/OldC&S
	cd ~/blackarrow/blackarrow/
	sudo cp .profile ~/
	sudo cp .xprofile ~/
	sudo cp .Xresources ~/
	sudo cp .zshrc ~/
	sudo cp -r ~/blackarrow/blackarrow/.scripts ~/
	sudo cp -r ~/blackarrow/blackarrow/.config ~/
	clear
##########
# Koniec #
##########

	echo "${black}${blue_bg} BlackArrow installer 6/6 - Ending ${reset}
	"

	echo "	
	                      ##
	                     ####
	                    ######
	                   ########
	                  ##########
	                 ############
	                ##############          ____  _            _        _
	               ################        | __ )| | __ _  ___| | __   / \   _ __ _ __ _____      __
	              ##################       |  _ \| |/ _\` |/ __| |/ /  / _ \ | '__| '__/ _ \ \ /\ / /
	             ####################      | |_) | | (_| | (__|   <  / ___ \| |  | | | (_) \ V  V /
	            ######################     |____/|_|\__,_|\___|_|\_\/_/   \_\_|  |_|  \___/ \_/\_/
	           ##########    ##########
	          ##########      ##########
	         ###########      ###########
	        ##########          ##########
	       #######                  #######
	      ####                          ####
	     ###                              ###
	    #                                    #
	"

	read -p "Thanks for using my installer! I'm hoping that you'll like my job! But... are you sure you want to leave??? <y>" prompt
	if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
	then
	        clear
		exit 0
	else
		#next
	        figlet "Oooooooo..."
	        read -p "I love you too but you have to go! <y> " prompt
	        if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
	        then
	                exit 0
	        else
	                figlet "Get the fuck out!!!"
	                exit 0
	        fi
		#koniec
	fi

#  _     _                  ___                       _             _            #
# | |__ | |___      __     |_ _|  _   _ ___  ___     / \   _ __ ___| |__        ###
# | '_ \| __\ \ /\ / /      | |  | | | / __|/ _ \   / _ \ | '__/ __| '_ \      #####
# | |_) | |_ \ V  V / _ _   | |  | |_| \__ \  __/  / ___ \| | | (__| | | |    ### ###
# |_.__/ \__| \_/\_(_|_|_) |___|  \__,_|___/\___| /_/   \_\_|  \___|_| |_|   ###   ###
#
