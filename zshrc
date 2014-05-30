# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="miloshadzic"

# Path variable
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:$PATH'

# Ruby build environment
eval "$(rbenv init -)"

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls -lah'           
alias gcd="git checkout develop"
alias gcp="git checkout production"
alias gcma="git checkout master"
alias z="zeus test spec"
alias ~="cd ~"
alias unstage="git reset --hard"
alias rake="noglob rake"

# Internal
alias cnp='cd ~/sites/clientsandprojects'
alias prio='cd ~/sites/tools/priotal'
alias cardprinter='cd ~/sites/tools/gds_pivotal_card_printer'
alias honcho='cd ~/sites/honcho'

# Client
alias ocs="cd ~/sites/tvh/ocs"
alias ocsm="cd ~/sites/tvh/ocs-middleware"
alias padstart="tsocks bundle exec padrino start -p 3003 -e development"
alias padstartp="tsocks bundle exec padrino start -p 3003 -e production"
alias testcon="tsocks bundle exec rspec --tag type:connection"
alias sidekiqplz="tsocks sidekiq -C ./config/sidekiq.yml -r ./config/boot.rb"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate brew osx heroku)

source $ZSH/oh-my-zsh.sh

VISUAL="vim"
EDITOR="vi"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
