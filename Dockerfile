
# 定义全局构建参数
ARG CONFIG_TYPE=base

FROM scratch AS config-selector

# 复制所有配置文件到临时层并重命名
COPY server.jsonc /configs/server-base.jsonc
COPY server-up.jsonc /configs/server-up.jsonc  
COPY server-reality.jsonc /configs/server-reality.jsonc

FROM ghcr.io/xtls/xray-core:25.9.11

# 重新声明ARG以在此阶段使用
ARG CONFIG_TYPE=base

EXPOSE 8843

# 从配置选择层复制目标配置文件
COPY --from=config-selector /configs/server-${CONFIG_TYPE}.jsonc /usr/local/etc/xray/config.json

