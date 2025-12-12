# 🚀 Hysteria2 (HY2) 一键安装脚本 · Debian/Ubuntu

此仓库提供 **Debian / Ubuntu** 系列系统的一键安装脚本，自动安装并配置 Hysteria2（HY2）加速协议。

支持功能：

- 自动安装 hysteria2
- 自动生成自签证书
- 自动写入配置文件
- 自动启动服务 & 设置开机自启
- 自动生成可直接导入的 `hysteria2://` 节点链接

---

## 📦 一键安装

在终端执行：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/heroyessj/Debian-hysteria2/main/install.sh)
```

---

## ⚙ 默认配置

| 项目 | 值 |
|------|------|
| 端口 | 45433 |
| 密码 |  |
| SNI | bing.com |
| ALPN | h3 |
| 伪装站 | https://bing.com |
| 节点格式 | hysteria2:// |

---

## 📌 节点示例（脚本执行后自动生成）

```
hysteria2://S123456j@服务器IP:45433/?sni=bing.com&alpn=h3&insecure=1#HY2
```

此链接可直接用于：

- v2rayN
- Nekobox
- Shadowrocket
- Passwall
- Hiddify
- Clash.Meta（需要手动写入）

---

## 📂 配置文件路径

```
/etc/hysteria/config.yaml
```

修改后重启：

```bash
systemctl restart hysteria-server
```

---

## 🎯 适用于

- NAT VPS
- 家宽旁路器
- IPv4 / IPv6 网络
- Debian / Ubuntu / Armbian

---

## ⭐ Star 本项目

如果本脚本对你有帮助，欢迎给个 **Star** 支持一下！
