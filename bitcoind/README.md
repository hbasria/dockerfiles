# siriuslabs/bitcoind

A bitcoin docker image.

[![siriuslabs/bitcoind][docker-pulls-image]][docker-hub-url] [![siriuslabs/bitcoind][docker-stars-image]][docker-hub-url] [![siriuslabs/bitcoind][docker-size-image]][docker-hub-url] [![siriuslabs/bitcoind][docker-layers-image]][docker-hub-url]

## Tags

- `0.15.1`, `0.15`, `latest` ([0.15/Dockerfile](https://github.com/hbasria/dockerfiles/blob/master/bitcoind/Dockerfile))

## Quick start

Requires that [Docker be installed](https://docs.docker.com/engine/installation/) on the host machine.

```
# Create some directory where your bitcoin data will be stored.
$ mkdir /home/youruser/bitcoin_data

$ docker run -d --name bitcoind \
   --env 'BITCOIN_RPC_USER=bitcoin' \
   --env 'BITCOIN_RPC_PASSWORD=password' \
   --volume /home/youruser/bitcoin_data:/home/bitcoin/.bitcoin \
   -p 8332:8332
   -p 8333:8333
   siriuslabs/bitcoind

$ docker logs -f bitcoind
[ ... ]
```

## Configuration

A custom `bitcoin.conf` file can be placed in the mounted data directory.
Otherwise, a default `bitcoin.conf` file will be automatically generated based
on environment variables passed to the container:

| name | default |
| ---- | ------- |
| BITCOIN_DATA | /home/bitcoin/.bitcoin |
| BITCOIN_RPC_USER | bitcoin |
| BITCOIN_RPC_PASSWORD | password |
| BITCOIN_RPC_ALLOW_IP | ::/0 |
| BITCOIN_PRINT_TO_CONSOLE | 1 |
| BITCOIN_DEBUG | info |

[docker-hub-url]: https://hub.docker.com/r/siriuslabs/bitcoind
[docker-layers-image]: https://img.shields.io/imagelayers/layers/siriuslabs/bitcoind/latest.svg?style=flat-square
[docker-pulls-image]: https://img.shields.io/docker/pulls/siriuslabs/bitcoind.svg?style=flat-square
[docker-size-image]: https://img.shields.io/imagelayers/image-size/siriuslabs/bitcoind/latest.svg?style=flat-square
[docker-stars-image]: https://img.shields.io/docker/stars/siriuslabs/bitcoind.svg?style=flat-square