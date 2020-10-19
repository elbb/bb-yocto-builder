#!/bin/bash

set -o errexit   # abort on nonzero exitstatus
set -o pipefail  # don't hide errors within pipes

# load and export env files
set -o allexport
source default.env
[[ -f local.env ]] && source local.env
set +o allexport

#check for docker
if [[ $(docker version &>/dev/null;echo $?) -ne 0 ]]; then
    echo "docker is not running"
    exit 1
fi

#check for dobi
dobi=".dobi/dobi"
if [[ ! -f ${dobi} ]]; then
    if [[ -x $(which dobi) ]]; then
        dobi=$(which dobi)
    else
        if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "cygwin" ]]; then
            dobi_dltarget=linux
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            dobi_dltarget=darwin
        elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
            dobi_dltarget=windows
        fi
        if [[ ! -z ${dobi-dltarget} && -x $(which curl) ]]; then
            mkdir -p .dobi
            curl -L -o ${dobi} "https://github.com/dnephin/dobi/releases/download/v${DOWNLOAD_VERSION_DOBI}/dobi-${dobi_dltarget}"
            if [[ ${?} -ne 0 ]]; then
                echo "Download of dobi failed."
                exit 1
            else
                chmod +x ${dobi}
            fi
        else
            echo "\"dobi\" not found. Please install \"dobi\": https://github.com/dnephin/dobi/releases"
            exit 1
        fi
    fi
fi

# check arguments
if [[ -z ${1} || "list" == ${@: -1} ]]; then
    ${dobi} --filename meta.yaml list
    exit 1
fi

if [[ "version" !=  ${@: -1} ]]; then
    ${dobi} --filename meta.yaml version # generate actual version files
    # load generated version infos
    source gen/gitversion/env/gitversion.env
fi

# execute dobi with meta as default
exec ${dobi} --filename meta.yaml ${@}