# Chính sách Bảo mật

## Lỗ hổng

Báo cáo lỗ hổng bảo mật một cách có trách nhiệm.

## Các lưu ý Bảo mật

### Thực thi Script
- Script chạy với quyền root (cần cho pct commands)
- Các file config có quyền hạn chế (600)

### Sử dụng eval
- Dùng cho service update commands
- Chỉ thêm lệnh đáng tin cậy vào services.conf
- Validate input trước khi thêm

### File Language & Config
- Ngôn ngữ lưu tại /etc/smart-update/language
- Config lưu tại /etc/smart-update/config
- Cả hai có quyền hạn chế

### Logging
- Lệnh được ghi log tại /var/log/smart-update.log
- Không lưu thông tin nhạy cảm trong lệnh update

## Thực hành tốt nhất

1. Kiểm tra services.conf trước khi chạy
2. Test trên hệ thống không phải production
3. Backup containers trước khi update lớn
4. Dùng --list để kiểm tra cấu hình
5. Dùng setup wizard khi cài đặt lần đầu
