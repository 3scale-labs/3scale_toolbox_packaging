FROM centos/ruby-24-centos7:latest
MAINTAINER Eguzki Astiz Lezaun <eastizle@redhat.com>

USER root
WORKDIR /opt/app-root/src
COPY config/projects/3scale_toolbox.rb .
RUN TOOLBOX_VERSION=$(grep "build_version '" 3scale_toolbox.rb | cut -d\' -f2) \
    && /bin/bash -l -c "gem install 3scale_toolbox \
    --version ${TOOLBOX_VERSION} \
    --no-rdoc --no-ri"

USER default
