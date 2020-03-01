#!/bin/sh

tmp=/tmp/listpkg
mkdir $tmp

base=$tmp/base.txt
pkg=$tmp/pkg.txt
diff=$tmp/diff.txt

export LANG=C
export LC_ALL=C

# base package
pacman -Si base | grep 'Depends On' | cut -d: -f2 | awk '{$1=$1};1' | tr ' ' '\n' > $base

# base-devel group
pacman -Sg base-devel | awk '{print $2}' >> $base
sort -u -o $base $base

# installed packages
pacman -Qe > $pkg
sed -i -r 's/^(.*) .*$/\1/' $pkg

# list installed packages except packages from base and base-devel
diff $pkg $base > $diff
sed -i -r '/^(<|>).*$/!d;s/^(< |> )(.*)$/\2/' $diff
sort -o $diff $diff
count=$(wc -l $diff | awk '{print $1}')
cat $diff
echo "-- $count installed packages"
rm -r $tmp
