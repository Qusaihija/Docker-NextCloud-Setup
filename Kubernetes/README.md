# Kubernetes Deployment

## Usage

1.start Minikube:
```
minikube start
```

2.get the IP:
```
minikube ip
```

3.Deploy application:
```
kubectl apply -f nextcloud-deployment.yaml
```

4.access the application at:
```
http://[minikube-IP]:30080
```
