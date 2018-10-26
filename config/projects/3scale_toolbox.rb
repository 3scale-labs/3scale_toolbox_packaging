#
# Copyright 2018 YOUR NAME
#
# All Rights Reserved.
#

name '3scale_toolbox'
maintainer 'Eguzki Astiz Lezaun'
homepage 'https://github.com/3scale/3scale_toolbox'

# Defaults to C:/3scale_toolbox on Windows
# and /opt/3scale_toolbox on all other platforms
install_dir "#{default_root}/#{name}"

build_version '0.5.0'

build_iteration 1

# Creates required build directories
dependency 'preparation'

override :ruby, version: '2.3.1'
override :rubygems, version: '2.4.8'
override name.to_sym, version: build_version

dependency name

# Version manifest file
dependency 'version-manifest'

exclude '**/.git'
exclude '**/bundler/git'
exclude '**/vendor'
