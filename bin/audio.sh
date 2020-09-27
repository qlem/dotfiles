#!/bin/bash

export LC_ALL=C

inc=5
limit=150
notifID=999942
app='PulseAudio'
icon_up='notification-audio-volume-high'
icon_down='notification-audio-volume-medium'
icon_mute='notification-audio-volume-muted'
icon_unmute='notification-audio-volume-high'
# sink=$(pactl list sinks short | grep 'RUNNING' | awk '{print $2}')
sink='alsa_output.pci-0000_00_1f.3.analog-stereo'
volume=$(pactl list sinks | grep "Name: $sink" -A 7 | tail -n 1 | awk '{print $5}' | sed -E 's/%//g')

case "$1" in
    '--volume-up')
        if (( volume + inc <= limit )) && pactl set-sink-volume "$sink" "+$inc%"; then
            dunstify -a "$app" -u low -r "$notifID" -i "$icon_up" "$app" "Volume UP to $((volume + inc))%"
        fi
        ;;

    '--volume-down')
        if (( volume - inc >= 0 )) && pactl set-sink-volume "$sink" "-$inc%"; then
            dunstify -a "$app" -u low -r "$notifID" -i "$icon_down" "$app" "Volume DOWN to $((volume - inc))%"
        fi
        ;;

    '--mute')
        if pactl set-sink-mute "$sink" toggle; then
            muted=$(pactl list sinks | grep "Name: $sink" -A 6 | tail -n 1 | awk '{print $2}')
            if [[ "$muted" == 'yes' ]]; then
                dunstify -a "$app" -u normal -r "$notifID" -i "$icon_mute" "$app" "Audio muted"
            else
                dunstify -a "$app" -u normal -r "$notifID" -i "$icon_unmute"  "$app" "Audio activated: $volume%"
            fi
        fi
        ;;

    '--source-mute')
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
        ;;
esac
