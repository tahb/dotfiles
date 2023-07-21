# Path
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/opt:$PATH
export PATH="$PATH:/Users/tomh/sites/ministry_of_justice/hmpps-approved-premises-tools/bin"
export PATH="$PATH:/Users/tomh/sites/dxw/dalmatian-tools/bin"
# export PATH="$HOME/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:$GOPATH/bin"

export KOTLIN_HOME=/usr/local/bin/kotlin
export PATH=$PATH:$KOTLIN_HOME/bin

# Heroku command line tool
# export PATH=$PATH:/usr/local/heroku/bin

# Postgres App
# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# PhantomJS
# export PATH=$PATH:/tmp/phantomjs

#CAS3
export PATH=$PATH:/Users/tomhipkin/sites/ministry_of_justice/hmpps-approved-premises-tools/bin

# rbenv
export PATH=$PATH:$HOME/.rbenv/bin

# Dalmatian
# export PATH=$PATH:$HOME/sites/dxw/dalmatian-tools/bin

# VSCODE
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

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
GEM_PATH=vendor/bundle

# Node build environment
eval "$(nodenv init -)"

# Direnv
eval "$(direnv hook zsh)"

# Edit with these!
VISUAL="vim"
EDITOR="vi"

#export PATH="$HOME/.local/bin:$PATH"
# export PYSPARK_DRIVER_PYTHON=jupyter
# export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
# export PYSPARK_PYTHON=python3
# export PATH=$SPARK_HOME:$PATH:~/.local/bin:$JAVA_HOME/bin:$JAVA_HOME/jre/bin

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
