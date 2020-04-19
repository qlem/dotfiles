#!/bin/bash

CLIENT_ID='a5dd3225fc52739'
HEADER="Authorization: Client-ID $CLIENT_ID"
URL='https://api.imgur.com/3/image'

if ! shotgun -v &>/dev/null || ! slop -v &>/dev/null || ! xclip -version &>/dev/null || ! jq -V &>/dev/null; then
    >&2 printf "Screen capture error: following binaries required: shotgun - slop - xclip - jq\n"
    exit 1
fi

upload() {
    local res
    local success
    if ! res=$(curl -Ss -L -X POST "$URL" -H "$HEADER" -F "image=@$file"); then
        >&2 printf "Screen capture error: upload failed\n"
        exit 1
    fi
    success=$(echo "$res" | jq -r .success)
    if [[ $success != true ]]; then
        error=$(echo "$res" | jq -r .data.error)
        >&2 printf "Screen capture error: upload failed: %s\n" "$error"
        exit 1
    else
        echo "$res" | jq -r .data.link | xclip -selection clipboard
    fi
}

capture() {
    slop=$(slop -f "-i %i -g %g")
    if [[ -z $slop ]]; then
        shotgun -f png "$file" >/dev/null 2>&1
    else
        read -ra sel <<< "$slop"
        shotgun -f png "$file" "${sel[@]}" >/dev/null 2>&1
    fi
}

if [[ $1 == --upload ]]; then
    file="/tmp/screen_capture.png"
    capture
    upload
else
    printf -v date '%(%FT%T%z)T' -1
    file="$HOME/screenshot_$date.png"
    capture
fi
