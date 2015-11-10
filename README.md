# Richard's Dockerfiles

## Basic usage

The following steps describe a Rails app with the following features:

* Recent Ruby
* Recent Rails
* Recent Unicorn/Foreman/nginx
* Geminabox-based Rubygems proxy to speed up deployment

### Create `rcook/squid-deb-proxy` image

```bash
$ pushd squid-deb-proxy
$ docker build -t rcook/squid-deb-proxy .
$ popd
```

### Create `rcook/ruby` image

```bash
$ pushd ruby
$ docker build -t rcook/ruby .
$ popd
```

### Create `rcook/geminabox` image

```bash
$ pushd geminabox
$ docker build -t rcook/geminabox .
$ popd
```

### Create `rcook/rails-nginx-unicorn` image

```bash
$ pushd rails-nginx-unicorn
$ docker build -t rcook/rails-nginx-unicorn .
$ popd
```

### Configure Rails app

* Add `unicorn` gem in app's `Gemfile`
* Add `Dockerfile` to app project using following as base:
```text
FROM rcook/rails-nginx-unicorn
MAINTAINER Richard Cook <rcook@rcook.org>

EXPOSE 80
```

### Build app's Docker image

```bash
$ docker build -t rcook/testapp .
```

### Run app container

```bash
$ docker run -d -p 3333:80 -e SECRET_KEY_BASE=secretkey rcook/testapp
```
## Licence

MIT License
