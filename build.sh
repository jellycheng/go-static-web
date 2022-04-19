#!/bin/bash
bin_abs_path=`cd $(dirname $0); pwd`
cd $bin_abs_path
docker build -f ./Dockerfile -t 10.20.1.2:8189/web/mygostaticwebimg:v1 .
docker push 10.20.1.2:8189/web/mygostaticwebimg:v1


