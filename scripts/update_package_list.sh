#!/bin/bash

cd /home/`whoami`/Documents/packages;
pacman -Qe | awk '{print $1}' > installed_packages.txt;

if git status | grep -q 'nothing to commit'; then
    echo "no run";
    exit 0;
fi
# bleh also we don't handle package removals
packages=$(git diff --unified=0 | tail +6 | sed -e 's/^\@.*$/ /' | tr -d '\n' | sed -e 's/ /, /')
git add -A;
git commit -m "$(date +%d-%m-%y) $packages";
