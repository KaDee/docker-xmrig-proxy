FROM alpine AS builder

# Install Xmrig Proxy

RUN apk --no-cache upgrade \
 && apk --no-cache add git build-base cmake libuv-dev libmicrohttpd-dev openssl-dev util-linux-dev \
 && git clone https://github.com/xmrig/xmrig-proxy.git \
 && mkdir xmrig-proxy/build \
 && cd xmrig-proxy/build \
 && cmake -DCMAKE_BUILD_TYPE=Release .. \
 && make -j$(nproc)

FROM alpine

# Xmrig Proxy copy installation

RUN apk add --no-cache libuv libmicrohttpd util-linux

COPY --from=builder /xmrig-proxy/build/xmrig-proxy /usr/local/bin/xmrig-proxy

# Entrypoint and command

ENTRYPOINT [ "/usr/local/bin/xmrig-proxy" ]
CMD [ "--help" ]
