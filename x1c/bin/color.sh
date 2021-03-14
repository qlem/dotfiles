#!/bin/bash

color=0
while [ $color -lt 256 ]; do
    echo -e "$color: \\033[48;5;${color}m       \\033[0m"
    ((color++))
done  
