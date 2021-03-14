#!/bin/bash

echo -n 'process > '
read pname
[[ -z "$pname" ]] && exit 1
plist=$(pgrep "$pname")
[[ -z "$plist" ]] && echo 'Process not found' && exit 1
pid=$(echo "$plist" | dmenu -p 'Pid')
[[ -z "$pid" ]] && exit 1
top -d 1 -p "$pid" -H
