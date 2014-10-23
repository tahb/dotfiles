# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="miloshadzic"

export SITES="~/sites"

# Ruby build environment
eval "$(rbenv init -)"

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
alias gl='git pull --prune'
alias gc='git commit'
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

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Custom plugins
plugins=(git textmate brew osx heroku)

source $ZSH/oh-my-zsh.sh

VISUAL="vim"
EDITOR="vi"

### Load path
export PATH="/bin:/usr/local/bin:/usr/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/heroku/bin"


