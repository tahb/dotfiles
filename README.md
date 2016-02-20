dotfiles
========

Currently using Zshell with Prezto.

```bash
cd ~
git clone git://github.com/hippers/dotfiles.git
```

## Install

Symlinks
```bash

rm -rf "$HOME/.zlogin"
rm -rf "$HOME/.zlogout"
rm -rf "$HOME/.zpreztor"
rm -rf "$HOME/.zprofile"
rm -rf "$HOME/.zshenv"
rm -rf "$HOME/.zprezto"
rm -rf "$HOME/.zpreztorc"
ln -s "$$HOME/dotfiles/zshrc" "$HOME/.zshrc"

```


Backup and install dependencies:
```bash
cd ~/dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh
```

Setup Zshell
```bash
source ~/.zshrc
```

## Extra: Offline variables
- Add sensitive or machine specific variables into `~/dotfiles/.profile`

