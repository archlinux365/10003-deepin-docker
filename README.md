# 10003-deepin-docker

## 目标

1. docker镜像
1. ci镜像配置用户和基础工具链
1. ssh docker服务
1. vnc桌面
1. vscode server
1. linux管理面板

## 文件夹说明

1. beige 构建基础rootfs
1. beige-root 继承 beige镜像 安装配置
1. beige-www 继承 beige-root镜像 安装配置

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

## 3 www安装一些常见包以及配置

```
docker pull gnuhub/10003-deepin-docker-beige-www:latest
docker run -it gnuhub/10003-deepin-docker-beige-www:latest bash
```

## 4 开发环境 快速启动

```
docker compose up -d 
# or
docker-compose up -d
```

1. 访问ssh
1. 访问管理面板
1. 访问vscode server
1. 访问桌面

## 5 账户密码 ssh以及桌面登陆 linux 面板

1. root -> opendde
1. www -> opendde
1. 管理面板 --> 