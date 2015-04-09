# Path to your oh-my-zsh configuration.
ZSH="$HOME/.oh-my-zsh"

### Theme
ZSH_THEME="miloshadzic"

# Show contents of directory after cd-ing into it
chpwd() {
  ls -lrthG
}

### Load path
export PATH="$HOME/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/local/heroku/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims"

export SITES="~/sites"

### Ruby build environment
eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/zsh/aliases

# Custom plugins
plugins=(git textmate brew osx heroku)

VISUAL="vim"
EDITOR="vi"
