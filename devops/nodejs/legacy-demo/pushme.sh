#!/bin/sh
eval $(minikube docker-env)
docker build -t nodejs-legacy-demo:1.0 .