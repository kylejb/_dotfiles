#!/bin/sh

. "$( pwd )/utils.exclude.sh"

PROMPT='[ APT Bootstrapper ]'

echo_with_prompt "Script assumes it is being run as root."

# Ensures latest packages and security updates are installed
sudo apt update
sudo apt upgrade -y

# Install git
if ! [ -x "$(command -v git)"]; then
    echo -e "⤵ Installing git..."
    sudo apt install git -y
else
    echo -e "$(git --version) already installed"
fi


# Install GNUPG
if ! [ -x "$(command -v gpg)"]; then
    echo -e "⤵ Installing gpg..."
    sudo apt install gpg -y
else
    echo -e "$(gpg --version) already installed"
fi

# Show directory structure with excellent formatting
apt install tree -y

###########################
# zsh setup
###########################
# Install zsh
if ! [ -x "$(command -v zsh)"]; then
    echo -e "⤵ Installing zsh..."
    sudo apt install zsh -y
else
    echo -e "$(zsh --version) already installed"
fi
echo -e "✅ Successfully installed zsh version: $(zsh --version)"
# Set up zsh tools
echo -e "⤵ Installing zsh plugins..."
sudo apt install zsh-syntax-highlighting -y
sudo apt install zsh-autosuggestions -y
echo -e "✅ Successfully installed zsh-autosuggestions, zsh-syntax-highlighting"
# Set the default shell
echo -e "⤵ Changing the default shell"
chsh -s $(which zsh) $USER
echo -e "✅ Successfully modified the default shell"
###########################
# end zsh setup
###########################

# Install starship dependencies
echo -e "⤵ Installing fonts to support starship.rs..."
# apt install fonts-powerline -y
apt install fonts-firacode -y
# Install starship
echo -e "⤵ Installing starship.rs..."
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# Clean cache
apt clean
echo -e "🎉 Done! 🎉"
