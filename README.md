dotfiles
========

Currently using Zshell with Prezto.

```bash
cd ~
git clone git@github.com:tahb/dotfiles.git
```

## Backup existing


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

```

## Install


[Install brew](https://brew.sh/)

```
brew install git
```

```
brew install rbenv
```

```
touch ~/dotfiles/.profile
```

```bash
ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
```

```bash
ln -s "$HOME/dotfiles/zpreztorc" "$HOME/.zpreztorc"
```

Load ZSH
```bash
source ~/.zshrc
```


## Extra: Offline variables
- Add sensitive or machine specific variables into `~/dotfiles/.profile`
