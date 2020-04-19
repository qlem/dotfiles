#!/bin/bash

authors=$(git shortlog -ns | cut -f 2)
printf "%20s | %6s | %6s | %6s | %5s\n" "author" "f. cha" "insert" "delete" "commi"
echo  "-------------------------------------------------------"
while IFS= read -r author; do
    printf "%20s |" "$author"
    git log --shortstat --author="$author <[a-zA-Z0-9.-]+@[A-Za-z-]+.(com|eu|fr|net|local)>" --perl-regexp | \
    grep -E "fil(e|es) changed" | \
    awk '{files+=$1; inserted+=$4; deleted+=$6} END {printf " %6s | %6s | %6s | %5s\n", files, inserted, deleted, NR}'
done <<< "$authors"
