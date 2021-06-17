#!/bin/bash
set -o errexit
set -o nounset
set -o xtrace

DOCKER_IMAGE="${DOCKER_IMAGE:-}"
SUDO=""

if [ "${DOCKER_IMAGE}" = "centos/ruby-27-centos7" ]
then
    yum -y install rpm-build
elif [ "${DOCKER_IMAGE}" = "ubuntu:20.04" ]
then
    apt update
    apt install -y git ruby ruby-dev libffi-dev build-essential
    gem install bundler:2.1.4
elif [ "${DOCKER_IMAGE}" = "osx" ]
then
    SUDO="rvmsudo"
    ${SUDO} gem install bundler:2.1.4
fi

# Since secure_path is set on our CentOS build images, we also need to ensure
# we only use absolute paths when referencing the binaries we want to run.
GEM="$(command -v gem)"
BUNDLE="$(command -v bundle)"
RUBY="$(command -v ruby)"

echo "Using GEM=${GEM}, BUNDLE=${BUNDLE}, RUBY=${RUBY}"

"$GEM" env
"$BUNDLE" config set without 'development'
"$BUNDLE" config set path 'vendor/bundle'
"$BUNDLE" install
"$BUNDLE" binstubs omnibus
${SUDO} bin/omnibus build 3scale-toolbox --log-level debug
