#!/usr/bin/env bash

# Function to copy all dotfiles from repo folder to $HOME
dcopy() {
	cp .??* $HOME
}

# Function to copy motd to /etc
mcopy() {
	sudo cp motd /etc
}

# Copy dotfiles
dcopy
mcopy

