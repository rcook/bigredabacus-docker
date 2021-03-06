# Inspired by https://github.com/seapy/dockerfiles/

FROM rcook/ruby
MAINTAINER Richard Cook <rcook@rcook.org>

RUN apt-get update

# Install Node.js
RUN apt-get install -qq -y nodejs

# Intall software-properties-common for add-apt-repository
RUN apt-get install -qq -y software-properties-common

# Install nginx
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -qq -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

# Add default nginx config
ADD nginx-sites.conf /etc/nginx/sites-enabled/default

# Update Bundler sources and install Foreman
RUN gem sources --remove https://rubygems.org/ && \
  gem sources --add http://$(cat /tmp/host_ip.txt):4444 && \
  gem install foreman

# Install the latest postgresql lib for pg gem
RUN apt-get install \
  ca-certificates \
  wget && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get install -y --force-yes libpq-dev

# Install Rails App
WORKDIR /app
ONBUILD ADD Gemfile /app/Gemfile
ONBUILD ADD Gemfile.lock /app/Gemfile.lock
ONBUILD RUN bundle install --without development test
ONBUILD ADD . /app

# Add default Unicorn config
ADD unicorn.rb /app/config/unicorn.rb

# Add default Foreman config
ADD Procfile /app/Procfile

ENV RAILS_ENV production

CMD bundle exec rake assets:precompile && foreman start -f Procfile

