#!/bin/bash

set -o errexit   # abort on nonzero exitstatus
set -o pipefail  # don't hide errors within pipes

# set project name
export PROJECT_NAME=bb-buildingblock

# check argument count
if [ -z ${1} ]; then
    echo "no arguments!"
    exit 1
fi

# extend list command
if [ $1 = "list" ]; then
    echo "Predifiend Resources:"
    echo "  build   [--->] ${PROJECT_NAME}-build"
    echo "  test    [--->] ${PROJECT_NAME}-test"
    echo "  deploy  [--->] ${PROJECT_NAME}-deploy"
    exec dobi list
    exit 0
fi

# set dobi defaults
if [ $1 = "test" ] || [ $1 = "build" ] || [ $1 = "deploy" ]; then
    set -- "${PROJECT_NAME}-${1}"
fi

# execute dobi
exec dobi $@