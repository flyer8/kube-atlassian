#!/bin/bash
# restart nginx
kubectl delete configmap nginx-configmap
kubectl create configmap nginx-configmap --from-file=/mnt/storage/etc/nginx/conf.d/default.conf
kubectl delete deploy nginx
kubectl apply -f nginx.yaml
