#!/bin/sh

tmp=/tmp/listpkg
mkdir $tmp

base=$tmp/base.txt
pkg=$tmp/pkg.txt
diff=$tmp/diff.txt

export LANG=C
export LC_ALL=C

# get pkg from base
pacman -Si base | grep 'Depends On' | cut -d: -f2 | awk '{$1=$1};1' | tr ' ' '\n' > $base

# get pkg from base-devel group
pacman -Sgq base-devel >> $base
sort -u -o $base $base

# get all installed pkg
pacman -Qeq > $pkg

# list installed pkg except pkg from base and base-devel
diff $pkg $base > $diff
sed -i -r '/^(<|>).*$/!d;s/^(< |> )(.*)$/\2/' $diff
sort -o $diff $diff
count=$(wc -l $diff | awk '{print $1}')
cat $diff
echo "-- $count installed packages"
rm -r $tmp