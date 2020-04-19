#!/bin/bash

item_1='lock'
item_2='logout'
item_3='suspend'
item_4='hibernate'
item_5='reboot'
item_6='shut down'

sel=$(echo -e "$item_1\n$item_2\n$item_3\n$item_4\n$item_5\n$item_6" | dmenu -p 'Session' -i "$@")
if [[ $sel == "$item_1" ]]; then
    lock.sh
elif [[ $sel == "$item_2" ]]; then
    killall -SIGUSR1 spectrwm
elif [[ $sel == "$item_3" ]]; then
    systemctl suspend
elif [[ $sel == "$item_4" ]]; then
    systemctl hibernate
elif [[ $sel == "$item_5" ]]; then
    systemctl reboot
elif [[ $sel == "$item_6" ]]; then
    systemctl poweroff
fi
