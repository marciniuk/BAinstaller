#!/bin/bash
#
# ____    _       ____             __ _         _   _           _       _       
#| __ )  / \     / ___|___  _ __  / _(_) __ _  | | | |_ __   __| | __ _| |_ ___ 
#|  _ \ / _ \   | |   / _ \| '_ \| |_| |/ _` | | | | | '_ \ / _` |/ _` | __/ _ \
#| |_) / ___ \  | |__| (_) | | | |  _| | (_| | | |_| | |_) | (_| | (_| | ||  __/
#|____/_/   \_\  \____\___/|_| |_|_| |_|\__, |  \___/| .__/ \__,_|\__,_|\__\___|
#                                       |___/        |_|                        
#

#####################
# Color definitions #
#####################

	if [ -x "$(command -v tput)" ]; then
	# Foreground
		bold="$(tput bold)"
		black="$(tput setaf 0)"
		blue="$(tput setaf 4)"
		reset="$(tput sgr0)"
	# Background
		blue_bg="$(tput setab 4)"
	fi

##################
# Ustalanie daty #
##################

Data=$(date '+%d-%m-%y')
Data2=$(date '+%H')
Data3=$(date '+%M')
Data4=$(date '+%S')

######################################################

###############
# Przywitanie #
###############

	clear
	echo "${black}${blue_bg}${bold} BlackArrow Config Update 1/X - Welcome in BlackArrow Config Update ${reset}
	"
	echo "${blue}	 ____  _            _        _                           
	| __ )| | __ _  ___| | __   / \\   _ __ _ __ _____      __
	|  _ \\| |/ _\` |/ __| |/ /  / _ \\ | '__| '__/ _ \\ \\ /\\ / /
	| |_) | | (_| | (__|   <  / ___ \\| |  | | | (_) \\ V  V / 
	|____/|_|\\__,_|\\___|_|\\_\\/_/   \\_\\_|  |_|  \\___/ \\_/\\_/  
	${reset}"

	echo "	Welcome to the configuration file update installer. 
	The old files will be moved to the folder ~/OldC/[current date]
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

###################################################
# Utworzenie folderów oraz pobranie nowych plików #
###################################################

	if cd ~/ &> /dev/null; then echo ""; else echo "Fail: cd ~/"; fi
		mkdir OldC &> /dev/null
		mkdir OldC/moved\ $Data\ $Data2:$Data3:$Data4
	mv ~/blackarrow ~/OldC/moved\ $Data\ $Data2:$Data3:$Data4
	git clone https://gitlab.com/xXBlackMaskXx/blackarrow

	#stare
	sudo mkdir ~/OldC
		sudo mv ~/.scripts ~/OldC
		sudo mv ~/.profile ~/OldC
		sudo mv ~/.xprofile ~/OldC
		sudo mv ~/.Xresources ~/OldC
		sudo mv ~/.termite ~/OldC
		sudo mv ~/.zshrc ~/OldC
		sudo mv ~/.antigen ~/OldC
			#.config
			sudo mv ~/.config/i3/ ~/OldC
			sudo mv ~/.config/polybar/ ~/OldC
			sudo mv ~/.config/termite/ ~/OldC
			sudo mv ~/.config/rofi/ ~/OldC
			sudo mv ~/.config/ranger/ ~/OldC
			sudo mv ~/.config/neofetch/ ~/OldC
			sudo mv ~/.config/gtk-3.0/ ~/OldC
			sudo mv ~/.config/nitrogen/ ~/OldC
			sudo mv ~/.config/compton.conf ~/OldC
			sudo mv ~/.config/nvim/ ~/OldC
	#przenoszenie
	if cd ~/blackarrow/blackarrow/ &> /dev/null; then echo ""; else echo "Fail: cd ~/blackarrow/blackarrow/"; fi
		sudo cp .profile ~/
		sudo cp .xprofile ~/
		sudo cp .Xresources ~/
		sudo cp .zshrc ~/
		sudo cp .gtkrc-2.0 ~/
		sudo cp -r ~/blackarrow/blackarrow/.scripts ~/
		sudo cp -r ~/blackarrow/blackarrow/.themes ~/
		sudo cp -r ~/blackarrow/blackarrow/themes /usr/share/
		sudo cp -r ~/blackarrow/blackarrow/backgrounds /usr/share/
		sudo cp -r ~/blackarrow/blackarrow/lightdm /etc 
		sudo cp -r ~/blackarrow/blackarrow/fonts/* ~/.local/share/fonts/
			#.config
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
	#przyznanie uprawnień
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

	read -r -p "Thanks for using BAUpdate! Have fun using it! <y>" prompt
	if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
	then
	        clear
		exit 0
	else
		clear
		exit 0
	fi

	clear && zsh

















