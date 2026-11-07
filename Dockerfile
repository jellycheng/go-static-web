FROM golang:1.22-alpine AS builder

ARG GOPROXY=https://goproxy.cn,direct
ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 \
    GOPROXY=${GOPROXY}

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY main.go ./
RUN go build -trimpath -ldflags="-s -w" -o /out/go-static-web .

FROM alpine:3.20

RUN adduser -D -u 10001 appuser

COPY --from=builder /out/go-static-web /usr/local/bin/go-static-web
COPY web /web

USER appuser

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/go-static-web"]
CMD ["-addr=8080", "-path=/web"]
