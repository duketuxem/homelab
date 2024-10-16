#!/usr/bin/env sh

printf "Extracting 'config' directory\n"
docker run --name baikal-config-tmp \
            -v baikal_config:/conf \
            ubuntu sh
docker run --rm \
            --volumes-from baikal-config-tmp \
            -v $(pwd)/backup/config:/output \
            ubuntu sh -c 'cp -a /conf/. /output/'
docker rm baikal-config-tmp

printf "Extracting 'Specific' directory\n"
docker run --name baikal-specific-tmp \
            -v baikal_specific:/spec \
            ubuntu sh
docker run --rm \
            --volumes-from baikal-specific-tmp \
            -v $(pwd)/backup/Specific:/output \
            ubuntu sh -c 'cp -a /spec/. /output/'
docker rm baikal-specific-tmp
