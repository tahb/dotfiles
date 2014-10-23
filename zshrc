# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="miloshadzic"

# Ruby build environment
eval "$(rbenv init -)"

# Path variable
# export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:$PATH'
export PATH='~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin'

## Aliases ##

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls -lah'
alias ~="cd ~"
alias sites="cd ~/sites"
alias cnp='cd ~/sites/clientsandprojects'
alias prio='cd ~/sites/tools/priotal'
alias cardprinter='cd ~/sites/tools/gds_pivotal_card_printer'
alias honcho='cd ~/sites/honcho'
alias tvh-web="cd ~/sites/tvh/ocs"
alias tvh-api="cd ~/sites/tvh/api"
alias tvh-pay="cd ~/sites/tvh/pay"

# Git
alias gcd="git checkout develop"
alias gcp="git checkout production"
alias gcma="git checkout master"
alias unstage="git reset --hard"
alias unstage-commit="git reset --soft HEAD~1"

# Bundler
alias b="bundle"
alias be="bundle exec"
alias rt="bundle exec rspec ."

# Rake
alias dbreset="rake db:drop db:create db:migrate db:test:prepare"
alias rake="noglob rake"

# Sidekiq
alias tvh-api-sidekiq="tsocks bundle exec sidekiq -C ./config/sidekiq.yml"
alias tvh-web-sidekiq="bundle exec sidekiq -q high,3 -q medium,2 -q low,1 -c 6"

# Custom plugins
plugins=(git textmate brew osx heroku)

source $ZSH/oh-my-zsh.sh

VISUAL="vim"
EDITOR="vi"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
