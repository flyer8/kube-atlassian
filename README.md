### Deploying Atlassian stack (Jira, Confluence, Bitbucket, Bamboo) in Kubernetes 
### including PostgreSQL DB and Nginx LB

Create Depployment, Service, Pod and persistentVolumeClaim (Storage) for PostgreSQL:
```
kubectl apply -f postgres.yaml
```
Login to Postgres Pod (Example):
```
kubectl exec -it postgres-3065983101-3vq8s -- /bin/bash
```
Create users and databases (Jira for example):
```
su - postgres
psql
CREATE USER admin WITH SUPERUSER PASSWORD 'admin';
CREATE DATABASE jiradb WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
```
or
```
createdb -E UNICODE -l C -T template0 jiradb
```
Create or update  Pod, Depployment, Service for Jira:
```
kubectl apply -f jira.yaml
```
Show status of Pods, Deployments, Services, persistentVolumeClaim:
```
kubectl get po,deploy,svc,pvc --output=wide
```
To scale the application execute:
```
kubectl scale deploy/jira --replicas=3
```
