FROM debian:jessie

MAINTAINER Hasan Basri <hbasria@gmail.com>

ENV GOSU_VERSION 1.10

RUN set -ex; \
	apt-get update; \
	apt-get install -y ca-certificates curl wget xz-utils; \
	dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
	wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
	export GNUPGHOME="$(mktemp -d)"; \
	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
	gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu; \
	rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc; \
	chmod +x /usr/local/bin/gosu; \
	gosu nobody true; \
	rm -rf /var/lib/apt/lists/*;

ENV CONFD_VERSION 0.11.0

ENV CONFD_OPTS '--backend=env --onetime'

RUN curl -SL "https://github.com/kelseyhightower/confd/releases/download/v$CONFD_VERSION/confd-$CONFD_VERSION-linux-amd64" > /usr/bin/confd \
    && chmod +x /usr/bin/confd \
    && mkdir -p /etc/confd/{conf.d,templates}
