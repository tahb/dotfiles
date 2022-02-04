dotfiles
========

Currently using Zshell with Prezto.

```bash
cd ~
git clone git@github.com:tahb/dotfiles.git
```

## Install

### Install brew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

or <https://brew.sh>

### Install git

```
brew install git
```

### Run Brew bundle

```
brew tap homebrew/bundle
brew bundle
```

### [Install Prezto for Zsh](https://github.com/sorin-ionescu/prezto#installation)

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

Set up symlinks

```
~/dotfiles/makesymlinks.sh
```

## Optional

## Offline variables

- Add sensitive or machine specific variables into `~/dotfiles/.profile`
