# Smart Update Manager

Tự động cập nhật Proxmox VE Host + tất cả LXC containers.

## Tính năng v3.0.0

- **Multi-language**: Tieng Viet / English
- **Setup Wizard**: Mac dinh / Tuy chinh / Cai dat sau
- **Auto-detect services**: Tu dong phat hien services trong LXC
- **Health check**: Kiem tra tai nguyen he thong
- **Backup**: Tu dong backup LXC truoc khi update
- **Dry run**: Chay thu, khong update thuc
- **Auto-update script**: Cap nhat script tu GitHub
- **Docker/Podman**: Tu dong pull image moi

## Cài đặt

```bash
curl -fsSL https://raw.githubusercontent.com/viettien2008/smart-update/main/install.sh | sudo bash
```

## Sử dụng

```bash
smart-update              # Menu interactive
smart-update --help       # Xem tat ca options
smart-update --health     # Kiem tra suc khoe
smart-update --dryrun     # Chay thu
smart-update --backup     # Backup LXC
smart-update --detect     # Phat hien services
smart-update --update-script  # Cap nhat script
```

## License

MIT License
