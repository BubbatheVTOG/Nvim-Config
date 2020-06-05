#!/bin/bash

# The current absolute directory of the script.
export MY_DIR="$( cd -P "$(dirname "$0")" && pwd)"
export PROJ_ROOT=${MY_DIR}/../

BRANCH="base"
DOCKER_TAG="bubbathevtog/nvim"
DOCKER_BIN="$(which docker)"
export DOCKER_BUILDKIT=1
export BUILD_CMD="${DOCKER_BIN} build --target ${BRANCH} -t ${DOCKER_TAG}:${BRANCH} ${PROJ_ROOT}"
