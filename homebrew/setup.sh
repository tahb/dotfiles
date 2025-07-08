#!/usr/bin/env bash
set -e

# Check for Homebrew, install if we don't have it
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae
echo "Upgrading existing formulae..."
brew upgrade

# Install everything from Brewfile
echo "Installing from Brewfile..."
brew bundle --file=./Brewfile

echo "Homebrew setup complete."
