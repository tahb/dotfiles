# Paths
export PATH="/usr/local/bin:/opt/homebrew/opt:$PATH"
export PATH="$PATH:/Users/tomh/sites/ministry_of_justice/hmpps-approved-premises-tools/bin"
export PATH="$PATH:/Users/tomh/sites/dxw/dalmatian-tools/bin"
export PATH="$PATH:$HOME/.jenv/bin"
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/opt/homebrew/opt/openjdk@17/bin:/opt/homebrew/opt/openjdk@21/bin"

export PATH=$PATH:${HOME}/govuk/govuk-docker/exe

# Environment variables
export KOTLIN_HOME="/usr/local/bin/kotlin"
export SITES="~/sites"
export GPG_TTY=$(tty)
export PATH="$PATH:$KOTLIN_HOME/bin"
GEM_PATH="vendor/bundle"

# Initializations
eval "$(nodenv init -)"
eval "$(jenv init -)"
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(direnv hook zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

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
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Editors
VISUAL="vim"
EDITOR="vi"
