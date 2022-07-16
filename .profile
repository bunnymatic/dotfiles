alias ls='ls -G '
alias ll='ls -la '

export UNAME=`uname`

alias ed='emacs --daemon'
alias ec='emacsclient -c -a=""'
alias killemacs="emacsclient -e '(kill-emacs)'"

alias gs='git status'
alias pd="pushd"
alias pop="popd"
alias lookfor="history | grep"
alias js="java -jar ~/utils/rhino/js.jar"
alias jslint="jsl -process"

alias be='bundle exec '
alias bi='bundle install '
alias bu='bundle update '

alias serveit='python3 -m http.server '
alias servit='serveit'

alias simulator_android='/Users/jon/Library/Android/sdk/tools/emulator -netdelay none -netspeed full -avd Nexus_5_API_21_x86'
alias simulator_ipad='xcrun instruments -w "iPad Air 2"'
alias simulator_iphone='xcrun instruments -w "iPhone 6s Plus"'

alias dc='docker-compose'
alias dcr='docker-compose run --rm app'
alias dcm='docker-compose run --rm app ./manage.py'

alias xcode='/Applications/Xcode.app/Contents/MacOS/Xcode'
#alias simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'
alias gw='./gradlew'

foremandev() {
    foreman "$1" -f Procfile.dev
}

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# run this after we set local/bin on path
eval "$(rbenv init -)"

export MANPATH=$MANPATH:/usr/local/man
#export PG_USER=jon
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls:fg:bg:history'
export PHANTOMJS_BIN=`which phantomjs`
export LESS=R

smbip() {
    smbutil lookup $1 | head -1 | ruby -nle 'puts $_.split.last;'
}

find_git_branch() {
    # Based on: http://stackoverflow.com/a/13003854/170413
    local branch
    if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
        if [[ "$branch" == "HEAD" ]]; then
            branch='detached*'
        fi
        git_branch="($branch)"
    else
        git_branch=""
    fi
}

find_git_dirty() {
    local status=$(git status --porcelain 2> /dev/null)
    if [[ "$status" != "" ]]; then
        git_dirty='*'
    else
        git_dirty=''
    fi
}

whodunit() {
    git ls-tree --name-only -z -r HEAD -- $1 | xargs -0 -n1 git blame --line-porcelain | grep "^author "|sort|uniq -c|sort -nr
}

sourceit() {
    f=$1
    [ -f $f ] && source $f
}

PROMPT_COMMAND="find_git_branch; find_git_dirty; $PROMPT_COMMAND"
#\$git_dirty
export PS1="\h:\W \$git_branch (\!)$ "

#if [ -f `which hub` ]; then
## alias git='hub'
#fi

sourceit /usr/local/etc/bash_completion

for script in ~/bash_completions/completion-*[^~]; do
    sourceit $script
done

sourceit /usr/local/git/contrib/completion/git-completion.bash
sourceit /usr/local/etc/bash_completion.d/git-completion.bash

export EDITOR=/usr/bin/vi

PROJECTS=/projects/
[[ -d ~/projects/ ]] && PROJECTS=~/projects/

