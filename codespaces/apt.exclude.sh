#!/bin/sh

set -eux

sudo apt-get -u update
sudo apt-get -y upgrade

if ! [ -x "$(command -v zsh)"]; then
    echo -e "Installing zsh..."
    sudo apt-get -y install zsh
else
    echo -e "$(zsh --version) already installed"
fi

if [ -d "$HOME/.zshrc" ]; then
    rm ~/.zshrc
fi
