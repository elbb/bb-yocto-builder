#!/bin/bash
set -o errexit   # abort on nonzero exitstatus
set -o pipefail  # don't hide errors within pipes
useradd --shell /bin/bash -u ${USER_ID} -o -c "" -m user
mkdir -p /yocto-build /yocto-deploy /yocto-download /yocto-sstate
chown user:user /yocto-build /yocto-deploy /yocto-download /yocto-sstate
exec gosu user:user "${@}"