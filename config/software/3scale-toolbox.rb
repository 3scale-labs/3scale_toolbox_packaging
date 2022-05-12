# These options are required for all software definitions
name '3scale-toolbox'
default_version '0.19.3'

dependency 'ruby'
dependency 'rubygems'

relative_path "3scale_toolbox-#{version}"

build do
  # Setup a default environment from Omnibus - you should use this Omnibus
  # helper everywhere. It will become the default in the future.
  env = with_standard_compiler_flags(with_embedded_path)

  gem 'install 3scale_toolbox' \
      ' -N' \
      " --version #{default_version}", env: env
end
