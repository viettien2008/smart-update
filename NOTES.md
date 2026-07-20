# Developer Notes - Kinh nghiệm phát triển

## v1.0.0 → v2.0.0 → v3.0.0

### Kinh nghiệm 1: Whiptail không hoạt động trong non-interactive shell
- Whiptail cần TTY thực sự
- Giải pháp: Dùng text-based menu với `read` thay vì whiptail

### Kinh nghiệm 2: Regex trong bash phức tạp hơn tưởng
- `[[ =~ ]]` không hoạt động tốt với một số ký tự
- Giải pháp: Dùng `grep -qE` thay vì bash regex

### Kinh nghiệm 3: eval cần cẩn thận
- `eval` có thể gây command injection
- Giải pháp: Validate input trước khi eval

### Kinh nghiệm 4: GitHub Token permissions
- Fine-grained token cần chọn đúng quyền "Contents: Write"
- Classic token đơn giản hơn (chọn scope "repo")

### Kinh nghiệm 5: SSH key tốt hơn token
- SSH key không cần quản lý expiration
- Set 1 lần, dùng mãi
- An toàn hơn token

### Kinh nghiệm 6: Script structure
- Tách biệt: Language, Config, Features, Menu
- Mỗi feature là 1 function riêng
- Dễ maintain và thêm feature mới

### Kinh nghiệm 7: Backup trước khi update
- Luôn backup config trước khi update
- Dùng vzdump của PVE nếu có
- Fallback: backup config file nếu không có vzdump

### Kinh nghiệm 8: Dry run rất hữu ích
- Cho người dùng xem trước sẽ update gì
- Giảm rủi ro update nhầm
- Implement: DRY_RUN flag + check trong mỗi function

### Kinh nghiệm 9: Health check nhanh
- CPU: load average / cores
- Memory: used / total
- Disk: df usage %
- LXC: status + load

### Kinh nghiệm 10: Docker/Podman detection
- Kiểm tra `which podman` trước, rồi `which docker`
-podman ps --format để lấy tên container
- Pull image trước khi restart service
