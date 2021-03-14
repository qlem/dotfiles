#!/bin/bash

file="$HOME/Downloads/accounts.json.gpg"
decrypt="/tmp/secret_accounts.json"
[ ! -f "$file" ] && echo 'Accounts file not found' && exit 1

echo -n 'account > '
read account
[[ -z "$account" ]] && exit 1
res=$(gpg -q --decrypt "$file" | jq ".data[] | select(.name == \"$account\")")
[[ -z "$res" ]] && echo 'Account not found' && exit 1
echo "$res" | jq
