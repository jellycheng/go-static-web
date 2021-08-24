FROM golang:1.17.0 AS builder

MAINTAINER jelly <42282367@qq.com>

ENV GOPATH /go
ENV GO111MODULE on
ENV CGO_ENABLED=0
ENV GOPROXY=https://goproxy.cn/

WORKDIR /go/src/go-static-web
COPY ./main.go .
COPY ./web ./web

# 打包 RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o output/go-static-web main.go
RUN GOOS=linux GOARCH=amd64 go build -o output/go-static-web main.go
#CMD ["./output/go-static-web", "-addr=8080", "-path=./web"]

FROM alpine:3.14.1
COPY ./web /web
# 从builder镜像中把文件拷贝到根目录
COPY --from=builder /go/src/go-static-web/output/go-static-web /
CMD ["/go-static-web", "-addr=8080", "-path=./web"]

