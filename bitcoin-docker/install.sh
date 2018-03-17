#!/bin/bash

if [ $BUILD_FROM_SRC -ne 0 ]
then
  git clone --depth 1 --branch 0.15 https://github.com/bitcoin/bitcoin
  cd bitcoin
  ./autogen.sh
  ./configure  --disable-tests --disable-wallet
  make -j 4
  make install
else
  BITCOIN_VERSION=0.16.0
  BITCOIN_FILE_NAME=bitcoin-$BITCOIN_VERSION-x86_64-linux-gnu.tar.gz
  BITCOIN_URL=https://bitcoin.org/bin/bitcoin-core-$BITCOIN_VERSION/$BITCOIN_FILE_NAME

  curl $BITCOIN_URL -o $BITCOIN_FILE_NAME

  # verify the download
  curl https://bitcoin.org/laanwj-releases.asc -o releases.asc
  gpg --import releases.asc

  BITCOIN_ASC=https://bitcoin.org/bin/bitcoin-core-$BITCOIN_VERSION/SHA256SUMS.asc
  curl $BITCOIN_ASC -o SHA256SUMS.asc

  RESULT=$(shasum -a 256 -c SHA256SUMS.asc 2>&1 | grep OK)
  echo $RESULT

  if [[ $RESULT != "$BITCOIN_FILE_NAME: OK" ]]
  then
    exit 1;
  fi

  # decompress and install
  tar zxvf $BITCOIN_FILE_NAME
  cp bitcoin-$BITCOIN_VERSION/bin/* /usr/local/bin
fi

echo "\nDone installing stellar-bitcoin...\n"
