# xmjcraft

[![Docker pulls](https://img.shields.io/docker/pulls/valorad/xmjcraft.svg?style=flat-square)](https://hub.docker.com/r/valorad/xmjcraft/)
[![Image version](https://images.microbadger.com/badges/version/valorad/xmjcraft.svg)](https://microbadger.com/images/valorad/xmjcraft "xmjcraft Version")
[![Image Info](https://images.microbadger.com/badges/image/valorad/xmjcraft.svg)](https://microbadger.com/images/valorad/xmjcraft "xmjcraft Image")

xmjCraft is a micro world for XiaoMaJias.

However, it can also be a good template to boost up other new projects. Why? Because it's so tiny (or a big hello world), with very simple data model, which is very easy to understand. Moreover, it implements the state-of-the-art design patterns, as recent as possible, including much good practice of coding (maybe biased but whatever).

For ex:

Server:
- Centralized config management
- Service dependency injection
- Data query generalization
- Pure GraphQL implementation
- etc.

## Deployment

First make a MongoDB up and running. 

Then follow [example.yaml](./server/src/configs/example.yaml) and create your own config files.

Next, you may deploy the server by using Kubernetes or manually running Docker.

## Kubernetes

Example kubernetes config files are provided at `k8s` folder. Change if necessary.

``` shell
# Load the main config into a config map
kubectl create configmap xmjcraft-main --from-file=/path/to/main.yaml

# Load the DB config (username + password) into a secret
kubectl create secret generic xmjcraft-db --from-file=/path/to/secrets.yaml

# Create a deployment
kubectl create -f k8s/xmjcraft.deploy.yaml --record --save-config

# Create a service
kubectl create -f k8s/xmjcraft.svc.yaml --save-config

# Expose the service by executing on master node:
kubectl port-forward svc/xmjcraft 13000:3000 --address 0.0.0.0

```

Visit port 3000 of your master node and it will work.

### Docker

Put the config files in `configs` folder. After that, run:

``` shell
docker run -d \
--network my-vps-main-network \
--name xmjcraft-c1 \
-v /path/2/configs:/www/xmjcraft/configs \
valorad/xmjcraft
```

## Development
[Server Development](./server/README.md##Development)