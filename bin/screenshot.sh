#!/bin/bash

CLIENT_ID='a5dd3225fc52739'
HEADER="Authorization: Client-ID $CLIENT_ID"
URL='https://api.imgur.com/3/image'
PREFIX_ERR='Screen capture error'

if ! shotgun -v &>/dev/null || ! slop -v &>/dev/null || ! xclip -version &>/dev/null || ! jq -V &>/dev/null; then
    >&2 printf "%s: Script requires following binaries: dmenu - curl - shotgun - slop - xclip - jq\n" "$PREFIX_ERR"
    exit 1
fi

upload() {
    local res
    local success
    if ! res=$(curl -Ss -L -X POST "$URL" -H "$HEADER" -F "image=@$file"); then
        >&2 printf "%s: Upload failed\n" "$PREFIX_ERR"
        exit 1
    fi
    success=$(echo "$res" | jq -r .success)
    if [[ $success != true ]]; then
        error=$(echo "$res" | jq -r .data.error)
        >&2 printf "%s: Upload failed: %s\n" "$PREFIX_ERR" "$error"
        exit 1
    else
        echo "$res" | jq -r .data.link | xclip -selection clipboard
    fi
}

capture() {
    if [[ $sel == "$item1" ]]; then
        shotgun -f png "$file" >/dev/null 2>&1
    elif [[ $sel == "$item2" ]]; then
        slop=$(slop -f "-i %i -g %g")
        if [[ -n $slop ]]; then
            read -ra sel <<< "$slop"
            shotgun -f png "$file" "${sel[@]}" >/dev/null 2>&1
        else
            exit 0
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
    file="$HOME/screenshot_$date.png"
    sel=$(echo -e "$item1\n$item2" | dmenu -p 'Screen capture' -i "$@")
    capture
fi
