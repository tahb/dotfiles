#!/usr/bin/env bash

# Script for setting up a working environment

# Install Xcode Command Line Tools
sudo xcode-select --install

# Install Prezto for ZSH
# rm -rf ~/.zprezto ~/.zpreztor ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv ~/.zshrc
# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Link Prezto configuration files
shopt -s nullglob
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
  if [[ $rcfile != *README.md ]]; then
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile##*/}"
  fi
done

# Link personal configuration files
mkdir -p $HOME/.config/ghostty/
mkdir -p $HOME/.config/aerospace/
touch $HOME/dotfiles/.profile

ln -sfn $HOME/dotfiles/.wezterm.lua $HOME/.wezterm.lua
ln -sfn $HOME/dotfiles/ghostty/config $HOME/.config/ghostty/config
ln -sfn $HOME/dotfiles/.gitignore $HOME/.gitignore
ln -sfn $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -sfn "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -sfn "$HOME/dotfiles/zpreztorc" "$HOME/.zpreztorc"
ln -sfn "$HOME/dotfiles/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"
ln -sfn "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Change default shell to ZSH
chsh -s /bin/zsh

( cd homebrew && ./setup.sh )
( cd iterm && ./setup.sh )
