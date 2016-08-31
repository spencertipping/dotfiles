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
            RBCornerButton=0
  xrdb ~/.Xresources
  lxsession &
  xcompmgr &
  conky &
  redshift -l 35.194134:-106.481888 -t 6500:4100
  pulseaudio --start

  [[ -x ~/bin/mdb ]] && ~/bin/mdb nm7
}

sleep 2 && init_session

wait $wm_pid
