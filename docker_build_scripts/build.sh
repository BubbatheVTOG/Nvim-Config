#!/bin/bash

# Source these scripts for dependencies.
source $(dirname $0)/set_environment.sh
source $(dirname $0)/build_functions.sh

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
			-a|--all)
				BUILD_JAVA=true
				BUILD_CPP=true
				TEN_X_DEV=true
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

# Build the default image first.
BRANCH="base"
build $BRANCH

if $PUBLISH; then
	push $BRANCH
fi


if $BUILD_JAVA; then
	BRANCH="java"
	build $BRANCH
	if $PUBLISH; then
		push $BRANCH
	fi
fi

if $BUILD_CPP; then
	BRANCH="cpp"
	build $BRANCH
	if $PUBLISH; then
		push $BRANCH
	fi
fi

if $TEN_X_DEV; then
	BRANCH="tenXdev"
	build $BRANCH
	if $PUBLISH; then
		push $BRANCH
	fi
fi

