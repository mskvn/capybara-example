FROM alpine:edge

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base libffi-dev libxml2-dev libxslt-dev
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler
ENV BROWSER_PACKAGES udev ttf-opensans chromium chromium-chromedriver

# Add mirror for download packages
RUN echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    apk add $BROWSER_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
RUN bundle install

COPY . /usr/app
