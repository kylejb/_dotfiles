# TODO: Script to dynamically update all packages/dependencies based on OS with one command

# Update App Store apps
sudo softwareupdate -i -a

# Update Homebrew (Cask) & packages
brew update && brew upgrade && brew cleanup

# Update npm
npm i -g npm@latest

# Update Ruby & gems
gem update —-system
gem update
gem cleanup