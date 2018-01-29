FROM ubuntu:xenial as builder

ENV BUILD_FROM_SRC false

ADD apt-build /apt-build
RUN chmod +x /apt-build
RUN /apt-build

# gets run in install.sh
ADD verify.sh /verify.sh
RUN chmod +x /verify.sh

ADD install.sh /
RUN chmod +x /install.sh
RUN /install.sh


# -----------------------
FROM ubuntu:xenial

COPY --from=builder /usr/local/bin/bitcoind /usr/local/bin/bitcoind
COPY --from=builder /usr/local/bin/bitcoin-cli /usr/local/bin/bitcoin-cli

ADD apt-server /apt-server
RUN chmod +x /apt-server
RUN /apt-server

ADD entry.sh /entry.sh
RUN chmod +x /entry.sh

EXPOSE 8332 8333 18332 18333

ENTRYPOINT ["/entry.sh"]
