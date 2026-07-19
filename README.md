# Smart Update Manager

Script tự động cập nhật Proxmox VE Host + tất cả LXC containers, bao gồm cả các dịch vụ đã cấu hình.

## Tính năng

- Tự động quét tất cả LXC containers (kể cả container mới)
- Update OS packages cho host và tất cả containers
- Update service-specific (cloudflared, nginx, vaultwarden, telecloud, v.v.)
- Interactive menu để dễ sử dụng
- Logging đầy đủ
- Hỗ trợ nhiều OS: Debian, Ubuntu, CentOS, AlmaLinux, Alpine, openSUSE
- Config file để thêm/sửa/xóa service updates

## Yêu cầu

- Proxmox VE 7.x hoặc mới hơn
- Bash 4.0+
- whiptail (cho menu interactive)

## Cài đặt

```bash
# Clone hoặc copy script
git clone https://github.com/yourusername/smart-update.git
cd smart-update
chmod +x smart-update

# Copy vào hệ thống
sudo cp smart-update /usr/local/bin/
sudo mkdir -p /etc/smart-update

# Tạo crontab (00:00 Thứ Hai hàng tuần)
echo "0 0 * * 1 /usr/local/bin/smart-update >>/var/log/smart-update.log 2>&1" | sudo crontab -
```

## Sử dụng

### Menu interactive
```bash
smart-update
```

### CLI commands
```bash
# Xem danh sách services
smart-update --list

# Thêm service update
smart-update --add <CT_ID> <SERVICE_NAME> "<UPDATE_COMMAND>"

# Xóa service update
smart-update --remove <CT_ID> <SERVICE_NAME>

# Xem help
smart-update --help
```

## Cấu trúc files

```
/usr/local/bin/smart-update          # Script chính
/etc/smart-update/services.conf      # Config service updates
/etc/update-lxcs.conf                # Exclude list (optional)
/var/log/smart-update.log            # Log file
```

## Ví dụ cấu hình services.conf

```bash
# Format: CONTAINER_ID|SERVICE_NAME|UPDATE_COMMAND
100|cloudflared|pct exec 100 -- yum update -y cloudflared
101|nginx|pct exec 101 -- dnf update -y nginx
102|vaultwarden|pct exec 102 -- podman pull ghcr.io/dani-garcia/vaultwarden:latest && pct exec 102 -- systemctl restart vaultwarden
```

## License

MIT License
