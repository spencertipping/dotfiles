#!/bin/bash
[ -z "$PS1" ] && return

hat_identity() { :; }
hat_observe()  { :; }

[[ -d ~/.bash ]] || git clone git://github.com/spencertipping/dotbash ~/.bash

source ~/.bash/init

export GPG_TTY=`tty`

# Source any machine-specific aliases if we have them
[[ -e ~/.bash_aliases ]] && source ~/.bash_aliases

alias em='emacs -nw'
alias en='emacsclient -nw'
alias pd='rlwrap perl -de1'

alias vbg='xwinwrap -s -fs -b -nf -ov -- mplayer -wid WID'

# If we don't have a DISPLAY already, set it to :0
# (in practice this happens if you don't have bashrc-xpra and you're sshing
# somewhere without -X)
export DISPLAY=${DISPLAY:-:0}

shopt -s checkwinsize extglob

umask 022

export NODE_PATH="$HOME/.node:$NODE_PATH"
export PATH="$PATH:$HOME/.npm-global/bin"

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

screen-record() {
  ffmpeg -thread_queue_size 512 -s 3840x2160 -f x11grab -r 15 -i :0.0 \
         -thread_queue_size 512 -f pulse -i default \
         -c:v libx264 -c:a libvorbis \
         -b:v 12000k -b:a 256k -preset veryfast \
         -f matroska "${1:--}"
}

# The world is unprepared for colorful RXVT. Reduce it to just regular URXVT.
#if [[ "$TERM" = rxvt-unicode-256color ]]; then
#  export TERM='rxvt-unicode'
#fi

# Baby monitor
babymon() {
  ssh $1 'arecord -f cd -t raw -' \
    | play -e signed-integer -b 16 -L -c 2 -r 44100 -t raw - \
           compand .01,.01 -inf,-40,-inf,-40,-40 0 -90 .1
}

case $HOSTNAME in
iota)
  export GDK_SCALE=2
  export QT_SCALE_FACTOR=2
  ;;
esac

# Enable nix if we have it
[[ -e ~/.nix-profile/etc/profile.d/nix.sh ]] && . ~/.nix-profile/etc/profile.d/nix.sh

[[ $PWD == $HOME && -d $HOME/r ]] && cd $HOME/r

true
