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

Follow the [example.yaml](./server/src/configs/example.yaml), and create the config files, then put them in the `configs` folder. After that, 

### Docker

``` shell
docker run -d \
--network my-vps-main-network \
--name xmjcraft-c1 \
-v /path/2/configs:/www/xmjcraft/configs \
valorad/xmjcraft
```

## Development
[Server Development](./server/README.md##Development)