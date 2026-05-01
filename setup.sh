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

ln -sfn $HOME/dotfiles/wezterm/.wezterm.lua $HOME/.wezterm.lua
ln -sfn $HOME/dotfiles/ghostty/config $HOME/.config/ghostty/config
ln -sfn $HOME/dotfiles/.gitignore $HOME/.gitignore
ln -sfn $HOME/dotfiles/gitconfig $HOME/.gitconfig
ln -sfn "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -sfn "$HOME/dotfiles/zpreztorc" "$HOME/.zpreztorc"
ln -sfn "$HOME/dotfiles/aerospace/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"
ln -sfn "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
ln -sfn "$HOME/dotfiles/.clauderc" "$HOME/.clauderc"

# Skills: single canonical source, symlinks to all agents
mkdir -p "$HOME/.claude/skills"
mkdir -p "$HOME/.opencode/skills"

# Create symlinks from canonical source to all agents
ln -sfn "$HOME/dotfiles/skills/review-branch/SKILL.md" "$HOME/.claude/skills/review-branch/SKILL.md"
ln -sfn "$HOME/dotfiles/skills/review-branch/SKILL.md" "$HOME/.opencode/skills/review-branch/SKILL.md"

mkdir -p "$HOME/.config/opencode"
ln -sfn "$HOME/dotfiles/opencode/opencode.json" "$HOME/.config/opencode/opencode.json"

# Review-branch (key skill)
ln -sfn "$HOME/dotfiles/skills/review-branch/SKILL.md" "$HOME/dotfiles/claude/skills/review-branch/SKILL.md"
ln -sfn "$HOME/dotfiles/skills/review-branch/SKILL.md" "$HOME/.claude/skills/review-branch/SKILL.md"
ln -sfn "$HOME/dotfiles/skills/review-branch/SKILL.md" "$HOME/.opencode/skills/review-branch/SKILL.md"

chsh -s /bin/zsh

# Create symlinks for remaining skills
ln -sfn "$HOME/dotfiles/skills/pair/SKILL.md" "$HOME/.claude/skills/pair/SKILL.md"
ln -sfn "$HOME/dotfiles/skills/pair/SKILL.md" "$HOME/.opencode/skills/pair/SKILL.md"

( cd homebrew && ./setup.sh )
( cd iterm && ./setup.sh )

# Testing
ln -sfn "$HOME/dotfiles/skills/testing/SKILL.md" "$HOME/.claude/skills/testing/SKILL.md"
ln -sfn "$HOME/dotfiles/skills/testing/SKILL.md" "$HOME/.opencode/skills/testing/SKILL.md"

echo "Done."
echo "Remember to create /work/.gitconfig and point to work keys"
echo "Remember to enable 1Password SSH agent. Settings>Developer>Use the SSH Agent."
# Code-review
ln -sfn "$HOME/dotfiles/skills/code-review/SKILL.md" "$HOME/.claude/skills/code-review/SKILL.md"
ln -sfn "$HOME/dotfiles/skills/code-review/SKILL.md" "$HOME/.opencode/skills/code-review/SKILL.md"

# Teach (optional)
if [[ -f "$HOME/dotfiles/skills/teach/SKILL.md" ]]; then
  ln -sfn "$HOME/dotfiles/skills/teach/SKILL.md" "$HOME/dotfiles/claude/skills/teach/SKILL.md"
  ln -sfn "$HOME/dotfiles/skills/teach/SKILL.md" "$HOME/.claude/skills/teach/SKILL.md"
  ln -sfn "$HOME/dotfiles/skills/teach/SKILL.md" "$HOME/.opencode/skills/teach/SKILL.md"
fi

# Opencode specific settings
ln -sfn "$HOME/dotfiles/opencode/opencode.json" "$HOME/.config/opencode/opencode.json"

# Initialize RTK with opencode
rtk init -g --opencode
