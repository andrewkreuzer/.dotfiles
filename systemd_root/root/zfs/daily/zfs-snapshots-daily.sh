#!/bin/bash
zfs snapshot -r rpool@$(date +"%m-%d-%Y")
