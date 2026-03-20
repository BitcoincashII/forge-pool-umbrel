FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    ca-certificates \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

COPY stratum /usr/local/bin/stratum
COPY config.yaml /etc/forge/config.yaml
RUN chmod +x /usr/local/bin/stratum

EXPOSE 3333

ENTRYPOINT ["stratum", "-config", "/etc/forge/config.yaml"]
