#!/bin/bash
set -e

echo "==============================="
echo " XRAYR + HYSTERIA2 AUTO INSTALL"
echo "==============================="

read -p "👉 Nhập NODE ID (NewV2Board): " NODE_ID

# ===== CONFIG CỐ ĐỊNH =====
PANEL_URL="https://panel.kingvpn.vn"
API_KEY="khiemdeptrailaso1"
PORT="12156"
CERT_DIR="/etc/XrayR/cert"

echo "[1/6] Cài XrayR..."
bash <(curl -Ls https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh)

echo "[2/6] Cài dependency..."
apt update -y
apt install -y openssl ufw curl

echo "[3/6] Tạo SSL self-signed..."
mkdir -p $CERT_DIR
openssl req -x509 -nodes -newkey rsa:2048 \
  -keyout $CERT_DIR/privkey.pem \
  -out $CERT_DIR/fullchain.pem \
  -days 3650 \
  -subj "/C=VN/ST=HN/L=HN/O=TikTok/CN=www.tiktok.com"

echo "[4/6] Ghi config XrayR..."
cat > /etc/XrayR/config.yml <<EOF
Log:
  Level: warning

ConnectionConfig:
  Handshake: 4
  ConnIdle: 30
  UplinkOnly: 2
  DownlinkOnly: 4
  BufferSize: 64

Nodes:
  -
    PanelType: "NewV2board"
    ApiConfig:
      ApiHost: "$PANEL_URL"
      ApiKey: "$API_KEY"
      NodeID: $NODE_ID
      NodeType: Hysteria2
      Timeout: 30
      SpeedLimit: 0
      DeviceLimit: 0

    ControllerConfig:
      ListenIP: 0.0.0.0
      SendIP: 0.0.0.0
      UpdatePeriodic: 60
      EnableDNS: false
      DNSType: AsIs

      HysteriaConfig:
        Mode: server
        Listen: :$PORT
        TLS:
          Cert: $CERT_DIR/fullchain.pem
          Key: $CERT_DIR/privkey.pem
          SNI: www.tiktok.com
        Obfs:
          Type: none
EOF

echo "[5/6] Mở firewall..."
ufw allow $PORT/udp
ufw allow $PORT/tcp
ufw --force enable

echo "[6/6] Khởi động XrayR..."
systemctl restart XrayR
systemctl enable XrayR

echo "==============================="
echo " ✅ HOÀN TẤT"
echo " 👉 Kiểm tra log: journalctl -u XrayR -f"
echo "==============================="
