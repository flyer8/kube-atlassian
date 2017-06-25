###Deploying Atlassian stack (Jira, Confluence, Bitbucket, Bamboo) in Kubernetes cluster including PostgreSQL and Nginx Frontend

Kubernetes cluster was deployed in Azure cloud platform using Azure Container Service. 

The cluster consists of one master node and two agents nodes.

Please, clone the repository https://github.com/flyer8/kube-atlassian to /opt/atlassian directory of Kubernetes master node.

Directory contains Nginx revers proxy config and YAML scripts to deploy applications using Kubernetes components, such as Pods, Deployments, Services, PersistentVolumeClaim, Configmap.

Change directory and create Pod, Deployment, Service, persistentVolumeClaim (Storage) for PostgreSQL using postgres YAML scenario:
```
kubectl create -f postgres.yaml
```
Show status of all components::
```
kubectl get po,deploy,svc,pvc,cm --output=wide
```
Login to Postgres Pod, create users and databases (Jira for example):
```
kubectl exec -it postgres-3065983101-3vq8s -- /bin/bash
su - postgres
psql
CREATE USER admin WITH SUPERUSER PASSWORD 'admin';
CREATE DATABASE jiradb WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
```
Create or update Pods, Deployments, Services from Atlassian apps YAML scripts (Jira for example):
```
kubectl apply -f jira.yaml
```
Deploy Nginx reverse proxy:
Previously should create configMap for mapping Nginx config from the file to container.
```
kubectl create configmap nginxconfigmap --from-file=/opt/atlassian/nginx/default.conf

kubectl apply -f /opt/atlassian/nginx/nginx.yaml
```
If you want to scale Jira application, please execute:
```
kubectl scale deploy/jira --replicas=3
```
Applications installation and connecting to Database executed in the usual way according to the Atlassian manuals.
External IPs of apps we can see in the output of:
```
kubectl get svc --output=wide
```
To access via domain names should create "A" records in DNS zone or entries in /etc/hosts file on the local machine.
Also access to Atlassian apps via DNS names is described in configuration of Nginx reverse proxy:
https://github.com/flyer8/kube-atlassian/blob/master/nginx/default.conf

Thank you for your attention.