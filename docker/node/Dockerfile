FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Download BCH2 node binaries
ARG BCH2_VERSION=1.0.0
RUN wget -q https://github.com/AustEcon/bitcoincashii/releases/download/v${BCH2_VERSION}/bitcoincashii-${BCH2_VERSION}-x86_64-linux-gnu.tar.gz \
    && tar -xzf bitcoincashii-${BCH2_VERSION}-x86_64-linux-gnu.tar.gz \
    && mv bitcoincashii-${BCH2_VERSION}/bin/* /usr/local/bin/ \
    && rm -rf bitcoincashii-${BCH2_VERSION}*

RUN mkdir -p /root/.bch2

EXPOSE 8332 8333

ENTRYPOINT ["bitcoincashIId"]
CMD ["-printtoconsole", "-prune=1000"]
