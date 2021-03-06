# Path
export PATH="$HOME/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:$GOPATH/bin"

# Heroku command line tool
export PATH=$PATH:/usr/local/heroku/bin

# Postgres App
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# PhantomJS
export PATH=$PATH:/tmp/phantomjs

export SITES="~/sites"

# Allow GPG to sign Git commits https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

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

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Ruby build environment
eval "$(rbenv init -)"

# Edit with these!
VISUAL="vim"
EDITOR="vi"
