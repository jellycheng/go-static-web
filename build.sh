#!/bin/bash
bin_abs_path=`cd $(dirname $0); pwd`
cd $bin_abs_path

docker build -f ./Dockerfile -t mygostaticwebimg:v1 .


