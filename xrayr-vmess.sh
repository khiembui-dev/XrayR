#!/bin/bash
read -p "NODE ID VMess (default 157): " node_id_vm
node_id_vm=${node_id_vm:-157}

echo "[•] Đang cài đặt XrayR..."
bash <(curl -Ls https://raw.githubusercontent.com/wyx2685/XrayR-release/master/install.sh)

echo "[•] Đang tạo cấu hình /etc/XrayR/config.yml..."
mkdir -p /etc/XrayR

cat >/etc/XrayR/config.yml <<EOF
Log:
  Level: none
Nodes:
  -
    PanelType: "NewV2board"
    ApiConfig:
      ApiHost: "https://panel.kingvpn.vn"
      ApiKey: "khiemdeptrailaso1"
      NodeID: $node_id_vm
      NodeType: V2ray
      Timeout: 30
    ControllerConfig:
      DeviceOnlineMinTraffic: 100
EOF

echo "[•] Tạo menu điều khiển /root/xrayr..."
cat >/root/xrayr <<'MENU'
#!/bin/bash
while true; do
  clear
  echo "====== XrayR Menu ======"
  echo "1. Chỉnh sửa cấu hình (/etc/XrayR/config.yml)"
  echo "2. Khởi động lại XrayR"
  echo "3. Gỡ cài đặt XrayR"
  echo "0. Thoát"
  echo "========================"
  read -p "Chọn một tùy chọn: " choice
  case $choice in
    1) nano /etc/XrayR/config.yml ;;
    2) XrayR restart || systemctl restart XrayR ;;
    3) XrayR uninstall ;;
    0) exit ;;
    *) echo "Lựa chọn không hợp lệ!" && sleep 1 ;;
  esac
done
MENU
chmod +x /root/xrayr

echo "[•] Đang khởi động lại dịch vụ XrayR..."
XrayR restart || systemctl restart XrayR

echo -e "\n✅ Đã hoàn tất cài đặt và cấu hình Node VMess!"
