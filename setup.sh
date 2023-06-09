#!/usr/bin/env bash
# Script for setting up a working environment

sudo xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"
brew tap homebrew/bundle
brew bundle

# Install Prezto for ZSH
#! /bin/zsh -
rm -rf ~/.zprezto ~/.zpreztor ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv ~/.zshrc
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

#!/bin/bash
shopt -s nullglob

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
  if [[ $rcfile != *README.md ]]; then
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile##*/}"
  fi
done

rm -f $HOME/.wezterm.lua
ln -s $HOME/dotfiles/.wezterm.lua $HOME/.wezterm.lua

chsh -s /bin/zsh

# Replace Prezto's configuration files with mine
rm -f "$HOME/.zshrc" && ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc" && \
rm -f "$HOME/.zpreztorc" && ln -s "$HOME/dotfiles/zpreztorc" "$HOME/.zpreztorc"

#! /bin/zsh -
setopt EXTENDED_GLOB
