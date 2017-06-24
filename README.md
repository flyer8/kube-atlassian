### Deploying Atlassian stack (Jira, Confluence, Bitbucket, Bamboo) in Kubernetes cluster including PostgreSQL DB and Nginx Frontend

Create Depployment, Service, Pod and persistentVolumeClaim (Storage) for PostgreSQL:
```
kubectl create -f postgres.yaml
```
Show status of Pods, Deployments, Services, persistentVolumeClaim:
```
kubectl get po,deploy,svc,pvc --output=wide
```
Login to Postgres Pod and create users and databases (Jira for example):
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
To scale the application execute:
```
kubectl scale deploy/jira --replicas=3
```
Deploy Nginx revers proxy:
```
kubectl create configmap nginxconfigmap --from-file=/opt/atlassian/nginx/default.conf
kubectl apply -f /opt/atlassian/nginx.yaml
```
