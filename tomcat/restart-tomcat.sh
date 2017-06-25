#!/bin/bash
# restart nginx
kubectl delete configmap tomcatconfigmap
kubectl create configmap tomcatconfigmap --from-file=/opt/atlassian/tomcat/conf
kubectl delete deploy tomcat
kubectl apply -f tomcat.yaml
