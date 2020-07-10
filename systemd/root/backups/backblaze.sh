#!/bin/bash

RCLONE_CONFIG_PASS=$(su - akreuzer -c 'pass rclone/config')
APP_TOKEN=$(su - akreuzer -c 'pass pushover/croft-backup')
USER_KEY=$(su - akreuzer -c 'pass pushover/user-key')

dirs=(
    "/home/akreuzer/dev/" 
    "/home/akreuzer/Documents/"
    "/etc"
)


for d in ${dirs[@]}; do
    SECONDS=0
    rclone --config="/home/akreuzer/.config/rclone/rclone.conf" sync --password-command="echo $RCLONE_CONFIG_PASS" $d croft-encrypt:$d
    duration=$SECONDS
    message="$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed for $d"
    curl -s \
             --form-string "token=$APP_TOKEN" \
             --form-string "user=$USER_KEY" \
             --form-string "message=$message" \
             https://api.pushover.net/1/messages.json
done
