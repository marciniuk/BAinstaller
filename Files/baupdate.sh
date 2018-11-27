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

###### przenoszenie configów - trzeba zrobić dokładniejsze nyh

	clear && zsh

















