#!/bin/bash
kubectl create -f nginx-ingress-rc.yaml && \
kubectl create -f jenkins.yaml && \
kubectl create -f tomcat.yaml && \
kubectl create -f ci-secret.yaml && \
kubectl create -f ci-ingress.yaml
