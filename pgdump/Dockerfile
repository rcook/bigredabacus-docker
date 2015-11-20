FROM rcook/ubuntu
MAINTAINER Richard Cook <rcook@rcook.org>

RUN apt-get install -y \
  ca-certificates \
  wget && \
  echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  apt-get update -y && \
  apt-get install -y postgresql-client && \
  apt-get clean -y

ENTRYPOINT ["/usr/bin/pg_dump"]

