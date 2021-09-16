# xmrig-proxy docker container

[![Docker Stars](https://img.shields.io/docker/stars/kadeeke/xmrig-proxy.svg)](https://hub.docker.com/r/kadeeke/xmrig-proxy/)[![Docker Pulls](https://img.shields.io/docker/pulls/kadeeke/xmrig-proxy.svg)](https://hub.docker.com/r/kadeeke/xmrig-proxy/)[![Docker Build Status](https://img.shields.io/docker/build/kadeeke/xmrig-proxy.svg)](https://hub.docker.com/r/kadeeke/xmrig-proxy/)

This container allows running [xmrig-proxy](https://github.com/xmrig/xmrig-proxy) in a docker container.

## Docker

This docker image in available on [docker hub](https://hub.docker.com/r/kadeeke/xmrig-proxy/).

## Example

```bash
# run a dockerized miner
# -o and all following arguments are passed to the xmrig-proxy miner process
docker run --rm -it -d -p <PUBLIC_PORT>:3333 --name xmrig-proxy kadeeke/xmrig-proxy -o <POOL_URL>:<POOL_PORT> -u <YOUR_WALLET> -p x --bind 0.0.0.0:3333
```

If you want to know all the possible options, run:

```bash
docker run --rm -it kadeeke/xmrig-proxy
```

You could also use a config file:

```bash
docker run --rm -it -d -p <PUBLIC_PORT>:3333 --name xmrig-proxy -v ./config.json:/usr/local/bin/config.json kadeeke/xmrig-proxy
```

## Building

The [Dockerfile](https://github.com/kadeeke/xmrig-proxy-docker/blob/master/Dockerfile) uses [multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/) for building the `xmrig-proxy` app.

So building is as simple as:

```bash
docker build -t <your docker tag> .
```
