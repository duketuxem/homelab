#!/usr/bin/env sh

content=$(find backup/config backup/Specific -mindepth 1 \( ! -name ".keep" \) -print)
if [ -z "$content" ]; then
    printf "No content found !\n"
    exit 1
fi

tar -cvzf "./backup/baikal-$(date +%Y%m%d-%Hh%M).tar.gz" backup/config backup/Specific
