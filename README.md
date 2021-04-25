# Binance Smart Chain Node docker image (unofficial)

This is the Git repo of the OnGrid (unofficial) Docker image for [bsc node](https://github.com/binance-chain/bsc).
See the official [README.md](https://github.com/binance-chain/bsc/blob/master/README.md) and [White Paper]
(http://binance.org/en#smartChain) for details.

## Build

```sh
docker build -t bsc_node:latest .
```

## Run

Mainnet #56

```sh
docker run -v /node:/node -d -p 8545:8545 -p 30303:30303 -p 30303:30303/udp --name bsc_node bsc_node:latest
```

Testnet #97

```sh
docker run -e NET_ID=97 -v /node:/node -d -p 8545:8545 -p 30303:30303 -p 30303:30303/udp --name bsc_node bsc_node:latest
```

## License

The docker configuration and scripts developed by OnGrid Systems are licensed under the
[GNU Lesser General Public License v3.0](https://www.gnu.org/licenses/lgpl-3.0.en.html),
also included in our repository in the `COPYING.LESSER` file.

The bsc library (i.e. all code outside of the `cmd` directory) is licensed under the
[GNU Lesser General Public License v3.0](https://www.gnu.org/licenses/lgpl-3.0.en.html),
also included in our repository in the `COPYING.LESSER` file.

The bsc binaries (i.e. all code inside of the `cmd` directory) is licensed under the
[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html), also
included in our repository in the `COPYING` file.
