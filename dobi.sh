#!/bin/bash

set -o errexit   # abort on nonzero exitstatus
set -o pipefail  # don't hide errors within pipes

dobi --filename meta.yaml version # generate actual version files

# check argument count
if [ -z ${1} ]; then
    echo "no arguments!"
    dobi --filename meta.yaml list
    exit 1
fi

# load generated version infos
source gen/gitversion/env/gitversion.env

# execute dobi with meta as default
exec dobi --filename meta.yaml ${@}