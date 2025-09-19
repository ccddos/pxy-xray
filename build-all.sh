#!/bin/bash

# 构建脚本 - 一次性构建三个不同配置的xray镜像
# 使用方法: ./build-all.sh [镜像名前缀]

set -e

# 设置默认镜像名前缀
IMAGE_PREFIX=${1:-"pxy-xray"}

echo "开始构建 xray 镜像..."
echo "镜像前缀: $IMAGE_PREFIX"
echo ""

# 构建基础配置镜像 (xhttp)
echo "🔨 构建基础配置镜像 (xhttp)..."
docker build --build-arg CONFIG_TYPE=base -t "${IMAGE_PREFIX}:base" -t "${IMAGE_PREFIX}:xhttp" .
echo "✅ 基础配置镜像构建完成: ${IMAGE_PREFIX}:base"
echo ""

# 构建httpupgrade配置镜像
echo "🔨 构建 httpupgrade 配置镜像..."
docker build --build-arg CONFIG_TYPE=up -t "${IMAGE_PREFIX}:up" -t "${IMAGE_PREFIX}:httpupgrade" .
echo "✅ httpupgrade 配置镜像构建完成: ${IMAGE_PREFIX}:up"
echo ""

# 构建reality配置镜像
echo "🔨 构建 reality 配置镜像..."
docker build --build-arg CONFIG_TYPE=reality -t "${IMAGE_PREFIX}:reality" .
echo "✅ reality 配置镜像构建完成: ${IMAGE_PREFIX}:reality"
echo ""

echo "🎉 所有镜像构建完成!"
echo ""
echo "构建的镜像:"
echo "  - ${IMAGE_PREFIX}:base (xhttp协议)"
echo "  - ${IMAGE_PREFIX}:up (httpupgrade协议)"  
echo "  - ${IMAGE_PREFIX}:reality (xhttp + reality)"
echo ""
echo "使用示例:"
echo "  docker run -d -p 8843:8843 ${IMAGE_PREFIX}:base"
echo "  docker run -d -p 8843:8843 ${IMAGE_PREFIX}:up"
echo "  docker run -d -p 8843:8843 ${IMAGE_PREFIX}:reality"