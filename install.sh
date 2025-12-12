#!/bin/bash

set -e

echo "=== 安装 Hysteria2（HY2）开始 ==="

# 1. 安装 hy2
bash <(curl -fsSL https://get.hy2.sh/)

echo "=== 生成自签证书 ==="
openssl req -x509 -nodes -newkey ec:<(openssl ecparam -name prime256v1)   -keyout /etc/hysteria/server.key   -out /etc/hysteria/server.crt   -subj "/CN=bing.com" -days 36500

chown hysteria /etc/hysteria/server.key
chown hysteria /etc/hysteria/server.crt

echo "=== 写入 HY2 配置 ==="
cat << EOF > /etc/hysteria/config.yaml
listen: :45433

tls:
  cert: /etc/hysteria/server.crt
  key: /etc/hysteria/server.key

auth:
  type: password
  password: S123456j

masquerade:
  type: proxy
  proxy:
    url: https://bing.com
    rewriteHost: true
EOF

echo "=== 启动并设置开机自启 ==="
systemctl enable hysteria-server.service
systemctl restart hysteria-server.service

echo "=== HY2 服务状态 ==="
systemctl status hysteria-server.service --no-pager

# 获取服务器IP
SERVER_IP=$(curl -s ipv4.ip.sb || curl -s ifconfig.me || hostname -I | awk '{print $1}')

echo
echo "==============================================="
echo "  Hysteria2 安装完毕！以下是你的节点信息："
echo "==============================================="
echo
echo "地址   ：${SERVER_IP}"
echo "端口   ：45433"
echo "密码   ：S123456j"
echo "SNI    ：bing.com"
echo "ALPN   ：h3"
echo
echo "=== 正确的 Hysteria2 节点（可直接导入）==="
echo "hysteria2://S123456j@${SERVER_IP}:45433/?sni=bing.com&alpn=h3&insecure=1#HY2"
echo
echo "==============================================="
echo "全部完成！祝使用愉快！"
echo "==============================================="
