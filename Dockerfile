FROM ruby:2.6-buster

LABEL maintainer="estafette.io" \
      description="The github-pages container is used to check github pages for build errors"

RUN gem install github-pages \
    && gem install bundler-audit \
    && bundle update --patch --conservative ffi \
    && bundle update --patch --conservative json \
    && bundle update --patch --conservative yajl-ruby \
    && bundle update --patch --conservative rubocop

RUN grep security /etc/apt/sources.list | tee /etc/apt/security.sources.list \
    && apt-get update \
    && apt-get upgrade -y -o Dir::Etc::SourceList=/etc/apt/security.sources.list \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
