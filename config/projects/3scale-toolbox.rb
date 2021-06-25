#
# Copyright 2021 YOUR NAME
#
# All Rights Reserved.
#

name '3scale-toolbox'
maintainer 'Eguzki Astiz Lezaun'
homepage 'https://github.com/3scale/3scale_toolbox'

# Defaults to C:/3scale-toolbox on Windows
# and /opt/3scale-toolbox on all other platforms
install_dir "#{default_root}/#{name}"

build_version '0.18.3'
build_iteration 1

# Creates required build directories
dependency "preparation"

# 3scale-toolbox dependencies/components
override name.to_sym, version: build_version
override :ruby, version: '2.7.1'
override :rubygems, version: '3.1.2'
# override url to avoid ftp URI
# https://blog.travis-ci.com/2018-07-23-the-tale-of-ftp-at-travis-ci
override :libffi, source: { url: 'https://sourceware.org/pub/libffi/libffi-3.3.tar.gz' }

dependency name

exclude "**/.git"
exclude "**/bundler/git"
exclude '**/vendor'

package :msi do
  upgrade_code '9f6ec4a5-d48c-4fc1-a2c5-e16c81a38b22'
end
