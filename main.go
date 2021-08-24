package main

import (
	"fmt"
	"net/http"
	"flag"
)
var (
	addr = flag.String("addr", "8080", "指定监听端口，默认8080")
	webPath = flag.String("path", "./web", "设置静态文件目录，默认./web")
)

func main()  {
	flag.Parse()
	listenAddr := ":8080"
	if *addr != "" {
		listenAddr = fmt.Sprintf(":%s", *addr)
	}
	listenPath := "./web"
	if *webPath != "" {
		listenPath = *webPath
	}

	fmt.Println(fmt.Sprintf("监听端口：%s, 监听目录：%s", listenAddr, listenPath))

	http.ListenAndServe(listenAddr, http.FileServer(http.Dir(listenPath)))

}
