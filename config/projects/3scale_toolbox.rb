#
# Copyright 2018 YOUR NAME
#
# All Rights Reserved.
#

name '3scale_toolbox'
maintainer 'Eguzki Astiz Lezaun'
homepage 'https://github.com/3scale/3scale_toolbox'

project_self = self
package :pkg do
  identifier "com.3scale.pkg.#{project_self.name}"
  # signing_identity 'acbd1234'
end

# Defaults to C:/3scale_toolbox on Windows
# and /opt/3scale_toolbox on all other platforms
install_dir "#{default_root}/#{name}"

build_version '0.5.1'

build_iteration 1

# Creates required build directories
dependency 'preparation'

override :ruby, version: '2.3.1'
override :rubygems, version: '2.4.8'
# override url to avoid ftp URI
# https://blog.travis-ci.com/2018-07-23-the-tale-of-ftp-at-travis-ci
override :libffi, source: { url: 'https://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz' }
override name.to_sym, version: build_version

dependency name

# Version manifest file
dependency 'version-manifest'

exclude '**/.git'
exclude '**/bundler/git'
exclude '**/vendor'

package :msi do
  upgrade_code '9f6ec4a5-d48c-4fc1-a2c5-e16c81a38b22'

  # Use WixUtilExtension to support WixBroadcastEnvironmentChange and notify
  # the system that we're updating an environment variable (the PATH).
  wix_candle_extension 'WixUtilExtension'
  wix_light_extension 'WixUtilExtension'
end
