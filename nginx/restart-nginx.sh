#!/bin/bash
# restart nginx
kubectl delete configmap nginx-cm
kubectl create configmap nginx-cm --from-file=default.conf
kubectl delete deploy nginx
kubectl apply -f nginx-base.yaml
