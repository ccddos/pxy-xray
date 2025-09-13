FROM ghcr.io/xtls/xray-core:latest

EXPOSE 8843

COPY server.jsonc /usr/local/etc/xray/

