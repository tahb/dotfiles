# Path to your oh-my-zsh configuration.
ZSH="$HOME/.oh-my-zsh"

### Theme
ZSH_THEME="miloshadzic"

### Load path
export PATH="/bin:/usr/sbin:/usr/local/bin:/usr/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/heroku/bin:${PATH}"

export SITES="~/sites"

### Ruby build environment
eval "$(rbenv init -)"

### Fig build environment
type boot2docker >/dev/null 2>&1 && $(boot2docker shellinit 2>/dev/null)

### Aliases ##

# ZSH
#alias vim='nocorrect vim' 
#alias git='nocorrect git' 
#alias rspec='nocorrect rspec'
unsetopt correct

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias l="ls -lah"
alias ~="cd ~"
alias sites="cd $SITES"
alias cnp="cd $SITES/clientsandprojects"
alias prio="cd $SITES/tools/priotal"
alias cardprinter="cd $SITES/tools/gds_pivotal_card_printer"
alias honcho="cd $SITES/honcho"
alias tvh-web="cd $SITES/tvh/ocs"
alias tvh-api="cd $SITES/tvh/api"
alias tvh-pay="cd $SITES/tvh/pay"

# Git
alias gcd="git checkout develop"
alias gcp="git checkout production"
alias gcma="git checkout master"
alias gl="git pull --prune"
alias gc="git commit"
alias unstage="git reset --hard"
alias unstage-commit="git reset --soft HEAD~1"

alias gpps="git push cha-stage develop:master; git push tvh-stage develop:master"
alias gppm="git push cha-prod; git push tvh-prod"

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
alias tvh-pay-sidekiq="bundle exec sidekiq -q high,3 -q medium,2 -q low,1 -c 6"

alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# Custom plugins
plugins=(git textmate brew osx heroku)

source $ZSH/oh-my-zsh.sh

VISUAL="vim"
EDITOR="vi"


export TINYTDS_FREETDS_VERSION="current"
export TINYTDS_ICONV_VERSION="1.13.1"
