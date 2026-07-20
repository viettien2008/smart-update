#!/usr/bin/env bash

# Smart Update Manager v3.0.0
# curl -fsSL https://raw.githubusercontent.com/viettien2008/smart-update/main/install.sh | bash

set -euo pipefail

REPO="https://raw.githubusercontent.com/viettien2008/smart-update/main"
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="/etc/smart-update"

# Colors
G='\033[0;32m'
R='\033[0;31m'
C='\033[0;36m'
B='\033[1m'
NC='\033[0m'

clear
echo ""
echo -e "${C}${B}╔══════════════════════════════════════════════════╗${NC}"
echo -e "${C}${B}║                                                  ║${NC}"
echo -e "${C}${B}║        SMART UPDATE MANAGER v3.0.0               ║${NC}"
echo -e "${C}${B}║        Trinh cai dat                            ║${NC}"
echo -e "${C}${B}║                                                  ║${NC}"
echo -e "${C}${B}╚══════════════════════════════════════════════════╝${NC}"
echo ""

# Check root
if [[ $EUID -ne 0 ]]; then
    echo -e "${R}  Loi: Chay voi quyen root${NC}"
    echo -e "  Su dung: ${B}sudo curl -fsSL ${REPO}/install.sh | bash${NC}"
    exit 1
fi

# Check curl
if ! command -v curl &> /dev/null; then
    echo -e "${R}  Loi: Can cai curl${NC}"
    exit 1
fi

# Install
echo -e "  ${C}[1/3]${NC} Dang tai script..."
curl -fsSL "${REPO}/smart-update" -o "${INSTALL_DIR}/smart-update" 2>/dev/null
chmod +x "${INSTALL_DIR}/smart-update"

echo -e "  ${C}[2/3]${NC} Dang thiet lap..."
mkdir -p "${CONFIG_DIR}" 2>/dev/null
touch /var/log/smart-update.log 2>/dev/null

echo -e "  ${C}[3/3]${NC} Hoan thanh!"
echo ""
echo -e "${G}${B}═══════════════════════════════════════════════════${NC}"
echo ""

# Run smart-update (triggers first-run setup)
exec smart-update
