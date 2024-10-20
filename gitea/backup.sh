#!/usr/bin/env sh

content=$(find ./data -mindepth 1 \( ! -name ".keep" \) -print)
if [ -z "$content" ]; then
    printf "No content found !\n"
    exit 1
fi

tar -cvzf "./gitea-$(date +%Y%m%d-%Hh%M).tar.gz" --exclude='.keep' ./data
