#!/bin/bash

list='/etc/pacman.d/mirrorlist'
url='https://www.archlinux.org/mirrors/status/json/'
country='Germany'
score=1
limit=5

[[ "$USER" != 'root' ]] && echo 'Error: permission denied' && exit 1

urls=$(curl -sS "$url" | jq -r ".urls | sort_by(.score)[] | select(.country == \"$country\") | select(.completion_pct == 1) | select(.score <= $score) | .url")
date=$(date +%x)
[[ -f "$list" ]] && mv "$list" "$list.old"
echo -e "##\n## Generated on $date\n##\n" > "$list"
for url in $urls; do
    [[ "$i" -eq "$limit" ]] && break
    echo "Server = $url\$repo/os/\$arch" >> "$list"
    ((i++))
done
echo "Done"
