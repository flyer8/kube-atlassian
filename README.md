## Deploying Atlassian stack (Jira, Confluence, Bitbucket, Bamboo) in Kubernetes

Create a database for JIRA (for example)
```
CREATE USER admin WITH SUPERUSER PASSWORD 'admin';
CREATE DATABASE jiradb WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
```
or
```
createdb -E UNICODE -l C -T template0 jiradb
```

Create or apply Depployment, Service, Pod for Jira
```
kubectl apply -f jira.yaml
```

Show status of Pods, Deployments, Services
```
kubectl get po,deploy,svc --output=wide
```
