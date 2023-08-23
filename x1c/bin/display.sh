#!/bin/bash

dp=DP-1
primary=HDMI-1
item1='dp [on]'
item2='dp [off]'

sel=$(echo -e "$item1\n$item2\n$item3\n$item4" | dmenu -p 'Ext. screens' -i "$@")
if [[ $sel == "$item1" ]]; then
    xrandr --output $dp --auto --right-of $primary && wallpaper.sh
elif [[ $sel == "$item2" ]]; then
    xrandr --output $dp --off && wallpaper.sh
fi
