# Installation
- Add repos
```bash
helm repo add nextcloud https://nextcloud.github.io/helm/
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```
- Install
```bash
helm install nextcloud-mysql bitnami/mysql -f mysql-values.yaml
helm install nextcloud bitnami/nextcloud -f nextcloud-values.yaml
```