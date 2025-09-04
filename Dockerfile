FROM ghcr.io/xtls/xray-core:25.8.3

EXPOSE 8843

COPY server.jsonc /usr/local/etc/xray/

