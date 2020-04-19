#!/bin/bash

dp=DP-2
hdmi=HDMI-1
primary=eDP-1
item_1='DP [on]'
item_2='DP [off]'
item_3='HDMI [on]'
item_4='HDMI [off]'

sel=$(echo -e "$item_1\n$item_2\n$item_3\n$item_4" | dmenu -p 'Ext. screen' -i "$@")
if [[ $sel == "$item_1" ]]; then
    xrandr --output $dp --auto --right-of $primary && wallpaper.sh
elif [[ $sel == "$item_2" ]]; then
    xrandr --output $dp --off && wallpaper.sh
elif [[ $sel == "$item_3" ]]; then
    xrandr --output $hdmi --auto --right-of $primary && wallpaper.sh
elif [[ $sel == "$item_4" ]]; then
    xrandr --output $hdmi --off && wallpaper.sh
fi
