#!/bin/bash
[ -z "$PS1" ] && return

# Source any machine-specific aliases if we have them
[[ -e ~/.bash_aliases ]] && source ~/.bash_aliases

# Extension time!
BASHRC_PREFIX=$HOME
we_have() { [[ -d $BASHRC_PREFIX/$1 ]]; }

if we_have bash-hats; then
  . $BASHRC_PREFIX/bash-hats/bash-hats
else
  hat_identity() { :; }
  hat_observe() { :; }
fi

if we_have bashrc-tmux; then
  . $BASHRC_PREFIX/bashrc-tmux/bashrc-tmux
  . $BASHRC_PREFIX/bashrc-tmux/bashrc-xpra
fi

if we_have cd; then
  CD_EXTENSIONS=(ssh aufs archive dev loop encfs git nfs history missing-mkdir)
  . $BASHRC_PREFIX/cd/cd
fi

if we_have bash-prompt; then
  . $BASHRC_PREFIX/bash-prompt/prompt
fi

# Defer bash-lambda loading until we really need it
if we_have bash-lambda; then
  bl() {
    . $BASHRC_PREFIX/bash-lambda/bash-lambda
    echo 'bash-lambda initialized'
  }
fi

# Docker stuff!
dr() {
  # Launch a "docker repl" using a Dockerfile whose command is /bin/bash.
  # Builds an untagged image and runs it with a transient TTY-enabled
  # container whose /data is mounted to the current directory. Also sets up an
  # X11 connection to the current host display, so the docker can run graphical
  # applications.

  XAUTH=/tmp/.docker.xauth${DISPLAY//:/.}
  [ -n "$DISPLAY" ] \
    && xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

  docker run -v $PWD:/data \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -v $XAUTH:$XAUTH \
             -e XAUTHORITY=$XAUTH \
             -e DISPLAY=$DISPLAY \
             --rm -it $(docker build -q .)
}

# If we don't have a DISPLAY already, set it to :0
# (in practice this happens if you don't have bashrc-xpra and you're sshing
# somewhere without -X)
export DISPLAY=${DISPLAY:-:0}

export HISTCONTROL=ignoredups:ignorespace
shopt -s checkwinsize extglob

umask 022

# Path extensions
export PATH="$PATH:$HOME/bin:."

export NODE_PATH="$HOME/.node:$NODE_PATH"

# Command aliases
alias ls='ls --color=auto'
alias ll='ls -ilh'
alias la='ls -a'
alias lst='ls -tr'
alias s='ls'

alias otr='history -c; export HISTIGNORE="*";'

alias gc='git commit -am'
alias gU='git push'
alias gu='git pull'
alias gs='git status'
alias gd='git diff'
alias gL='git log'

alias b='cd -'
alias bb='cd -2'
alias b2='cd -2'
alias b3='cd -3'
alias b4='cd -4'
alias u='cd ..'
alias uu='cd ../..'
alias u2='cd ../..'
alias u3='cd ../../..'
alias u4='cd ../../../..'
alias u5='cd ../../../../..'
alias u6='cd ../../../../../..'

# Environment variables
export VISUAL="/usr/bin/vim"
export EDITOR=$VISUAL
export PS1='\[\033[1;32m\]\h\[\033[1;30m\]\W\[\033[0;0m\] '

export NFU_ALWAYS_VERBOSE=yes
export NFU_SORT_BUFFER=$(( $(free -m | nfu -FSD1T1f1) / 8 ))M

if which lz4 >& /dev/null; then
  export NFU_SORT_COMPRESS=lz4
elif which lzop >& /dev/null; then
  export NFU_SORT_COMPRESS=lzop
else
  export NFU_SORT_COMPRESS=gzip
fi

export GNUTERM=wxt

export LC_ALL=${LC_ALL:-C}

if [[ $TERM == 'xterm' ]]; then
  export TERM='xterm-color'
fi

if test -e ~/.dir_colors && which dircolors >& /dev/null; then
  eval $(dircolors ~/.dir_colors)
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

[[ $PWD == $HOME && -d $HOME/r ]] && cd $HOME/r

true
