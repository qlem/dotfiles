#!/bin/bash

export LC_ALL=C

inc=5
limit=150
sink=$(pacmd stat | awk -F": " '/^Default sink name: /{print $2}')
volume=$(pactl list sinks | grep "Name: $sink" -A 7 | awk '/Volume: /{print $5}' | sed -r 's/%//g')
if [[ $1 == --volume-up ]] && (( volume + inc <= limit )); then
    pactl set-sink-volume @DEFAULT_SINK@ "+$inc%"
elif [[ $1 == --volume-down ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ "-$inc%"
elif [[ $1 == --mute ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [[ $1 == --source-mute ]]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
fi
