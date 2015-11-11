# Inspired by https://github.com/chulkilee/geminabox-docker/

FROM rcook/ruby
MAINTAINER Richard Cook <rcook@rcook.org>

RUN route -n | awk '/^0.0.0.0/ {print $2}' > /tmp/host_ip.txt
RUN echo "HEAD /" | nc -q 1 `cat /tmp/host_ip.txt` 8000 | grep squid-deb-proxy \
  && (echo "Acquire::http::Proxy \"http://$(cat /tmp/host_ip.txt):8000\";" > /etc/apt/apt.conf.d/30proxy) \
  && (echo "Acquire::http::Proxy::ppa.launchpad.net DIRECT;" >> /etc/apt/apt.conf.d/30proxy) \
  || echo "No squid-deb-proxy detected on docker host"

ENV APP_HOME /opt/geminabox

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY artifacts $APP_HOME

RUN bundle install

ENV RUBYGEMS_PROXY=true
CMD bundle exec rackup --host 0.0.0.0 --port 9292
EXPOSE 9292

VOLUME $APP_HOME/data

