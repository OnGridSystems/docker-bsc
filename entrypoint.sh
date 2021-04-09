#!/bin/sh
echo "Running BSC Geth..."
cp -r /initialized_node_bsc_testnet/* /node/
/usr/local/bin/geth --config /bsc_testnet/config.toml --datadir /node --networkid 97
