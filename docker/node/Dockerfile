FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY bitcoincashIId /usr/local/bin/
COPY bitcoincashII-cli /usr/local/bin/

RUN chmod +x /usr/local/bin/bitcoincashII* && mkdir -p /root/.bch2

EXPOSE 8332 8333

ENTRYPOINT ["bitcoincashIId"]
CMD ["-printtoconsole", "-prune=1000"]
