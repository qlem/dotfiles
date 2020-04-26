#!/bin/bash

dp=DP-2
hdmi=HDMI-1
primary=eDP-1
item1='DP [on]'
item2='DP [off]'
item3='HDMI [on]'
item4='HDMI [off]'

sel=$(echo -e "$item1\n$item2\n$item3\n$item4" | dmenu -p 'Ext. screen' -i "$@")
if [[ $sel == "$item1" ]]; then
    xrandr --output $dp --auto --right-of $primary && wallpaper.sh
elif [[ $sel == "$item2" ]]; then
    xrandr --output $dp --off && wallpaper.sh
elif [[ $sel == "$item3" ]]; then
    xrandr --output $hdmi --auto --right-of $primary && wallpaper.sh
elif [[ $sel == "$item4" ]]; then
    xrandr --output $hdmi --off && wallpaper.sh
fi
