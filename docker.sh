#!/bin/bash
# Expects a DOCKER_TAG to build in. Applies the build to the current working
# directory, but from within a container. Everything is mounted into the
# container.
set -o errexit
set -o nounset
set -o xtrace

DOCKER_IMAGE="${DOCKER_REPO:-quay.io/3scale/ruby-base}:$DOCKER_TAG"
BUILD_AT="/build"

docker run -it --rm -v "$(pwd):${BUILD_AT}" -w "$BUILD_AT" \
           -e "DOCKER_TAG=${DOCKER_TAG}" "$DOCKER_IMAGE" \
           ./native.sh
