https://github.com/nginxinc/kubernetes-ingress/tree/master/examples/complete-example

Deploying:
```
kubectl create -f cafe-ingress-rc.yaml
kubectl create -f coffee.yaml
kubectl create -f tea.yaml
kubectl create -f cafe-secret.yaml
kubectl create -f cafe-ingress.yaml
```
Show status:
```
kubectl get all,ing,secret -o wide
```
Show nginx config inside the pod:
```
kubectl exec -it nginx-ingress-rc-8xgff -- cat /etc/nginx/conf.d/default-cafe-ingress.conf
```
