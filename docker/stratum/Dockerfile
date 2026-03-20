FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /stratum ./cmd/stratum

FROM alpine:3.19

RUN apk add --no-cache ca-certificates tzdata

COPY --from=builder /stratum /usr/local/bin/stratum
COPY configs/config.yaml /etc/forge/config.yaml

EXPOSE 3333

ENTRYPOINT ["stratum", "-config", "/etc/forge/config.yaml"]
