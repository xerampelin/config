# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# History size... ITS OVER 9000!
HISTSIZE=9500
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignorespace:ignoredups
# append to the history file, don't overwrite it
shopt -s histappend
shopt -u interactive_comments

# BLACK="\[\033[0;30m\]"
# BLACKBOLD="\[\033[1;30m\]"
# RED="\[\033[0;31m\]"
# REDBOLD="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
# GREENBOLD="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
# YELLOWBOLD="\[\033[1;33m\]"
# BLUE="\[\033[0;34m\]"
# BLUEBOLD="\[\033[1;34m\]"
# PURPLE="\[\033[0;35m\]"
# PURPLEBOLD="\[\033[1;35m\]"
# CYAN="\[\033[0;36m\]"
# CYANBOLD="\[\033[1;36m\]"
# WHITE="\[\033[0;37m\]"
# WHITEBOLD="\[\033[1;37m\]"
RESET="\[\033[00m\]"
AUTOSARDIR="matlab/toolbox/rtw/targets/AUTOSAR/AUTOSAR"
AUTOSARTESTDIR="matlab/test/toolbox/rtw/targets/AUTOSAR/"

colorfularrows="$GREEN>$YELLOW>$GREEN>$YELLOW>$RESET"

PATH=/usr/local/go/bin:$PATH
PATH=$HOME/src/sh/:$PATH
PATH=$HOME/src/go/bin:$PATH
PATH=$HOME/.local/bin/:$PATH
PATH=$HOME/local/bin:$PATH
PATH=$HOME/bin:$PATH
#PATH=$HOME/Qt/Tools/QtCreator/bin:$PATH
PATH=$LOCALHOME/Qt/Tools/QtCreator/bin:$PATH
export PATH

export RECOLL_CONFDIR=$LOCALHOME/.recoll/
export PS1="$colorfularrows \u@\h [\t](\$?) \w\n\$ "
export EDITOR='gvim --nofork'
P4EDITOR='gvim --nofork'
export VISUAL='gvim --nofork'
export GIT_EDITOR="gvim --nofork"
export SBTOOLS_VNC_WINDOW_MGR=/usr/bin/openbox
export PYTHONPATH=~/local/lib/python2.7/site-packages/
export P4DIFF="diff -du"
export P4MERGE=p4merge

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias gvimr='gvim --remote'
alias gvim_diff='gvimdiff'
alias less='less -R'
alias gdb='EDITOR=gvimr gdb'
alias e='emacsclient -t'
alias ec='emacsclient -c'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

