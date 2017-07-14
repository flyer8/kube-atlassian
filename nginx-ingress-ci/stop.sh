#!/bin/bash
kubectl delete rc nginx-ingress-rc && \
kubectl delete rc,svc jenkins && \
kubectl delete rc,svc tomcat && \
kubectl delete secrets ci-secret && \
kubectl delete ing ci-ingress
