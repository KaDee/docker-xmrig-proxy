FROM alpine AS builder

ENV REPO_URI https://github.com/xmrig/xmrig-proxy.git
ENV DIST_PATH /xmrig-proxy

RUN apk upgrade \
 && apk add --no-cache ca-certificates git openssl-dev build-base cmake libuv-dev libmicrohttpd-dev util-linux-dev \
 && mkdir /build

WORKDIR /build

RUN git clone $REPO_URI xmrig-proxy \
 && mkdir -p xmrig-proxy/build \
 && cd xmrig-proxy/build \
 && cmake .. \
 && make \
 && cd ../.. \
 && mkdir -p $DIST_PATH \
 && cp xmrig-proxy/build/xmrig-proxy $DIST_PATH

FROM alpine

RUN adduser -S -D -H -h /xmrig-proxy xmrig && \
    apk update && \
    apk upgrade && \
    apk add --no-cache libuv libmicrohttpd util-linux

COPY --from=builder /xmrig-proxy/ /xmrig-proxy/

USER xmrig

WORKDIR /xmrig-proxy

ENTRYPOINT [ "./xmrig-proxy" ]
CMD [ "--help" ]
