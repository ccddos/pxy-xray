# pxy-xray

基于 Xray-core 的多协议代理服务器 Docker 镜像。

## 支持的协议配置

- **base (xhttp)**: 基础 xhttp 协议配置
- **up (httpupgrade)**: HTTP upgrade 协议配置  
- **reality**: xhttp + Reality 混淆配置

## 快速开始

### 方式1: 一键构建所有镜像

```bash
# 构建所有配置的镜像
./build-all.sh

# 或指定自定义镜像名前缀
./build-all.sh my-xray
```

### 方式2: 单独构建特定配置

```bash
# 构建基础配置 (xhttp)
docker build --build-arg CONFIG_TYPE=base -t pxy-xray:base .

# 构建 httpupgrade 配置
docker build --build-arg CONFIG_TYPE=up -t pxy-xray:up .

# 构建 reality 配置
docker build --build-arg CONFIG_TYPE=reality -t pxy-xray:reality .
```

## 运行容器

```bash
# 运行基础配置
docker run -d -p 8843:8843 pxy-xray:base

# 运行 httpupgrade 配置
docker run -d -p 8843:8843 pxy-xray:up

# 运行 reality 配置
docker run -d -p 8843:8843 pxy-xray:reality
```

## 配置文件

- `server.jsonc`: 基础 xhttp 协议配置
- `server-up.jsonc`: HTTP upgrade 协议配置
- `server-reality.jsonc`: xhttp + Reality 混淆配置

## 注意事项

1. 请根据需要修改配置文件中的 UUID 和路径
2. Reality 配置需要修改目标网站和私钥
3. 所有配置默认监听 8843 端口