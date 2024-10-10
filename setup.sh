#!/usr/bin/env bash

# Script for setting up a working environment

# Install Xcode Command Line Tools
sudo xcode-select --install

# Install Prezto for ZSH
rm -rf ~/.zprezto ~/.zpreztor ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv ~/.zshrc
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Link Prezto configuration files
shopt -s nullglob
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
  if [[ $rcfile != *README.md ]]; then
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile##*/}"
  fi
done

# Link personal configuration files
rm -f $HOME/.wezterm.lua
ln -s $HOME/dotfiles/.wezterm.lua $HOME/.wezterm.lua
ln -s $HOME/dotfiles/.gitignore $HOME/.gitignore
ln -s $HOME/dotfiles/gitconfig $HOME/.gitconfig
rm -f "$HOME/.zshrc" && ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
rm -f "$HOME/.zpreztorc" && ln -s "$HOME/dotfiles/zpreztorc" "$HOME/.zpreztorc"
touch $HOME/dotfiles/.profile

# Change default shell to ZSH
chsh -s /bin/zsh

( cd homebrew && ./setup.sh )
( cd iterm && ./setup.sh )
