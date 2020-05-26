#!/bin/bash

echo -e "process?"
read pname
pid=$(pgrep $pname | dmenu)
top -d 1 -p $pid -H
