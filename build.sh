#!/bin/bash
set -o errexit
set -o nounset
set -o xtrace

# Since secure_path is set on our CentOS build images, we also need to ensure
# we only use absolute paths when referencing the binaries we want to run.
GEM="$(command -v gem)"
$GEM install bundler:2.2.21
BUNDLE="$(command -v bundle)"
RUBY="$(command -v ruby)"

echo "Using GEM=${GEM}, BUNDLE=${BUNDLE}, RUBY=${RUBY}"

"$GEM" env
"$BUNDLE" config set without 'development'
"$BUNDLE" config set path 'vendor/bundle'
"$BUNDLE" install
"$BUNDLE" binstubs omnibus
bin/omnibus build 3scale-toolbox --log-level debug
