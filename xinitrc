#!/bin/bash
openbox &
wm_pid=$!

init_session() {
  xset r rate 150 60
  setlayout 0 10 10 0
  synclient VertEdgeScroll=0 \
            VertTwoFingerScroll=1 \
            HorizTwoFingerScroll=1 \
            RTCornerButton=0 \
            RBCornerButton=0 \
            TouchpadOff=1
  xrdb ~/.Xresources
  xcompmgr &
  pulseaudio --start

  [[ -x ~/bin/mdb ]] && ~/bin/mdb jbn8I

  case $HOSTNAME in
  iniidae)
    # Work around Lenovo's pathological End/Insert key overloading on the X250
    xmodmap -e 'keycode 118 = End'

    # Fix screen colors, unscientifically
    xgamma -rgamma 1.2 -ggamma 1.2 -bgamma 1.5
    ;;
  esac
}

sleep 2 && init_session

wait $wm_pid
