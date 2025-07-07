# XrayR Auto Script - by Khiêm

Script Bash tự động cài đặt, cập nhật và thêm node cho hệ thống **XrayR**, hỗ trợ các loại node như: **Vmess**, **Vless**, **Trojan**, và **Shadowsocks**. Tương thích với **V2board** và **NewV2board**.

---

## 🚀 Hướng dẫn sử dụng nhanh

### Bước 1: SSH vào VPS và chạy lệnh sau

```bash
bash <(curl -Ls https://raw.githubusercontent.com/khiembui-dev/XrayR/main/xrayr-thekhiem.sh)
```
🧩 Các chức năng chính
Khi chạy script, bạn sẽ thấy menu:

markdown
Sao chép
Chỉnh sửa
   1. Cài đặt
   2. update
   3. thêm node
1 – Cài đặt: Tải và cấu hình XrayR hoàn chỉnh, kèm chứng chỉ mẫu.

2 – Update: Cập nhật lại config.yml từ đầu.

3 – Thêm node: Thêm một node mới mà không ảnh hưởng node cũ.

📋 Thông tin cần nhập khi chạy
Trường	Ý nghĩa
Domain	Tên miền panel V2board (bỏ https://)
API Key	Khóa API lấy từ quản trị V2board
Node ID	ID node bạn tạo trong panel
Loại node	Vmess, Vless, Trojan hoặc Shadowsocks
Số lượng node	Tối đa 2 node/lần cài đặt

🛠 File & Đường dẫn quan trọng
Cấu hình: /etc/XrayR/config.yml

Chứng chỉ giả lập: /etc/XrayR/vpndata.crt và vpndata.key

Chạy lại XrayR: xrayr restart

📌 Ghi chú
Script tự sinh chứng chỉ fake để tránh lỗi TLS nếu bạn chưa có cert thật.

Có thể chỉnh sửa config.yml thủ công sau khi tạo xong.

Redis, Reality, Fallback… mặc định đang tắt – hãy bật nếu bạn cần nâng cao.

📫 Liên hệ & Credits
Tác giả: Khiêm
GitHub: github.com/khiembui-dev/XrayR

yaml
Sao chép
Chỉnh sửa
