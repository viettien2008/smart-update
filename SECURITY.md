# Security Policy

## Vulnerabilities

If you discover a security vulnerability, please report it responsibly.

## Security Considerations

### Script Execution
- Script runs as root (required for pct commands)
- Ensure /usr/local/bin/smart-update has correct permissions (755)
- Config files should be owned by root

### eval Command Usage
- The script uses `eval` for service update commands
- Only trusted commands should be added to services.conf
- Do not add commands from untrusted sources

### Logging
- Commands are logged to /var/log/smart-update.log
- Ensure log file has appropriate permissions
- Do not store sensitive data in update commands

### Network
- Script does not make external network calls (except for package updates)
- Service update commands may make external calls - verify before adding

## Best Practices

1. Review services.conf before running updates
2. Test on non-production systems first
3. Backup containers before major updates
4. Monitor logs after running updates
5. Use --list to verify configuration before updating
