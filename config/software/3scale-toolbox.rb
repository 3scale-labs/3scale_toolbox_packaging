# These options are required for all software definitions
name '3scale-toolbox'
default_version '0.17.1'

dependency 'ruby'
dependency 'rubygems'
dependency 'liblzma'

version '0.5.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: '95475ea169e618636e1d387c3ae43a87'
end

version '0.5.1' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: '93af786407583add22b652d8ea6c600e'
end

version '0.7.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: 'a483747364d0fcff8229d4b71656b365'
end

version '0.8.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: 'ab1d98135cfec0b60dd8f016d9327d83'
end

version '0.9.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: '70df4925f61dd62344103adc91fb851d'
end

version '0.10.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: '3ab7e5f7b01e6b6527bdab7afc519692'
end

version '0.11.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: '54a852b3bf9b3b50fc9a0e2a2efac554'
end

version '0.12.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: '08209057c8c9bf4b066cf03afda52ae0'
end

version '0.12.3' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: '647e78b18e2954f04e32129c46271daa'
end

version '0.12.4' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: 'aa1e7a9d61b7e171ba2d7927e9239cc3'
end

version '0.14.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: 'e777ad558e80e323d87ab83ed4949a06'
end

version '0.16.0' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: '13b033ac8acda90461ca9dd67f3f84d1'
end

version '0.17.1' do
  source url: "https://github.com/3scale/3scale_toolbox/archive/v#{version}.tar.gz",
         md5: '8c45362d012f3786fd7be2d2612e8237'
end

relative_path "3scale_toolbox-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  usr_bin_dir = '/usr/local/bin'
  install_bin_dir = File.join(install_dir, 'bin')
  gem 'install 3scale_toolbox' \
      " --bindir '#{install_bin_dir}'" \
      ' -N' \
      " --version #{version}", env: env

  unless windows?
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
end
