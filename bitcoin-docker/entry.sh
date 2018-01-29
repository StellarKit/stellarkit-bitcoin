#!/bin/bash

# bitcoin.conf needed for using bitcoin-cli to on the server

mkdir -p /root/.bitcoin
[[ -n $RPCUSER ]] && echo "rpcuser=${RPCUSER}" >> /root/.bitcoin/bitcoin.conf
[[ -n $RPCPASSWORD ]] && echo "rpcpassword=${RPCPASSWORD}" >> /root/.bitcoin/bitcoin.conf

bitcoind "$@"
