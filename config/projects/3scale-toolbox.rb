#
# Copyright 2018 YOUR NAME
#
# All Rights Reserved.
#

name '3scale-toolbox'
maintainer 'Eguzki Astiz Lezaun'
homepage 'https://github.com/3scale/3scale_toolbox'

# Defaults to C:/3scale-toolbox on Windows
# and /opt/3scale-toolbox on all other platforms
install_dir "#{default_root}/#{name}"

# This line is parsed to create docker image
# regexp: ^build_version '\d+\.\d+\.\d+'$
build_version '0.7.0'

build_iteration 1

# Creates required build directories
dependency 'preparation'

override :ruby, version: '2.5.3'
override :rubygems, version: '3.0.3'
override name.to_sym, version: build_version

dependency name

# Version manifest file
dependency 'version-manifest'

exclude '**/.git'
exclude '**/bundler/git'
exclude '**/vendor'

project_self = self
package :pkg do
  identifier "com.3scale.pkg.#{project_self.name}"
  # signing_identity 'acbd1234'
end

project_location_dir = name
package :msi do
  upgrade_code '9f6ec4a5-d48c-4fc1-a2c5-e16c81a38b22'

  parameters(
    ProjectLocationDir: project_location_dir,
    ThreeScaleToolboxPathGuid: '2fecd030-ef11-4357-93dc-8160b7562e4b'
  )

  # Use WixUtilExtension to support WixBroadcastEnvironmentChange and notify
  # the system that we're updating an environment variable (the PATH).
  wix_candle_extension 'WixUtilExtension'
  wix_light_extension 'WixUtilExtension'
end
