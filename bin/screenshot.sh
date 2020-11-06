#!/bin/bash

# This script requiers the following binaries: dmenu - shotgun - slop - xclip - curl - jq

CLIENT_ID='a5dd3225fc52739'
HEADER="Authorization: Client-ID $CLIENT_ID"
URL='https://api.imgur.com/3/image'
PRERR='Screen capture error'

upload() {
    local res
    local error
    local success
    if ! res=$(curl -Ss -L -X POST "$URL" -H "$HEADER" -F "image=@$file"); then
        >&2 printf "%s: Upload failed\n" "$PRERR"
        exit 1
    fi
    success=$(echo "$res" | jq -r .success)
    if [[ $success == true ]]; then
        echo "$res" | jq -r .data.link | xclip -r -selection clipboard
    else
        error=$(echo "$res" | jq -r .data.error)
        >&2 printf "%s: Upload failed: %s\n" "$PRERR" "$error"
        exit 1
    fi
}

capture() {
    local slop
    local area
    if [[ $sel == "$item1" ]]; then
        shotgun -f png "$file" >/dev/null 2>&1
    elif [[ $sel == "$item2" ]]; then
        slop=$(slop -f "-i %i -g %g")
        if [[ -z $slop ]]; then
            exit 0
        else
            read -ra area <<< "$slop"
            shotgun -f png "$file" "${area[@]}" >/dev/null 2>&1
        fi
    else
        exit 0
    fi
}

item1='fullscreen'
item2='selection'
if [[ $1 == --upload ]]; then
    file="/tmp/screen_capture.png"
    sel=$(echo -e "$item1\n$item2" | dmenu -p 'Screen capt. Imgur' -i "${@:2}")
    capture
    upload
else
    printf -v date '%(%FT%T%z)T' -1
    file="$HOME/Pictures/screenshot_$date.png"
    sel=$(echo -e "$item1\n$item2" | dmenu -p 'Screen capture' -i "$@")
    capture
fi
