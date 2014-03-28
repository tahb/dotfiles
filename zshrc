# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# Path variable
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:$PATH'

# Ruby build environment
eval "$(rbenv init -)"

# Aliases
alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..'    # And for good measure
alias l='ls -lah'           # Long view, show hidden
alias gcd="git checkout develop"
alias gcp="git checkout production"
alias gcma="git checkout master"
alias z="zeus test spec"
alias ~="cd ~"
alias unstage="git reset --hard"
alias rake="noglob rake"

# DXW
alias cnp='cd ~/sites/clientsandprojects'

# TVH
alias ocs="cd ~/sites/ocs"
alias ocsm="cd ~/sites/ocs-middleware"
alias padstart="tsocks bundle exec padrino start -p 3003 -e development"
alias padstartp="tsocks bundle exec padrino start -p 3003 -e production"
alias testcon="tsocks bundle exec rspec --tag type:connection"
alias sidekiqplz="tsocks sidekiq -C ./config/sidekiq.yml -r ./config/boot.rb"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate brew osx)

source $ZSH/oh-my-zsh.sh

VISUAL="vim"
EDITOR="vi"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
