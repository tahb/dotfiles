dotfiles
========

Currently using Zshell with Prezto.

```bash
cd ~
git clone git@github.com:tahb/dotfiles.git
```


## Install

[Install brew](https://brew.sh/)

```
brew install git
```

```
brew install rbenv
```

[Install Prezto for Zsh](https://github.com/sorin-ionescu/prezto#installation)

```
cp ~/dotfiles/.profile.example ~/dotfiles/.profile
```

Replace Prezto's configuration files with mine
```bash
rm -f "$HOME/.zshrc" && ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc" && \
rm -f "$HOME/.zpreztorc" && ln -s "$HOME/dotfiles/zpreztorc" "$HOME/.zpreztorc"
```

Load ZSH
```bash
source ~/.zshrc
```


## Extra: Offline variables
- Add sensitive or machine specific variables into `~/dotfiles/.profile`


## Atom

[Install Atom](https://atom.io/)

Install Google Drive and sync atom folder
```
ln -s ~/Google\ Drive/atom ~/.atom
```
