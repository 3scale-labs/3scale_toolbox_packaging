# These options are required for all software definitions
name '3scale_toolbox'
default_version '0.5.0'

dependency 'ruby'
dependency 'rubygems'

version '0.5.0' do
  source url: "https://github.com/3scale/#{name}/archive/v#{version}.tar.gz",
         md5: '95475ea169e618636e1d387c3ae43a87'
end

relative_path "#{name}-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  usr_bin_dir = '/usr/local/bin'
  install_bin_dir = File.join(install_dir, 'bin')
  gem "install #{name}" \
      " --bindir '#{install_bin_dir}'" \
      ' --no-rdoc --no-ri' \
      " --version #{version}", env: env
  # entrypoint
  entrypoint_dest = "#{usr_bin_dir}/3scale"
  erb(
    source: '3scale.erb',
    dest: entrypoint_dest,
    vars: {
      install_bin_dir: install_bin_dir
    },
    mode: 0755
  )
  project.extra_package_file(entrypoint_dest)
end
