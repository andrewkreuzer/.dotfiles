#!/bin/bash

RCLONE_CONFIG_PASS=$(su - akreuzer -c 'pass rclone/config')
APP_TOKEN=$(su - akreuzer -c 'pass pushover/croft-backup')
USER_KEY=$(su - akreuzer -c 'pass pushover/user-key')

dirs=(
    "/home/akreuzer"
    "/etc"
)


for d in ${dirs[@]}; do
    SECONDS=0
    rclone --fast-list \
    sync $d croft-encrypt:$d -L \
        --password-command="echo $RCLONE_CONFIG_PASS" \
        --config="/home/akreuzer/.config/rclone/rclone.conf" \
        --exclude-from="/home/akreuzer/dotfiles/systemd/root/backups/exclude.txt"

    duration=$SECONDS
    message="$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed for $d"
    curl -s \
             --form-string "token=$APP_TOKEN" \
             --form-string "user=$USER_KEY" \
             --form-string "message=$message" \
             https://api.pushover.net/1/messages.json
done
