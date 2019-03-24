#!/usr/bin/env bash


# Install packages

sudo apt-get install tor git-core git-extras figlet tmux python python3 python3-pip python-pip nmap

mkdir $HOME/go

mkdir $HOME/code

wget https://dl.google.com/go/go1.10.linux-amd64.tar.gz

sudo tar -C $HOME/go -xzf go1.10.linux-amd64.tar.gz

curl https://glide.sh/get | sh

  go get github.com/avelino/vim-bootstrap
