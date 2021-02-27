set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

set -U ASIAN /projects/asian

set -x RBENV_SHELL fish

set -x PATH "~/.rbenv/bin" $PATH
#. (rbenv init - | psub)

# TODO - move these aliases (from bash) to functions for fish
#alias pd="pushd"
#alias pop="popd"
#alias lookfor="history | grep"
#alias js="java -jar ~/utils/rhino/js.jar"
#alias svnchanged='svn status | egrep "^\ M\ |^M\ " |  cut -c8-'
#alias jslint="jsl -process"
#alias be='bundle exec '
#alias ber='bundle exec rake'
#alias bi='bundle install '
#alias bu='bundle update '
#alias serveit='python -m SimpleHTTPServer '
#alias servit='serveit'
#alias subl='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2'
