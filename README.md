dotfiles
========

## Install

Clone into home
```bash
git clone --recursive git://github.com/hippers/dotfiles.git
```

Make the script executable and run it:
```bash
cd ~/dotfiles
chmod +x makesymlinks.sh
./makesymlinks.sh
```

## Configuration outside Git
- Add machine specific variables into `~/dotfiles/.profile`


Install zprezto without submodule:
```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/dotfiles/.zprezto"
```
