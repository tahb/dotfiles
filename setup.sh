#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

# Xcode Command Line Tools
if ! command -v xcodebuild &>/dev/null; then
  sudo xcode-select --install
fi

# Prezto
if [[ -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
  echo "Prezto already installed, skipping"
else
  rm -rf ~/.zprezto ~/.zpreztor ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv ~/.zshrc
  echo "Installing Prezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

shopt -s nullglob
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
  target="${ZDOTDIR:-$HOME}/.${rcfile##*/}"
  if [[ $rcfile != *README.md ]] && [[ ! -L "$target" ]]; then
    ln -s "$rcfile" "$target"
  fi
done

if [[ "$(echo $SHELL)" != */zsh* ]]; then
  echo "Shell was not zsh, skipping chsh"
fi

# Pi coding agent
if ! command -v pi &>/dev/null; then
  echo "Installing pi.dev coding agent..."
  brew install pi-coding-agent
fi

# Symlinks
"$DOTFILES/makesymlinks.sh"

# RTK
rtk init -g --opencode > /dev/null

echo "Done."
echo "Remember to create /work/.gitconfig and point to work keys"
echo "Remember to enable 1Password SSH agent. Settings>Developer>Use the SSH Agent."
