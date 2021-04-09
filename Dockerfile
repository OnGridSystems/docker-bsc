FROM golang:1.15-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers git bash

# Temporarily pull a custom Go bundle
ADD https://golang.org/dl/go1.15.5.src.tar.gz /tmp/go.tar.gz
RUN (cd /tmp && tar -xf go.tar.gz)
RUN (cd /tmp/go/src && ./make.bash)
ENV PATH="/tmp/go/bin:${PATH}"

ADD . /go-ethereum
RUN cd /go-ethereum && make geth

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates curl jq tini
COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/
COPY bsc_mainnet /bsc_mainnet
COPY bsc_testnet /bsc_testnet
RUN geth --datadir /initialized_node_bsc_testnet init /bsc_testnet/genesis.json
RUN geth --datadir /initialized_node_bsc_mainnet init /bsc_mainnet/genesis.json
COPY entrypoint.sh /entrypoint.sh

EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["/entrypoint.sh"]
