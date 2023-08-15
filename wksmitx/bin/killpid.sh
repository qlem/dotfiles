#!/bin/bash

sel=$(ps --no-headers -eo "%c" | dmenu -p 'Kill process' -i "$@" | sed -e 's/[[:space:]]*$//')
[[ -z "$sel" ]] && exit
process=$(pgrep -x -d ',' "$sel")
[[ -z "$process" ]] && exit
IFS=',' read -r -a array <<< "$process"
if [[ "${#array[@]}" -gt 1 ]]; then
    pids=$(printf '%s\n' "${array[@]}")
    pid=$(echo "$pids" | dmenu -p 'Pid' -i "$@")
    [[ -z "$pid" ]] && exit
    kill -SIGKILL $pid
else
    kill -SIGKILL "${array[0]}"
fi
