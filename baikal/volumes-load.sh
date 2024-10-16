#!/usr/bin/env sh

printf "Loading the host 'config' into the volume\n"
docker run --rm \
            --name baikal-config-load \
            -v "$(pwd)"/backup/config:/conf \
            -v baikal_config:/input \
            ubuntu sh -c 'find /conf/ -mindepth 1 ! -name ".keep" -exec cp -a {} /input/ \;'

printf "Loading the host 'Specific' into the volume\n"
docker run --rm \
            --name baikal-specific-load \
            -v "$(pwd)"/backup/Specific:/spec \
            -v baikal_specific:/input \
            ubuntu sh -c 'find /spec/ -mindepth 1 ! -name ".keep" -exec cp -a {} /input/ \;'
