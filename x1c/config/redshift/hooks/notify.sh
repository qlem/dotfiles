#!/bin/sh
case $1 in
    period-changed)
		exec dunstify -a "Redshift" -u normal -i "redshift" "Redshift" "Period changed to [$3]"
esac
