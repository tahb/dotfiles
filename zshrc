# Source of magic
export PATH="$HOME/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/local/heroku/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims"
export SITES="~/sites"

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Overrides
chpwd() {
 ls -lrthG
}

# Load in aliases
alias aliases="vim ~/dotfiles/zsh/aliases"

type boot2docker >/dev/null 2>&1 && $(boot2docker shellinit 2>/dev/null)

### Boot2docker VM
type boot2docker >/dev/null 2>&1 && $(boot2docker shellinit 2>/dev/null)

source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/.profile

# Ruby build environment
eval "$(rbenv init -)"
#
# Edit with these!
VISUAL="vim"
EDITOR="vi"
