#!/bin/bash
# restart tomcat
kubectl delete configmap tomcatconfigmap
kubectl create configmap tomcatconfigmap --from-file=conf/
kubectl delete configmap managerconfigmap
kubectl create configmap managerconfigmap --from-file=manager/
kubectl delete deploy tomcat
kubectl apply -f tomcat.yaml
