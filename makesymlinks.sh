#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim zlogin zlogout zpreztor zprofile zshenv zprezto zpreztorc" # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

## Create prezto configration symlinks in $HOME
setopt EXTENDED_GLOB

install_zsh () {

# Add in the new zshell symlinks
for rcfile in "${ZDOTDIR:-$HOME/dotfiles}"/prezto/runcoms/*; do
  # Don't overwrite our zshrc file
  if [ "$rcfile:t" != "README.md" ] && [ "$rcfile:t" != "zshrc" ]; then
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  fi
done

# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my prezto repository
    git clone --recursive https://github.com/tomhipkin/prezto.git "${ZDOTDIR:-$HOME/dotfiles}/prezto"

    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s /bin/zsh
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh
