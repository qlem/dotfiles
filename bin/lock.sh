#!/bin/sh

bg=/tmp/bg_lock.png
shotgun -f png $bg > /dev/null 2>&1
[[ $? -ne 0 ]] && i3lock $@
gm convert $bg -scale 10% -scale 1000% -colorspace Gray -gamma 0.6 $bg > /dev/null 2>&1
[[ $? -ne 0 ]] && i3lock $@
i3lock -i $bg $@
