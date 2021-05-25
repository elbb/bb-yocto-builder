#!/bin/bash
set -o errexit   # abort on nonzero exitstatus
set -o pipefail  # don't hide errors within pipes

echo KAS_CONFIG_DIR=${KAS_CONFIG_DIR}
echo YOCTO_BUILD_DIR=${YOCTO_BUILD_DIR}

cd ${YOCTO_BUILD_DIR}

for i in ${KAS_CONFIG_DIR}/*.yaml
do
  ln -sf $i
done
