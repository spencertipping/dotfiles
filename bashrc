#!/bin/bash
[[ $- == *i* ]] || return
#[ -t 0 ] || return

# exec 5> /tmp/bashlog
# PS4='+ $EPOCHREALTIME\011 '
# BASH_XTRACEFD=5
# set -x

hat_identity() { :; }
hat_observe()  { :; }

[[ -d ~/.bash ]] || git clone https://github.com/spencertipping/dotbash ~/.bash

[[ -d ~/.keys ]] && for f in ~/.keys/*; do
  source "$f"
done

source ~/.bash/init

export GPG_TTY=`tty`

# Source any machine-specific aliases if we have them
[[ -e ~/.bash_aliases ]] && source ~/.bash_aliases

alias em='emacs -nw'
alias en='emacsclient -nw'
alias pd='rlwrap perl -de1'

alias a='flatpak run org.gnome.gitlab.somas.Apostrophe'

# mplayer doesn't use VDPAU by default, so consumes far more CPU
# alias vbg='xwinwrap -s -fs -b -nf -ov -- mplayer -wid WID'
alias vbg='xwinwrap -s -fs -b -nf -ov -- cvlc --drawable-xid WID -I rc'

alias reset-palette='printf "\033]4;0;#abb0b6\007\033]4;1;#fa8d3e\007\033]4;2;#86c380\007\033]4;3;#e6b450\007\033]4;4;#5ccfe6\007\033]4;5;#f07178\007\033]4;6;#95e6cb\007\033]4;7;#626a73\007\033]4;8;#fafafa\007\033]4;9;#ffa759\007\033]4;10;#bae67e\007\033]4;11;#ffee99\007\033]4;12;#73d0ff\007\033]4;13;#ffa759\007\033]4;14;#95e6cb\007\033]4;15;#707a8c\007"'

# If we don't have a DISPLAY already, set it to :0
# (in practice this happens if you don't have bashrc-xpra and you're sshing
# somewhere without -X)
export DISPLAY=${DISPLAY:-:0}

shopt -s checkwinsize extglob

umask 022

export NODE_PATH="$HOME/.node:$NODE_PATH"
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.npm-global/bin:$HOME/.platformio/penv/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"

# Environment variables
export VISUAL="/usr/bin/vim"
export EDITOR=$VISUAL
export PS1='\[\033[1;32m\]\h\[\033[1;30m\]\W\[\033[0;0m\] '
export XMODIFIERS=@im=ibus

# ni configuration
export NI_DANGER_MODE=1   # makes ni more fun
if which zstd >&/dev/null; then
  export NI_ROW_SORT_COMPRESS=zstd
fi

export GNUTERM=wxt

export LC_ALL=${LC_ALL:-C.UTF-8}

screen-record() {
  ffmpeg -thread_queue_size 512 -s 3840x2160 -f x11grab -r 15 -i :0.0 \
         -thread_queue_size 512 -f pulse -i default \
         -c:v libx264 -c:a libvorbis \
         -b:v 12000k -b:a 256k -preset veryfast \
         -f matroska "${1:--}"
}

screen-record-2k() {
  ffmpeg -thread_queue_size 512 -s 3840x2160 -f x11grab -r 15 -i :0.0 \
         -thread_queue_size 512 -f pulse -i default \
         -c:v libx264 -c:a libvorbis \
         -b:v 6000k -b:a 256k -preset veryfast \
         -s 1920x1080 \
         -f matroska "${1:--}"
}

barrier-ijen() {
  barriers -a ijen.35 -c ~/.barrier.conf
}

barrier-iota() {
  barrierc ijen.35
}

barrier-iniidae() {
  barrierc ijen.35
}

xpra-4k() {
  xpra attach --no-keyboard-sync --opengl=off --ssh=ssh ssh://$1
}


mp3ify() {
  here="$(basename "$1")"
  ffmpeg -i "$1" -af loudnorm -c:a libmp3lame -b:a 320k \
         -map_metadata -1 -write_xing 0 "${here%.*}.mp3"
}

case $HOSTNAME in
iota|ijen)
  export GDK_SCALE=2
  export QT_SCALE_FACTOR=2
  ;;
esac

# Enable nix if we have it
[[ -e ~/.nix-profile/etc/profile.d/nix.sh ]] && . ~/.nix-profile/etc/profile.d/nix.sh

export EMSDK_QUIET=1
[[ -e /opt/emsdk/emsdk_env.sh ]] && . /opt/emsdk/emsdk_env.sh

[[ $PWD == $HOME && -d $HOME/r ]] && cd $HOME/r

# set +x

true
