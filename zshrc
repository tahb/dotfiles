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

# Boot2docker VM
type boot2docker >/dev/null 2>&1 && $(boot2docker shellinit 2>/dev/null)

# Source ZShell files
source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/.profile

# Source prezto

## Create prezto configration files in $HOME

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME/dotfiles}"/.zprezto/runcoms/*; do
  # Don't overwrite our zshrc file
  if [ "$rcfile:t" != "README.md" ] && [ "$rcfile:t" != "zshrc" ]; then
    # Only symlink if it's not currently in place
    # Damn you Bash.
    if [ -f "${ZDOTDIR:-$HOME}/.${rcfile:t}" ]; then
    else
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    fi
  fi
done

# Prezto zshrc configuration
if [[ -s "${ZDOTDIR:-$HOME/dotfiles}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME/dotfiles}/.zprezto/init.zsh"
fi

# Ruby build environment
eval "$(rbenv init -)"

# Edit with these!
VISUAL="vim"
EDITOR="vi"

