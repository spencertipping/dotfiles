#!/bin/sh
openbox &
wm_pid=$!

init_session() {
  xset r rate 150 60
  xrdb ~/.Xresources
  feh --bg-fill ~/r/env/bg.jpg
  xcompmgr &

  case `hostname` in
  iniidae)
    # Work around Lenovo's pathological End/Insert key overloading on the X250
    xmodmap -e 'keycode 118 = End'

    # Fix screen colors, unscientifically
    xgamma -rgamma 1.2 -ggamma 1.2 -bgamma 1.5

    xrandr --output eDP-1 --off
    xrandr --output HDMI-1 --primary --rotate left
    ;;

  *)
    echo "got unknown hostname $HOSTNAME"
    ;;
  esac

  setlayout 0 10 10 0
}

sleep 2 && init_session

wait $wm_pid
