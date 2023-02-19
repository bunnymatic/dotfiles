export MANPATH=$MANPATH:/usr/local/man
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls:fg:bg:history'
export PHANTOMJS_BIN=`which phantomjs`
export EDITOR=/usr/bin/vi
PROJECTS=/projects/
[[ -d ~/projects/ ]] && PROJECTS=~/projects/

export BAPI=${PROJECTS}/bunnymatic-api
export BRESBO=${PROJECTS}/bresbo
export LT=${PROJECTS}/localtakesf
export MAU=${PROJECTS}/mau
export SC=${PROJECTS}/selectorschoice
export ZINE=${PROJECTS}/c5-zine

export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Users/jon/utils:/Users/jon/utils/perl
export PATH=./.git/safe/../../bin/:./.git/safe/../../node_modules/.bin/:${PATH}
export PATH=$PATH:~/.mix/escripts/
export PATH="$HOME/.cargo/bin:$PATH"
export CLICOLOR=1
export GIT_DUET_CO_AUTHORED_BY=1
export PYENV_ROOT=~/.pyenv/bin
export PATH=$PYENV_ROOT:$PATH

unsetopt HIST_VERIFY

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

