# Dockerized Nextcloud Server
This project provides a simple Docker setup for running a self-hosted **Nextcloud** server using **Apache**, **MySQL** with K8s and Helm.

## How It Works
1. Installs all necessary dependencies (Apache, PHP, MySQL, Redis, etc.).
2. Creates a MySQL database named `nextcloud` with user `nextclouduser`.
3. Downloads the latest release of Nextcloud.
4. Configures Apache with a custom virtual host.
5. Runs the container with Apache and MySQL started via `start.sh`.

## Getting Started
1. Clone the Repository
```bash
git clone https://github.com/your-username/nextcloud-docker.git
cd nextcloud-docker
```
2. Add Required Files
Make sure the following files are in the same directory as the Dockerfile:
```
1. nextcloud.conf: Apache virtual host configuration
2. start.sh: Startup script to launch Apache and MySQL inside the container
```
3. Build the Docker Image:
```bash
docker build -t nextcloud-image .
```
4. Run the Container
```
docker run -p 8080:80 nextcloud-image:latest
```
5. Access Nextcloud
```
http://[IP]:8080
```

## Default Credentials
Database: nextcloud

User: nextclouduser

Password: strong_password_here

```Note: Change the credentials in the Dockerfile before used in production.```

