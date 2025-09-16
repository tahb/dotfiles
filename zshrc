# Paths
export PATH="/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/opt:$PATH"

export PATH="$PATH:$HOME/.jenv/bin"
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/opt/homebrew/opt/openjdk@17/bin:/opt/homebrew/opt/openjdk@21/bin"
export PATH="$PATH/.local/bin:$PATH"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export GOPATH="$HOME/go"
export PATH="$HOME/.goenv/shims:$PATH"

# Ensure PATH includes GOPATH/bin
# export PATH="$PATH:$GOPATH/bin"

# Environment variables
export KOTLIN_HOME="/usr/local/bin/kotlin"
export SITES="~/sites"
export GPG_TTY=$(tty)
export PATH="$PATH:$KOTLIN_HOME/bin"
GEM_PATH="vendor/bundle"

# Initializations
eval "$(nodenv init -)"
# eval "$(jenv init -)"
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(direnv hook zsh)"

# Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Remove default config
rm -rf $HOME/Library/Application Support/com.mitchellh.ghostty/config
rm -rf $HOME/Library/Applications/AeroSpace.app/Contents/Resources/default-config.toml

eval "$(oh-my-posh init zsh --config $HOME/dotfiles/oh-my-posh/zen.toml)"


# Enable completions
autoload -Uz compinit
compinit

# Completion options
setopt auto_menu          # Show completion menu on tab
setopt always_to_end      # Move cursor to end if word had one match
setopt complete_in_word   # Complete from both ends of a word
setopt flow_control       # Enable flow control
setopt menu_complete      # Select first completion immediately
setopt INC_APPEND_HISTORY # Append to shell history immediately
setopt SHARE_HISTORY      # Append to shell history immediately
# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Disable flow control to enable Ctrl+S for forward search
stty -ixon

# Enable history search with Ctrl+R (reverse search)
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey -e

setopt auto_cd

# Function to list contents when changing directory
chpwd() {
 ls -lrthG
}

# Aliases
alias aliases="vim ~/dotfiles/zsh/aliases"

# Source ZShell files
source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/.profile

# Source ZPrezto init file if it exists
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

# Editors
VISUAL="vim"
EDITOR="vi"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/thipkin/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
