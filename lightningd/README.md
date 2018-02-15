# siriuslabs/lightningd

A lightning docker image.

[![siriuslabs/lightningd][docker-pulls-image]][docker-hub-url] [![siriuslabs/lightningd][docker-stars-image]][docker-hub-url] [![siriuslabs/lightningd][docker-size-image]][docker-hub-url] [![siriuslabs/lightningd][docker-layers-image]][docker-hub-url]

## Tags

- ([Dockerfile](https://github.com/hbasria/dockerfiles/blob/master/lightningd/Dockerfile))

## Quick start

Requires that [Docker be installed](https://docs.docker.com/engine/installation/) on the host machine.

```
# Create some directory where your bitcoin data will be stored.
$ mkdir /home/youruser/lightning_data

$ docker run -it --rm \
   --env 'BITCOIN_RPC_HOST=bitcoind' \
   --env 'BITCOIN_RPC_USER=bitcoin' \
   --env 'BITCOIN_RPC_PASSWORD=password' \
   --env 'LIGHTNING_ALIAS=nodealias' \
   --env 'LIGHTNING_RGB=000000' \
   --env 'LIGHTNING_IPADDR=127.0.0.1' \
   --env 'LIGHTNING_DEBUG=debug' \
   --volume app-bitcoind-data:/home/lightning/.bitcoin \
   --volume app-lightningd-data:/home/lightning/.lightning \
   --link bitcoind:bitcoind \
   -p 9735:9735 \
   siriuslabs/lightningd

$ docker logs -f lightningd
[ ... ]
```

## Configuration

A custom `~/.lightning/config` file can be placed in the mounted data directory.
Otherwise, a default `~/.lightning/config` file will be automatically generated based
on environment variables passed to the container:

| name | default |
| ---- | ------- |
| BITCOIN_DATA | /home/lightning/.bitcoin |
| BITCOIN_RPC_HOST | 127.0.0.1 |
| BITCOIN_RPC_USER | bitcoin |
| BITCOIN_RPC_PASSWORD | password |
| BITCOIN_NETWORK | bitcoin |
| LIGHTNING_DATA | /home/lightning/.lightning |
| LIGHTNING_ALIAS | lightning_node |
| LIGHTNING_RGB | 000000 |
| LIGHTNING_IPADDR | 127.0.0.1 |
| LIGHTNING_DEBUG | info |

[docker-hub-url]: https://hub.docker.com/r/siriuslabs/lightningd
[docker-layers-image]: https://img.shields.io/imagelayers/layers/siriuslabs/lightningd/latest.svg?style=flat-square
[docker-pulls-image]: https://img.shields.io/docker/pulls/siriuslabs/lightningd.svg?style=flat-square
[docker-size-image]: https://img.shields.io/imagelayers/image-size/siriuslabs/lightningd/latest.svg?style=flat-square
[docker-stars-image]: https://img.shields.io/docker/stars/siriuslabs/lightningd.svg?style=flat-square