export AAM=${PROJECTS}/asian
export ACAD=${PROJECTS}/autocad360-web/
export ALLOCATIONS=${PROJECTS}/allocations
export AM=${PROJECTS}/anson_mills
export ANDROID_HOME=${PROJECTS}/android-sdk-macosx/
export APSVC=${GAP}/allocation-fulfillment-service
export ASIAN=${PROJECTS}/asian
export AWEB=${GAP}/allocation-web
export BAPI=${PROJECTS}/bunnymatic-api
export BAR=${PROJECTS}/barista
export BEND=${PROJECTS}/bendable
export BOOK=${GAP}/booking-manager
export BOOKUI=${GAP}/booking-manager-ui
export BRESBO=${PROJECTS}/bresbo
export CATSVC=${GAP}/allocation-catalog-service
export CM=${PROJECTS}/clearmetal
export COG=${PROJECTS}/cognoa
export CTA=${PROJECTS}/cta
export DORO=${PROJECTS}/doro
export DREAM=${PROJECTS}/dream_team/DREAMassets/
export E1890=${PROJECTS}/1890web/
export FAUX=${PROJECTS}/fauxtaux_booth
export FIS=${PROJECTS}/sharespost/sharex-fis
export GAP=${PROJECTS}/gap
export GLUEBOT=${PROJECTS}/gluebot
export GOPATH=${PROJECTS}/goprojects
export HABIT=${PROJECTS}/papaya
export HAZL=/scratch/eventserver/hazl/
export HM=${PROJECTS}/harrison-metal
export HOOD=${PROJECTS}/hood
export KABLAMMO=${PROJECTS}/kablammo
export KO=${PROJECTS}/kohala
export KU=${PROJECTS}/kuju
export LT=${PROJECTS}/localtakesf
export MANDIBLE=${PROJECTS}/mandible
export MANGO=${PROJECTS}/mango
export MAU=${PROJECTS}/mau
export NEON=${PROJECTS}/tr/1p-frontend-new/1p-frontend-webapp
export NETPERF=${PROJECTS}/net_performance_monitor
export PAPAYA=${PROJECTS}/papaya
export PLASTIQ=${PROJECTS}/plastiq/gemini
export PATENT=${PROJECTS}/patent-scraper
export QR=${PROJECTS}/qr4r
export ROMEY=${PROJECTS}/romeydesigns
export SC=${PROJECTS}/selectorschoice
export SEARCHER=${PROJECTS}/elasticsearcher
export SHAGOREX=${PROJECTS}/sharespost/shagorex
export SNAPSHOT=${PROJECTS}/snapshot
export SP=${PROJECTS}/sharespost/sharex
export SPRY=${PROJECTS}/autodesk-spry
export TIMESHEET=${PROJECTS}/timesheet
export TISVC=${GAP}/target-inventory-service
export TRWEB=${PROJECTS}/tr/tr-webui
export WORTHI=${PROJECTS}/worthi
export ZINE=${PROJECTS}/c5-zine

export PLASTIQ_GEMINI_DIR=${PROJECTS}/plastiq/gemini
export PLASTIQ=${PROJECTS}/plastiq/gemini

export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Users/jon/utils:/Users/jon/utils/perl
export PATH=./.git/safe/../../bin/:./.git/safe/../../node_modules/.bin/:${PATH}
export PATH=$PATH:~/.mix/escripts/
export PATH="${PROJECTS}/android-sdk-macosx/tools:$PATH"
export PATH="${PROJECTS}/android-sdk-macosx/platform-tools:$PATH"
export PATH="${PROJECTS}/android-sdk-macosx/build-tools/19.0.2:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export MANPATH=$MANPATH:/usr/local/man
#export PG_USER=jon
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls:fg:bg:history'
export PHANTOMJS_BIN=`which phantomjs`

export GOPATH=${PROJECTS}/goprojects


export GIT_SSL_NO_VERIFY=true

export INCLUDE_PRY=1

export JAVA_HOME=`/usr/libexec/java_home`
# for oracle
export DYLD_LIBRARY_PATH=/usr/local/instantclient_11_2:$DYLD_LIBRARY_PATH

# BEGIN Ruboto setup
sourceit ~/.rubotorc
# END Ruboto setup

setup_pair() {
    name="$1 & $2"
    em="$1+$2+dev@carbonfive.com"
    em2=`echo ${em// /_}`
    email=`echo $em2 | awk '{print tolower($0)}'`
    echo "export GIT_AUTHOR_NAME=\"$name\""
    export GIT_AUTHOR_NAME=$name
    export GIT_AUTHOR_EMAIL=$email
}


# The next line updates PATH for the Google Cloud SDK.
GOOGLE_CLOUD_SDK_DIR=~/google-cloud-sdk

sourceit "${GOOGLE_CLOUD_SDK_DIR}/path.bash.inc" ]
sourceit "${GOOGLE_CLOUD_SDK_DIR}/completion.bash.inc" ]

export CLICOLOR=1

export GIT_DUET_CO_AUTHORED_BY=1

gl () {
  paste -d' ' <(git log --color --pretty=format:'%ai' "$@") <(git log --color --oneline --decorate "$@")
}

export PATH="$HOME/.cargo/bin:$PATH"

if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

export PYENV_ROOT=~/.pyenv/bin
export PATH=$PYENV_ROOT:$PATH

if command -v pyenv 1>/dev/null 2>&1; then
  echo 'Init pyenv'
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
