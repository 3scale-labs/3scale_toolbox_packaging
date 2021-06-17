#!/bin/bash
set -o errexit
set -o nounset
set -o xtrace

BUILD_AT="/build"

docker run -u root -e DOCKER_IMAGE=${DOCKER_IMAGE} -it --rm -v "${PWD}:${BUILD_AT}" -w "${BUILD_AT}" "$DOCKER_IMAGE" ./native.sh
