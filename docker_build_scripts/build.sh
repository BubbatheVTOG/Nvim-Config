#!/bin/bash

# Source these scripts for dependencies.
source $(dirname $0)/set_environment.sh

function print_help {
	printf "%s\n" "This script will build docker images and publish them. By default it will build just the base image. Other images can be built."
	printf "%s\n" "Usage:"
	printf "\t%s\t%s\n" "-j | --java" "This will build the image for java development."
	printf "\t%s\t%s\n" "-c | --cpp" "This will build the image for cpp development."
	printf "\t%s\t%s\n" "-t | --tenXdev" "This will build the image containing everything."
	printf "\t%s\t%s\n" "-h | --help" "Prints this message."
	printf "\n"
}

# Parse arguments.
function parse_args () {
	while (( "$#" )); do
		case $1 in
			-j|--java)
				BUILD_JAVA=true
				shift
				;;
			-c|--cpp)
				BUILD_CPP=true
				shift
				;;
			-t|--tenXdev)
				TEN_X_DEV=true
				shift
				;;
			-p|--publish)
				PUBLISH=true
				shift
				;;
			--)
				shift
				;;
			-h|--help)
				print_help
				exit 0
				;;
			*)
				print_help
				exit 1
				;;
		esac
	done
}

BUILD_JAVA=false
BUILD_CPP=false
TEN_X_DEV=false
PUBLISH=false

parse_args "$@"

# TODO: This logic is fucking horrible. This needs to be function.

# Build the default image first.
BRANCH="base"
eval "${DOCKER_BIN} build --target ${BRANCH} -t ${DOCKER_TAG}:${BRANCH} ${PROJ_ROOT}"

if $PUBLISH; then
	eval "${DOCKER_BIN} push ${DOCKER_TAG}:${BRANCH}"
fi


if $BUILD_JAVA; then
	BRANCH="java"
	eval "${DOCKER_BIN} build --target ${BRANCH} -t ${DOCKER_TAG}:${BRANCH} ${PROJ_ROOT}"
	if $PUBLISH; then
		eval "${DOCKER_BIN} push ${DOCKER_TAG}:${BRANCH}"
	fi
fi

if $BUILD_CPP; then
	BRANCH="cpp"
	eval "${DOCKER_BIN} build --target ${BRANCH} -t ${DOCKER_TAG}:${BRANCH} ${PROJ_ROOT}"
	if $PUBLISH; then
		eval "${DOCKER_BIN} push ${DOCKER_TAG}:${BRANCH}"
	fi
fi

if $TEN_X_DEV; then
	BRANCH="tenXdev"
	eval "${DOCKER_BIN} build --target ${BRANCH} -t ${DOCKER_TAG}:${BRANCH} ${PROJ_ROOT}"
	if $PUBLISH; then
		eval "${DOCKER_BIN} push ${DOCKER_TAG}:${BRANCH}"
	fi
fi

