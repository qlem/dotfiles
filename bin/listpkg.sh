#!/bin/bash

export LANG=C
export LC_ALL=C

tmp=/tmp/listpkg
mkdir $tmp

base=$tmp/base.txt
pkg=$tmp/pkg.txt
diff=$tmp/diff.txt

bold='\033[1m'
reset='\033[0m'

# get pkg from base
pacman -Si base | grep 'Depends On' | cut -d: -f2 | awk '{$1=$1};1' | tr ' ' '\n' > $base

# get pkg from base-devel group
pacman -Sgq base-devel >> $base
sort -u -o $base $base

# get all installed pkg
pacman -Qeq > $pkg

# list installed pkg except pkg from base and base-devel
diff $pkg $base > $diff
sed -i -r '/^(<|>).*$|^---$/!d;s/^(< |> )(.*)$/\2/' $diff
echo -e "${bold}Installed packages:${reset}"
while read line; do
    if [[ "$line" == '---' ]]; then
        echo -e "\n${bold}Non-explicitly installed packages:${reset}"
    else
        echo "$line"
    fi
done < "$diff"
count=$(wc -l $diff | awk '{print $1}')
echo -e "\n${bold}-- $((count - 1)) installed packages${reset}"
rm -r $tmp
