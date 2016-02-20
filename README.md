dotfiles
========

Currently using Zshell with Prezto.

```bash
cd ~
git clone git://github.com/hippers/dotfiles.git
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

ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

```

Setup Zshell
```bash
source ~/.zshrc
```

## Extra: Offline variables
- Add sensitive or machine specific variables into `~/dotfiles/.profile`

