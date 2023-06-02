#!/usr/bin/env bash
# Script for setting up a working environment

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/bundle
brew bundle

# Install Prezto for ZSH
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm -f $HOME/.wezterm.lua
ln -s $HOME/dotfiles/.wezterm.lua $HOME/.wezterm.lua

chsh -s /bin/zsh

# Replace Prezto's configuration files with mine
rm -f "$HOME/.zshrc" && ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc" && \
rm -f "$HOME/.zpreztorc" && ln -s "$HOME/dotfiles/zpreztorc" "$HOME/.zpreztorc"
