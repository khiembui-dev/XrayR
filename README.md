# 🚀 XrayR Auto Script - Bản Gọn - by Khiêm

Script Bash tối giản giúp **cài đặt nhanh XrayR với 2 node cố định (vmess + trojan)**, cấu hình tự động và có menu điều khiển đơn giản.

Tương thích với **NewV2board**.

---

## ⚡ Cách sử dụng nhanh

### 🖥️ SSH vào VPS và chạy lệnh sau:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/khiembui-dev/XrayR/main/xrayr-new)
```

---

## 📋 Tính năng chính

- ✅ Nhập nhanh Node ID cho vmess và trojan
- ✅ Tự động cài XrayR từ nguồn gốc chính thức
- ✅ Tạo sẵn file cấu hình `config.yml` với 2 node
- ✅ Tạo chứng chỉ mẫu nếu bạn chưa có TLS thật
- ✅ Sinh menu `/root/xrayr` điều khiển bằng tay

---

## 🧾 Những gì bạn cần chuẩn bị

| Trường           | Mô tả                                      |
|------------------|---------------------------------------------|
| **Node ID vmess**| ID của node vmess trên panel (default: 157) |
| **Node ID trojan**| ID của node trojan trên panel (default: 319)|

> 📌 Tất cả những thông tin còn lại sẽ được sinh mặc định, bạn có thể chỉnh sau trong `config.yml`

---

## 🗂 Cấu trúc file được tạo

| Đường dẫn                    | Mô tả                                |
|------------------------------|--------------------------------------|
| `/etc/XrayR/config.yml`     | File cấu hình chính chứa 2 node     |
| `/etc/XrayR/cert/*.cert/key`| Chứng chỉ TLS giả lập mẫu            |
| `/root/xrayr`               | Menu điều khiển: sửa – restart – xóa |

---

## 🧭 Menu điều khiển `/root/xrayr`

Chạy bằng:
```bash
./xrayr
```

Menu bao gồm:
```
====== XrayR Menu ======
1. Chỉnh sửa cấu hình (/etc/XrayR/config.yml)
2. Khởi động lại XrayR
3. Gỡ cài đặt XrayR
0. Thoát
```

---

## ✅ Ưu điểm bản gọn

- Dễ dùng, nhanh chóng, chỉ cần 2 ID node
- Không yêu cầu nhập domain, apikey mỗi lần
- Thích hợp cho triển khai nhanh hoặc test
- Có thể chỉnh thủ công lại `config.yml` sau nếu cần

---

## 👨‍💻 Tác giả & Dự án

- **Tác giả:** Khiêm  
- **GitHub repo:** [github.com/khiembui-dev/XrayR](https://github.com/khiembui-dev/XrayR)

> ⚠️ Script này sinh chứng chỉ và cấu hình mặc định. Hãy điều chỉnh lại cho phù hợp với hệ thống sản xuất thực tế nếu cần.
