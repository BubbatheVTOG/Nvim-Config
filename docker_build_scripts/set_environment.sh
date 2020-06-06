#!/bin/bash

# The current absolute directory of the script.
export MY_DIR="$( cd -P "$(dirname "$0")" && pwd)"
export PROJ_ROOT=${MY_DIR}/../

export DOCKER_TAG="bubbathevtog/nvim"
export DOCKER_BIN="$(which docker)"
export DOCKER_BUILDKIT=1
