#!/usr/bin/env bash

grim -g "$(slurp)" /home/akreuzer/Pictures/Screenshots/$(date -d "today" + "%d-%m-%Y-%H%M").png
