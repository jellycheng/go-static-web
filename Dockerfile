FROM golang:1.17.0 AS builder

MAINTAINER jelly <42282367@qq.com>

ENV GOPATH /go \
    GO111MODULE on \
    CGO_ENABLED=0 \
    GOPROXY=https://goproxy.cn/

WORKDIR /go/src/go-static-web
COPY ./main.go .
COPY ./web ./web

# 打包
RUN GOOS=linux GOARCH=amd64 go build -o output/go-static-web main.go
CMD ["./output/go-static-web", "-addr=8080", "-path=./web"]
