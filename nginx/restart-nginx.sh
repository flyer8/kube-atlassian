#!/bin/bash
# restart nginx
kubectl delete configmap nginxconfigmap
kubectl create configmap nginxconfigmap --from-file=/opt/nginx/default.conf
kubectl delete deploy nginx
kubectl apply -f nginx.yaml
