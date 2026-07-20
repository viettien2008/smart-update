#!/usr/bin/env bash

# Smart Update Manager v3.0.0 - Trình cài đặt
# Sử dụng: curl -fsSL https://raw.githubusercontent.com/viettien2008/smart-update/main/install.sh | bash

set -euo pipefail

REPO="https://raw.githubusercontent.com/viettien2008/smart-update/main"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/smart-update"
SCRIPT_NAME="smart-update"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}Smart Update Manager v3.0.0 - Trình cài đặt${NC}"
echo ""

if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Lỗi: Chạy với quyền root${NC}"
    echo "Sử dụng: sudo curl -fsSL ${REPO}/install.sh | bash"
    exit 1
fi

for cmd in curl; do
    if ! command -v "$cmd" &> /dev/null; then
        echo -e "${RED}Lỗi: Cần cài ${cmd}${NC}"
        exit 1
    fi
done

echo "Đang tải smart-update..."
curl -fsSL "${REPO}/${SCRIPT_NAME}" -o "${INSTALL_DIR}/${SCRIPT_NAME}"
chmod +x "${INSTALL_DIR}/${SCRIPT_NAME}"

mkdir -p "${CONFIG_DIR}"

if [[ ! -f "${CONFIG_DIR}/services.conf" ]]; then
    cat > "${CONFIG_DIR}/services.conf" << 'CONF'
# Smart Update - Lệnh cập nhật dịch vụ
# Định dạng: CONTAINER_ID|TEN_DICH_VU|LENH_CAP_NHAT
CONF
fi

touch /var/log/smart-update.log

echo ""
echo -e "${GREEN}Cài đặt hoàn tất!${NC}"
echo ""
echo "Chạy 'smart-update' để bắt đầu."
