FROM ubuntu:latest as builder

ADD apt-build /apt-build
RUN chmod +x /apt-build
RUN /apt-build

RUN git clone --depth 1 --branch 0.15 https://github.com/bitcoin/bitcoin \
	  && cd bitcoin \
		&& ./autogen.sh \
		&& ./configure  --disable-tests --disable-wallet \
		&& make -j 4 \
		&& make install


FROM ubuntu:latest

COPY --from=builder /usr/local/bin/bitcoind /usr/local/bin/bitcoind

ADD apt-server /apt-server
RUN chmod +x /apt-server
RUN /apt-server

EXPOSE 8332 8333 18332 18333

ENTRYPOINT ["bitcoind"]
