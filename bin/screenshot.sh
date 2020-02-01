#!/bin/bash

now=$(date -Iseconds)
file="screenshot_$now.png"
if [[ -f "$HOME/$file" ]]; then
    i=1
    file="screenshot_$now($i).png"
    while [[ -f "$HOME/$file" ]]; do
        i=$((i+1))
        file="screenshot_$now($i).png"
    done
fi
shotgun -f png "$HOME/$file" > /dev/null 2>&1
[[ "$?" -ne 0 ]] && echo "An error has occured!"
