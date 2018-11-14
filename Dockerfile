FROM centos/ruby-24-centos7:latest
MAINTAINER Eguzki Astiz Lezaun <eastizle@redhat.com>

USER root
RUN /bin/bash -l -c "gem install 3scale_toolbox \
    --version 0.5.1 \
    --no-rdoc --no-ri"

USER default
