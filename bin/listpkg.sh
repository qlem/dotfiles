#!/bin/bash

export LANG=C
export LC_ALL=C

tmp=/tmp/listpkg
base=$tmp/base.txt
pkg=$tmp/pkg.txt
diff=$tmp/diff.txt
mkdir $tmp

bold='\033[1m'
reset='\033[0m'

# get list of packages from base and base-devel
pacman -Si base | grep 'Depends On' | cut -d: -f2 | awk '{$1=$1};1' | tr ' ' '\n' > $base
pacman -Sgq base-devel >> $base
sort -u -o $base $base

# get list of all installed packages
pacman -Qeq > $pkg

# print list of installed packages except packages from base and base-devel
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

# print number of installed papackages
count=$(wc -l $diff | awk '{print $1}')
echo -e "\n${bold}-- $((count - 1)) installed packages${reset}"
rm -r $tmp
