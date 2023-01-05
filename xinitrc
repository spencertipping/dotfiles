#!/bin/sh
openbox &
wm_pid=$!

init_session() {
  xset r rate 150 60
  xrdb ~/.Xresources
  feh --bg-fill ~/r/env/bgi
  xcompmgr &
  ibus-daemon -rdx &

  case `hostname` in
  iota|ijen)
    ~/r/env/touchpad
    ~/r/env/battery-limits
    conky &
    wmctrl -s 23
    wifi 35
    sudo wg-quick up wg0
    ;;

  iniidae)
    # Work around Lenovo's pathological End/Insert key overloading on the X250
    xmodmap -e 'keycode 118 = End'

    # Fix screen colors, unscientifically
    # xgamma -rgamma 1.2 -ggamma 1.2 -bgamma 1.5

    xrandr --output eDP-1 --off
    xrandr --output HDMI-1 --primary --rotate left

    # No DPMS: display should always be running
    xset dpms 0 0 0
    xset s off
    xset -dpms
    ;;

  *)
    echo "got unknown hostname $HOSTNAME"
    ;;
  esac

  setlayout 0 10 10 0
}

sleep 2 && init_session

wait $wm_pid

# NOTE:
# suggested changes from https://bbs.archlinux.org/viewtopic.php?id=265880:
# exec openbox-session at the end, (sleep 2 && init_session) & async
