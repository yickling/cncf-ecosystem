#!/bin/sh
eval $(minikube docker-env)
docker build -t nodejs-demo:1.0 .