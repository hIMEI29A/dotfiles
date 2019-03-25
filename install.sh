#!/usr/bin/env bash

# Script to install system configs
# and Golang build'n'dev tools

##############################
#    Variables and functions #
##############################

# GOROOT
GROOT=$HOME/go

#GOPATH
GPATH=$HOME/code

# Function to install components
cinstall() {
	echo '"$1" is not installed. Install it.' >&2
	sudo apt-get install "$1"
		
	echo 'Ok. "$1" install successfully'
}

# Function to check and install components.
chinstall() {
	if [ $1 = "--sys" ]
	then
		if [ "$2" = "git-core" ]
		then
			if ! [ -x "$(command -v git)" ]
			then
				cinstall "$2"		
			else
				echo 'Ok. "$2" on the place'
			fi
		fi
			
		if ! [ -x "$(command -v "$2")" ]
		then
			cinstall "$2"		
		else
			echo 'Ok. "$2" on the place'
		fi
	fi
	
	if [ $1 = "--go" ]
	then
		echo "Install "$2""
		go get "$2"
		go install "$2"
		echo 'Ok. "$2" install successfully'
	fi
	
	if [ $1 = "--py" ]
	then
		echo 'Install "$2"'
		pip install "$2"
		echo 'Ok. "$2" install successfully'
	fi
}

# Function to install Golang
goinstall() {
	if ! [ -x "$(command -v go)" ]
	then
		echo 'Golang is not installed. Install it.' >&2
	
		mkdir $GROOT
		mkdir $GPATH
	
		wget https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
		sudo tar -C $HOME/go -xzf go1.10.linux-amd64.tar.gz
	
		echo "OK. Golang v1.12.1 installed successfully"
	fi
}

# Function to copy all dotfiles from repo folder to $HOME
dcopy() {
	cp .??* $HOME
}

# Function to copy motd to /etc
mcopy() {
	sudo cp motd /etc
}

# Function to install figlet fonts
finstall() {
	git clone https://github.com/hIMEI29A/FigletFonts.git
	cd FigletFonts
	make
	cd ..
}

#############################################
# End of definitions and installation start #
#############################################

# Copy dotfiles
dcopy
mcopy

# Components
for name in tor git-core git-extras make vim figlet tmux python python3 python3-pip python-pip nmap
do
	chinstall --sys "$name"
done

finstall
chinstall --py licen
goinstall
glinstall

for goname in github.com/bketelsen/ngp github.com/cbednarski/mkdeb github.com/avelino/vim-bootstrap
do
	chinstall --go "$goname"
done

chinstall --go github.com/cweill/gotests/...

