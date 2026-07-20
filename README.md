# Smart Update Manager

Tự động cập nhật Proxmox VE Host + tất cả LXC containers.

## Tính năng v3.0.0

- **Đa ngôn ngữ**: Tiếng Việt / English
- **Setup Wizard**: Mặc định / Tùy chỉnh / Thiết lập sau
- **Tự động phát hiện dịch vụ**: Phát hiện services trong LXC
- **Kiểm tra sức khỏe**: Kiểm tra tài nguyên hệ thống
- **Sao lưu**: Tự động backup LXC trước khi update
- **Chạy thử**: Xem trước, không update thực
- **Tự cập nhật script**: Cập nhật script từ GitHub
- **Docker/Podman**: Tự động pull image mới

## Cài đặt

```bash
curl -fsSL https://raw.githubusercontent.com/viettien2008/smart-update/main/install.sh | sudo bash
```

## Sử dụng

```bash
smart-update              # Menu tương tác
smart-update --help       # Xem tất cả tùy chọn
smart-update --health     # Kiểm tra sức khỏe
smart-update --dryrun     # Chạy thử
smart-update --backup     # Sao lưu LXC
smart-update --detect     # Phát hiện dịch vụ
smart-update --update-script  # Cập nhật script
```

## License

MIT License
