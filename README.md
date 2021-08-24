# go-static-web
```
go静态web服务，支持docker部署
```

## 运行
```
方式1：
    go命令直接启动服务： go run main.go -addr=8080 -path=./web

方式2： 打包后再启动服务
    打linux包：
        GOOS=linux GOARCH=amd64 go build -o output/go-static-web main.go
        启动服务： ./output/go-static-web -addr=8080 -path=./web
    
    打windows包：
        CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o output/go-static-web.exe main.go  
        启动服务： ./output/go-static-web.exe -addr=8080 -path=./web

    打mac包：
        GOOS=darwin GOARCH=amd64 go build -o output/go-static-web-mac main.go
        启动服务： ./output/go-static-web-mac -addr=8080 -path=./web
    

docker部署：
    cd go-static-web
    docker image build -t mygostaticwebimg .
    docker run -it --name mygostaticweb01 -p 8080:8080 -d mygostaticwebimg:latest
    docker exec -it mygostaticweb01 sh

```

## 浏览器访问
```
    http://127.0.0.1:8080
    或者 
    http://localhost:8080
    或者
    http://服务器ip:8080

```