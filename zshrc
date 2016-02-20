# Source of magic
export PATH="$HOME/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/local/heroku/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$GOPATH/bin"
export SITES="~/sites"

# Overrides
## Changing directory will automatically list contents
chpwd() {
 ls -lrthG
}

# Aliases
alias aliases="vim ~/dotfiles/zsh/aliases"

# Source ZShell files
source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/.profile

# Prezto zshrc configuration
if [[ -s "${ZDOTDIR:-$HOME/dotfiles}/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME/dotfiles}/prezto/init.zsh"
fi

# Ruby build environment
eval "$(rbenv init -)"

# Edit with these!
VISUAL="vim"
EDITOR="vi"

