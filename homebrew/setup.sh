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
# Cache password once for all cask installs
read -rsp "Enter your password (used for cask installs): " BREW_SUDO_PASS
echo
ASKPASS_HELPER="$(mktemp)"
chmod 700 "$ASKPASS_HELPER"
printf '#!/bin/bash\necho "%s"\n' "$BREW_SUDO_PASS" > "$ASKPASS_HELPER"
export SUDO_ASKPASS="$ASKPASS_HELPER"
export HOMEBREW_SUDO_THROUGH_SUDO_ASKPASS=1
trap 'rm -f "$ASKPASS_HELPER"' EXIT
unset BREW_SUDO_PASS
echo "Installing from Brewfile..."
brew bundle --file=./Brewfile --no-lock --adopt

echo "Homebrew setup complete."
