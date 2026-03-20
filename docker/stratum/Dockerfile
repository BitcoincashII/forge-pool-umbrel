FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    ca-certificates \
    tzdata \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

COPY stratum /usr/local/bin/stratum
COPY config.template.yaml /etc/forge/config.template.yaml
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /usr/local/bin/stratum /entrypoint.sh

EXPOSE 3333

ENTRYPOINT ["/entrypoint.sh"]
