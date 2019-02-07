#!/bin/bash
[ -z "$PS1" ] && return

hat_identity() { :; }
hat_observe()  { :; }

[[ -d ~/.bash ]] || git clone git://github.com/spencertipping/dotbash ~/.bash

source ~/.bash/init

export GPG_TTY=`tty`

# Source any machine-specific aliases if we have them
[[ -e ~/.bash_aliases ]] && source ~/.bash_aliases

alias pd='rlwrap perl -de1'

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

# ni configuration
export NI_ROW_SORT_BUFFER=1024M
export NI_ROW_SORT_COMPRESS=gzip
export NI_ROW_SORT_PARALLEL=`cat /proc/cpuinfo | grep vendor_id | wc -l`

export GNUTERM=wxt

export LC_ALL=${LC_ALL:-C.UTF-8}

# Screenshot helpers
ss_here() {
  filename=`xsel -b`
  destname=`uuid`."${filename##*.}"
  cp "$filename" "./$destname"
  echo "./$destname"
}

# The world is not prepared for urxvt. Tell them we're an xterm variant instead.
if [[ "${TERM/rxvt-unicode/}" != "$TERM" ]]; then
  export TERM='xterm-color'
fi

if test -e ~/.dir_colors && which dircolors >& /dev/null; then
  eval $(dircolors ~/.dir_colors)
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

[[ $PWD == $HOME && -d $HOME/r ]] && cd $HOME/r

true
