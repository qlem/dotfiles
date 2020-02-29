#!/bin/sh

edp=eDP-1
dp=DP-2
hdmi=HDMI-1
pos='--right-of'

if [[ $# -ge 1 ]] && [[ "$1" == 'left' ]]; then
    pos='--left-of'
fi

if [[ -n $(xrandr | grep "$dp2 connected") ]]; then
    xrandr --output $edp --primary --auto --output $dp $pos $edp --auto
elif [[ -n $(xrandr | grep "$hdmi connected") ]]; then
    xrandr --output $edp --primary --auto --output $hdmi $pos $edp --auto
else
    xrandr --output $edp --primary --auto --output $dp --off --output $hdmi --off
fi
$HOME/bin/wallpaper.sh
