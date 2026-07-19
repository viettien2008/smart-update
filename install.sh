#!/usr/bin/env bash

# Smart Update Manager v2.0.0 - Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/viettien2008/smart-update/main/install.sh | bash

set -euo pipefail

REPO="https://raw.githubusercontent.com/viettien2008/smart-update/main"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/smart-update"
SCRIPT_NAME="smart-update"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}Smart Update Manager v2.0.0 - Installer${NC}"
echo ""

if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}Error: Run as root${NC}"
    echo "Usage: sudo curl -fsSL ${REPO}/install.sh | bash"
    exit 1
fi

for cmd in curl; do
    if ! command -v "$cmd" &> /dev/null; then
        echo -e "${RED}Error: ${cmd} is required${NC}"
        exit 1
    fi
done

echo "Downloading smart-update..."
curl -fsSL "${REPO}/${SCRIPT_NAME}" -o "${INSTALL_DIR}/${SCRIPT_NAME}"
chmod +x "${INSTALL_DIR}/${SCRIPT_NAME}"

mkdir -p "${CONFIG_DIR}"

if [[ ! -f "${CONFIG_DIR}/services.conf" ]]; then
    cat > "${CONFIG_DIR}/services.conf" << 'CONF'
# Smart Update - Service Update Commands
# Format: CONTAINER_ID|SERVICE_NAME|UPDATE_COMMAND
CONF
fi

touch /var/log/smart-update.log

echo ""
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo "Run 'smart-update' to start setup wizard."
echo ""
echo "Usage:"
echo "  smart-update          # Interactive menu"
echo "  smart-update --help   # Show options"
