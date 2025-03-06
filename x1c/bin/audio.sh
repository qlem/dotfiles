#!/bin/bash

export LC_ALL=C

inc=5
limit=150
app='PulseAudio'
icon_up='notification-audio-volume-high'
icon_down='notification-audio-volume-medium'
icon_mute='notification-audio-volume-muted'
icon_unmute='notification-audio-volume-high'
sink='alsa_output.pci-0000_00_1f.3.analog-stereo'
# sink=$(pactl list sinks short | grep 'RUNNING' | awk '{print $2}')
volume=$(pactl list sinks | grep "Name: $sink" -A 7 | tail -n 1 | awk '{print $5}' | sed -E 's/%//g')

case "$1" in
    '--volume-up')
        if (( volume + inc <= limit )) && pactl set-sink-volume "$sink" "+$inc%"; then
            dunstify -a "$app" \
                -u low \
                -h string:x-dunst-stack-tag:pavolume \
                -i "$icon_up" \
                "$app" "Volume   UP:  $(( volume + inc ))%" 
        fi
        ;;

    '--volume-down')
        if (( volume > 0 )) && pactl set-sink-volume "$sink" "-$inc%"; then
            (( volume - inc < 0 )) && volume=0 || volume=$(( volume - inc ))
            dunstify -a "$app" \
                -u low \
                -h string:x-dunst-stack-tag:pavolume \
                -i "$icon_down" \
                "$app" "Volume DOWN:  $volume%"
        fi
        ;;

    '--mute')
        if pactl set-sink-mute "$sink" toggle; then
            muted=$(pactl list sinks | grep "Name: $sink" -A 6 | tail -n 1 | awk '{print $2}')
            if [[ "$muted" == 'yes' ]]; then
                dunstify -a "$app" \
                    -u normal \
                    -h string:x-dunst-stack-tag:pavolume \
                    -i "$icon_mute" \
                    "$app" "Audio OFF"
            else
                dunstify -a "$app" \
                    -u normal \
                    -h string:x-dunst-stack-tag:pavolume \
                    -i "$icon_unmute" \
                    "$app" "Audio ON:  $volume%"
            fi
        fi
        ;;

    '--source-mute')
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
        ;;
esac
