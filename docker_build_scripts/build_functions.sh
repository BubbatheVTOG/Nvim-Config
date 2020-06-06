source $(dirname $0)/set_environment.sh

function build () {
	local NO_CACHE=""
	if $2; then
		NO_CACHE="--no-cache "
	fi
	eval "${DOCKER_BIN} build ${IGNORE_CACHE}--target $1 -t ${DOCKER_TAG}:$1 ${PROJ_ROOT}."
}

function push () {
	eval "${DOCKER_BIN} push ${DOCKER_TAG}:$1"
}

function print_help {
	printf "%s\n" "This script will build docker images and publish them. By default it will build just the base image. Other images can be built."
	printf "%s\n" "Usage:"
	printf "\t%s\t%s\n" "-j | --java" "This will build the image for java development."
	printf "\t%s\t%s\n" "-c | --cpp" "This will build the image for cpp development."
	printf "\t%s\t%s\n" "-t | --tenXdev" "This will build the image containing everything."
	printf "\t%s\t%s\n" "-h | --help" "Prints this message."
	printf "\n"
}

