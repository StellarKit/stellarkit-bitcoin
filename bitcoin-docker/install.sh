#!/bin/bash

if [ $BUILD_FROM_SRC -gt 0 ]
then
  git clone --depth 1 --branch 0.15 https://github.com/bitcoin/bitcoin
  cd bitcoin
  ./autogen.sh
  ./configure  --disable-tests --disable-wallet
  make -j 4
  make install
else
  # export for use in verify.sh
  export BITCOIN_VERSION=0.15.1

  BITCOIN_FILE_NAME=bitcoin-$BITCOIN_VERSION-x86_64-linux-gnu.tar.gz
  BITCOIN_URL=https://bitcoin.org/bin/bitcoin-core-$BITCOIN_VERSION/$BITCOIN_FILE_NAME

  curl $BITCOIN_URL -o $BITCOIN_FILE_NAME

  /verify.sh

  tar zxvf $BITCOIN_FILE_NAME
  cp bitcoin-$BITCOIN_VERSION/bin/* /usr/local/bin
fi

echo "\nDone installing stellar-bitcoin...\n"
