FROM siriuslabs/alpine

MAINTAINER Hasan Basri <hbasria@gmail.com>

RUN apk add --update --no-cache \
		python3 \
		tzdata \
		&& python3 -m ensurepip \
		&& rm -rf /usr/lib/python*/ensurepip \
		&& pip3 install --upgrade pip setuptools virtualenv \
		&& if [ ! -e /usr/bin/python ]; then ln -s /usr/bin/python3 /usr/bin/python ; fi \
		&& if [ ! -e /usr/bin/pip ]; then ln -s /usr/bin/pip3 /usr/bin/pip ; fi \
		&& rm -r /root/.cache
