#!/bin/bash

set -e

curl https://bitcoin.org/laanwj-releases.asc -o laanwj-releases.asc
gpg --import laanwj-releases.asc

export BITCOIN_ASC=https://bitcoin.org/bin/bitcoin-core-$BITCOIN_VERSION/SHA256SUMS.asc
curl $BITCOIN_ASC -o SHA256SUMS.asc
RESULT=$(shasum -a 256 -c SHA256SUMS.asc 2>&1 | grep OK)

if [[ $RESULT != *"bitcoin-0.15.1-x86_64-linux-gnu.tar.gz: OK"* ]]; then
  exit 1;
fi
