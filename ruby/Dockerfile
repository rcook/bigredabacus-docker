FROM ubuntu:14.04
MAINTAINER Richard Cook <rcook@rcook.org>

# Install Ruby dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y \
  build-essential \
  curl \
  git \
  git-core \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libyaml-dev \
  libxml2-dev \
  libxslt1-dev \
  sqlite3 \
  wget \
  zlib1g-dev

# Install ruby-install
RUN cd /tmp && \
  wget -O ruby-install-0.4.3.tar.gz https://github.com/postmodern/ruby-install/archive/v0.4.3.tar.gz && \
  tar -xzvf ruby-install-0.4.3.tar.gz && \
  cd ruby-install-0.4.3/ && \
  make install

# Install MRI Ruby 2.2.3
RUN ruby-install ruby 2.2.3

# Add Ruby binaries to PATH
ENV PATH /opt/rubies/ruby-2.2.3/bin:$PATH

# Add options to gemrc
RUN echo "gem: --no-document" > ~/.gemrc

# Install bundler
RUN gem install bundler

