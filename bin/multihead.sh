#!/bin/sh

edp=eDP-1
dp=DP-2
hdmi=HDMI-1

if [[ -n $(xrandr | grep "$dp2 connected") ]]; then
    xrandr --output $edp --primary --auto --output $dp --right-of $edp --auto 
elif [[ -n $(xrandr | grep "$hdmi connected") ]]; then
    xrandr --output $edp --primary --auto --output $hdmi --right-of $edp --auto
else 
    xrandr --output $edp --primary --auto --output $dp --off --output $hdmi --off
fi
$HOME/bin/wallpaper.sh
