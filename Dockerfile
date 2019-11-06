FROM ruby:2.6-buster

LABEL maintainer="estafette.io" \
      description="The github-pages container is used to check github pages for build errors"

RUN gem install github-pages