#!/bin/bash
# restart tomcat
kubectl delete configmap tomcatconfigmap
kubectl create configmap tomcatconfigmap --from-file=/opt/atlassian/tomcat/conf
kubectl delete configmap managerconfigmap
kubectl create configmap managerconfigmap --from-file=/opt/atlassian/tomcat/manager
kubectl delete deploy tomcat
kubectl apply -f tomcat.yaml
