FROM alpine:3.19

RUN apk add --no-cache ca-certificates tzdata curl

ARG VERSION=1.0.0
RUN curl -L -o /usr/local/bin/api \
    https://github.com/BitcoincashII/forge-pool-umbrel/releases/download/v${VERSION}/api && \
    chmod +x /usr/local/bin/api

EXPOSE 8080

ENTRYPOINT ["api"]
