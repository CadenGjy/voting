#!/bin/bash
docker login -u {username} -p {pwd} {registerurl}

docker-compose -f ./docker-compose-ci-javaworker.yml up -d
docker pull harbor-bj.devopshub.cn/docker-training/redis:alpine
docker tag harbor-bj.devopshub.cn/docker-training/redis:alpine {registerurl}/redis:alpine
docker push {registerurl}/redis:alpine
docker pull harbor-bj.devopshub.cn/docker-training/postgres:9.4
docker tag harbor-bj.devopshub.cn/docker-training/postgres:9.4 {registerurl}/postgres:9.4
docker push {registerurl}/postgres:9.4 
