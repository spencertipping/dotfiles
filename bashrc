#!/bin/bash
[ -z "$PS1" ] && return

hat_identity() { :; }
hat_observe()  { :; }

source ~/.bash/init

# Source any machine-specific aliases if we have them
[[ -e ~/.bash_aliases ]] && source ~/.bash_aliases

alias pd='rlwrap perl -de1'
alias em='emacs -nw'

# If we don't have a DISPLAY already, set it to :0
# (in practice this happens if you don't have bashrc-xpra and you're sshing
# somewhere without -X)
export DISPLAY=${DISPLAY:-:0}

shopt -s checkwinsize extglob

umask 022

export NODE_PATH="$HOME/.node:$NODE_PATH"

# Environment variables
export VISUAL="/usr/bin/vim"
export EDITOR=$VISUAL
export PS1='\[\033[1;32m\]\h\[\033[1;30m\]\W\[\033[0;0m\] '

export GNUTERM=wxt

export LC_ALL=${LC_ALL:-C.UTF-8}

if [[ $TERM == 'xterm' ]]; then
  export TERM='xterm-color'
fi

if test -e ~/.dir_colors && which dircolors >& /dev/null; then
  eval $(dircolors ~/.dir_colors)
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

[[ $PWD == $HOME && -d $HOME/r ]] && cd $HOME/r

true
