#!/bin/bash

current=$(node -v)
echo "current version $current"

if [[ $current =~ ^v14\.[0-9]+\.[0-9]+$ ]]; then
    sudo mv /opt/node /opt/node_v14
    sudo mv /opt/node_v16 /opt/node
elif [[ $current =~ ^v16\.[0-9]+\.[0-9]+$ ]]; then
    sudo mv /opt/node /opt/node_v16
    sudo mv /opt/node_v14 /opt/node
fi

blue='\033[0;34m'
bold='\033[1m'
reset='\033[0m'
echo -e "${blue}${bold}switched to $(node -v)${reset}"
