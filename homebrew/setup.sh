#!/usr/bin/env bash

# Exit if brew is not installed
if ! which brew > /dev/null; then
   # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# update Homebrew
brew update

# upgrade existing formulae
brew upgrade

# install common formulae
brew bundle --no-lock
