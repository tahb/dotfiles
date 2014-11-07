# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="miloshadzic"

# Ruby build environment
eval "$(rbenv init -)"

# Path variable
# export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:$PATH'
#export PATH='~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin'

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
alias unstage-commit="git reset --soft HEAD~1"
alias rake="noglob rake"
alias b="bundle"
alias be="bundle exec"
alias sites="cd ~/sites"
alias cnp='cd ~/sites/clientsandprojects'
alias prio='cd ~/sites/tools/priotal'
alias cardprinter='cd ~/sites/tools/gds_pivotal_card_printer'
alias honcho='cd ~/sites/honcho'

alias tvh-web="cd ~/sites/tvh/ocs"
alias tvh-api="cd ~/sites/tvh/api"
alias tvh-pay="cd ~/sites/tvh/pay"
alias testcon="tsocks bundle exec rspec --tag type:connection"
alias tvh-api-sidekiq="tsocks bundle exec sidekiq -q high,3 -q medium,2 -q low,1 -c 6 -C ./config/sidekiq.yml -r ./config/boot.rb"
alias tvh-web-sidekiq="bundle exec sidekiq -q high,3 -q medium,2 -q low,1 -c 6"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate brew osx heroku)

source $ZSH/oh-my-zsh.sh

VISUAL="vim"
EDITOR="vi"

export TINYTDS_FREETDS_VERSION="current"
export TINYTDS_ICONV_VERSION="1.13.1"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
