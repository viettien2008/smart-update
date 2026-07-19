#!/usr/bin/env bash

# Smart Update Manager - One-line Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/viettien2008/smart-update/main/install.sh | bash

set -euo pipefail

REPO="https://raw.githubusercontent.com/viettien2008/smart-update/main"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/smart-update"
SCRIPT_NAME="smart-update"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}Smart Update Manager - Installer${NC}"
echo ""

# Check root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Error: This script must be run as root${NC}"
    echo "Usage: sudo curl -fsSL ${REPO}/install.sh | bash"
    exit 1
fi

# Check dependencies
for cmd in curl git; do
    if ! command -v "$cmd" &> /dev/null; then
        echo -e "${RED}Error: ${cmd} is required${NC}"
        exit 1
    fi
done

# Download script
echo "Downloading smart-update..."
curl -fsSL "${REPO}/${SCRIPT_NAME}" -o "${INSTALL_DIR}/${SCRIPT_NAME}"
chmod +x "${INSTALL_DIR}/${SCRIPT_NAME}"

# Create config directory
mkdir -p "${CONFIG_DIR}"

# Create services.conf if not exists
if [[ ! -f "${CONFIG_DIR}/services.conf" ]]; then
    cat > "${CONFIG_DIR}/services.conf" << 'CONF'
# Smart Update - Service Update Commands
# Format: CONTAINER_ID|SERVICE_NAME|UPDATE_COMMAND
# Example:
# 100|cloudflared|pct exec 100 -- yum update -y cloudflared
# 101|nginx|pct exec 101 -- dnf update -y nginx
CONF
fi

# Setup crontab (Monday 00:00)
if ! crontab -l 2>/dev/null | grep -q "smart-update"; then
    (crontab -l 2>/dev/null; echo "0 0 * * 1 ${INSTALL_DIR}/${SCRIPT_NAME} >>/var/log/smart-update.log 2>&1") | crontab -
    echo "Crontab added: Monday 00:00"
fi

# Create log file
touch /var/log/smart-update.log

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Usage:"
echo "  smart-update          # Interactive menu"
echo "  smart-update --help   # Show all options"
echo "  smart-update --list   # List configured services"
echo ""
echo "Config files:"
echo "  /etc/smart-update/services.conf"
echo "  /var/log/smart-update.log"
