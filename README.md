dotfiles
========

Currently using Zshell with Prezto.

```bash
cd ~
git clone git@github.com:tahb/dotfiles.git
```

## Install


Backup and install dependencies:
```bash
cd ~/dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh
```

Symlinks
```bash

rm -rf "$HOME/.zlogin"
rm -rf "$HOME/.zlogout"s
rm -rf "$HOME/.zpreztor"
rm -rf "$HOME/.zprofile"
rm -rf "$HOME/.zshenv"
rm -rf "$HOME/.zprezto"
rm -rf "$HOME/.zpreztorc"
rm -rf "$HOME/.zshrc"

ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

```

Setup Zshell
```bash
source ~/.zshrc
```

## Extra: Offline variables
- Add sensitive or machine specific variables into `~/dotfiles/.profile`

