FROM alpine:3.19

RUN apk add --no-cache ca-certificates tzdata curl netcat-openbsd

ARG VERSION=1.0.0
RUN curl -L -o /usr/local/bin/stratum \
    https://github.com/BitcoincashII/forge-pool-umbrel/releases/download/v${VERSION}/stratum && \
    chmod +x /usr/local/bin/stratum

EXPOSE 3333

ENTRYPOINT ["stratum"]
