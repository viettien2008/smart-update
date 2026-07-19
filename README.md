# Smart Update Manager

Tự động cập nhật Proxmox VE Host + tất cả LXC containers, bao gồm cả các dịch vụ đã cấu hình.

## Tính năng

- Hỗ trợ tiếng Việt và English (chọn khi chạy lần đầu)
- Setup Wizard: Mac dinh / Tuy chinh / Cai dat sau
- Tu dong phat hien services trong LXC containers
- Update OS packages cho host và tất cả containers
- Update service-specific (cloudflared, nginx, vaultwarden, v.v.)
- Interactive menu
- Logging đầy đủ
- Hỗ trợ Debian, Ubuntu, CentOS, AlmaLinux, Alpine, openSUSE
- Config file để them/sua/xoa service updates

## Cài đặt

```bash
# One-line install
curl -fsSL https://raw.githubusercontent.com/viettien2008/smart-update/main/install.sh | sudo bash
```

## Sử dụng

```bash
# Menu interactive
smart-update

# Xem help
smart-update --help

# Xem services
smart-update --list

# Them service
smart-update --add <CT_ID> <SERVICE_NAME> "<UPDATE_COMMAND>"

# Xoa service
smart-update --remove <CT_ID> <SERVICE_NAME>

# Tu dong phat hien services
smart-update --detect

# Doi ngon ngu
smart-update --lang vi   # Tieng Viet
smart-update --lang en   # English
```

## Cấu trúc files

```
/usr/local/bin/smart-update          # Script chính
/etc/smart-update/config             # Cau hinh
/etc/smart-update/services.conf      # Service updates
/etc/smart-update/language           # Ngon ngu da chon
/etc/update-lxcs.conf                # Exclude list (optional)
/var/log/smart-update.log            # Log file
```

## License

MIT License
