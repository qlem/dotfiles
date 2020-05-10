#!/bin/bash

item1='lock'
item2='logout'
item3='suspend'
item4='hibernate'
item5='reboot'
item6='shut down'

sel=$(echo -e "$item1\n$item2\n$item3\n$item4\n$item5\n$item6" | dmenu -p 'Session' -i "$@")
if [[ $sel == "$item1" ]]; then
    lock.sh
elif [[ $sel == "$item2" ]]; then
    pkill -SIGTERM spectrwm
elif [[ $sel == "$item3" ]]; then
    systemctl suspend
elif [[ $sel == "$item4" ]]; then
    systemctl hibernate
elif [[ $sel == "$item5" ]]; then
    systemctl reboot
elif [[ $sel == "$item6" ]]; then
    systemctl poweroff
fi
