# 10003-deepin-docker

## 目标

1. docker镜像
1. ci镜像配置用户和基础工具链
1. ssh docker服务
1. vnc桌面
1. vscode server

## 1 beige 干净纯净rootfs

```
docker pull gnuhub/10003-deepin-docker-beige:latest
docker run -it gnuhub/10003-deepin-docker-beige:latest bash
```

## 2 root用户 安装一些常见包以及配置

```
docker pull gnuhub/10003-deepin-docker-beige-root:latest
docker run -it gnuhub/10003-deepin-docker-beige-root:latest bash
```
