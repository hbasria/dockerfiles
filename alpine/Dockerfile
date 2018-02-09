FROM alpine

MAINTAINER siriuslabs <info@siriuslabs.net>

RUN apk add --update --no-cache \
	ca-certificates \
	curl 

ENV GOSU_VERSION 1.10

RUN curl -Ls "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64" > /usr/local/bin/gosu \
	&& chmod +x /usr/local/bin/gosu

ENV ENVTPL_VERSION 0.2.3

RUN curl -Ls https://github.com/arschles/envtpl/releases/download/${ENVTPL_VERSION}/envtpl_linux_amd64 > /usr/local/bin/envtpl \
    && chmod +x /usr/local/bin/envtpl
