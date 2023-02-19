
alias ls='ls -G '
alias ll='ls -la '

alias ed='emacs --daemon'
alias killemacs="emacsclient -e '(kill-emacs)'"

alias pd="pushd"
alias pop="popd"
alias lookfor="history | grep"

alias be='bundle exec '
alias bi='bundle install '
alias bu='bundle update '

alias serveit='python -m SimpleHTTPServer '
alias servit='serveit'

alias simulator_android='/Users/jon/Library/Android/sdk/tools/emulator -netdelay none -netspeed full -avd Nexus_5_API_21_x86'
alias simulator_ipad='xcrun instruments -w "iPad Air 2"'
alias simulator_iphone='xcrun instruments -w "iPhone 6s Plus"'

alias dc="docker-compose"

function ec() {
    emacsclient -c -a="" $* &!
}

alias dcr="docker-compose run app $*"
alias dcm="docker-compose run app ./manage.py $*"
alias dce="docker-compose exec app $*"
alias dcem="docker-compose exec app ./manage.py $*"
