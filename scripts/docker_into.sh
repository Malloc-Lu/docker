#!/usr/bin/env bash

# xhost +local:root 1>/dev/null 2>&1
docker exec \
    -u root \
    -it malloc_reproduce \
    /bin/zsh
#