### Deploying Atlassian stack (Jira, Confluence, Bitbucket, Bamboo) in Kubernetes cluster including PostgreSQL DB and Nginx Frontend

Please, clone the repo to /opt/atlassian directory.

Create Pod, Depployment, Service, persistentVolumeClaim (Storage) for PostgreSQL:
```
kubectl create -f postgres.yaml
```
Show status of Pods, Deployments, Services, persistentVolumeClaim:
```
kubectl get po,deploy,svc,pvc --output=wide
```
Login to Postgres Pod, create users and databases (Jira for example):
```
kubectl exec -it postgres-3065983101-3vq8s -- /bin/bash
su - postgres
psql
CREATE USER admin WITH SUPERUSER PASSWORD 'admin';
CREATE DATABASE jiradb WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
```
Create or update Pod, Depployment, Service for Jira:
```
kubectl apply -f jira.yaml
```
Deploy Nginx reverse proxy:
```
kubectl create configmap nginxconfigmap --from-file=/opt/atlassian/nginx/default.conf
kubectl apply -f /opt/atlassian/nginx/nginx.yaml
```
If you want to scale Jira application, please execute:
```
kubectl scale deploy/jira --replicas=3
```
