# Inspired by https://github.com/chulkilee/geminabox-docker/

FROM rcook/ruby
MAINTAINER Richard Cook <rcook@rcook.org>

ENV APP_HOME /opt/geminabox

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY artifacts $APP_HOME

RUN bundle install

ENV RUBYGEMS_PROXY=true
CMD bundle exec rackup --host 0.0.0.0 --port 9292
EXPOSE 9292

VOLUME $APP_HOME/data

