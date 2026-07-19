# Test Cases

## Pre-requisites
- Proxmox VE host with LXC containers
- Root access
- Test containers (non-production)

## Test 1: Script Installation
```bash
# Verify script is installed
which smart-update
ls -la /usr/local/bin/smart-update
```

## Test 2: Help Command
```bash
smart-update --help
# Expected: Shows usage information
```

## Test 3: List Services (Empty)
```bash
smart-update --list
# Expected: Shows "No services.conf found" or empty list
```

## Test 4: Add Service
```bash
smart-update --add 100 cloudflared "echo test"
smart-update --list
# Expected: Shows CT 100 | cloudflared | echo test
```

## Test 5: Remove Service
```bash
smart-update --remove 100 cloudflared
smart-update --list
# Expected: CT 100 entry removed
```

## Test 6: Check Updates
```bash
# From menu, select option 8
# Expected: Shows host packages and LXC containers
```

## Test 7: Update Host Only
```bash
# From menu, select option 2
# Expected: Updates host packages
```

## Test 8: Update LXC Only
```bash
# From menu, select option 3
# Expected: Updates all LXC containers
```

## Test 9: Full Update
```bash
# From menu, select option 1
# Expected: Updates host + all LXC containers
```

## Test 10: Crontab
```bash
crontab -l | grep smart-update
# Expected: Shows cron entry for Monday 00:00
```

## Test 11: Log File
```bash
ls -la /var/log/smart-update.log
# Expected: Log file exists
```

## Test 12: Services Config
```bash
ls -la /etc/smart-update/services.conf
# Expected: Config file exists
```

## Automated Test Script
```bash
#!/bin/bash
echo "=== Smart Update Test Suite ==="

# Test 1: Script exists
echo -n "Test 1: Script exists... "
if [[ -x /usr/local/bin/smart-update ]]; then
    echo "PASS"
else
    echo "FAIL"
fi

# Test 2: Help works
echo -n "Test 2: Help works... "
if smart-update --help >/dev/null 2>&1; then
    echo "PASS"
else
    echo "FAIL"
fi

# Test 3: Config directory exists
echo -n "Test 3: Config directory exists... "
if [[ -d /etc/smart-update ]]; then
    echo "PASS"
else
    echo "FAIL"
fi

# Test 4: Services.conf exists
echo -n "Test 4: Services.conf exists... "
if [[ -f /etc/smart-update/services.conf ]]; then
    echo "PASS"
else
    echo "FAIL"
fi

# Test 5: List command works
echo -n "Test 5: List command works... "
if smart-update --list >/dev/null 2>&1; then
    echo "PASS"
else
    echo "FAIL"
fi

echo "=== Tests Complete ==="
```
