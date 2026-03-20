FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    ca-certificates \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

COPY api /usr/local/bin/api
RUN chmod +x /usr/local/bin/api

EXPOSE 8080

ENTRYPOINT ["api"]
