# Security Policy

## Vulnerabilities

Report security issues responsibly.

## Security Considerations

### Script Execution
- Script runs as root (required for pct commands)
- Config files have restricted permissions (600)

### eval Command Usage
- Used for service update commands
- Only trusted commands should be in services.conf
- Input validation on --add command

### Language & Config Files
- Language preference stored in /etc/smart-update/language
- Config stored in /etc/smart-update/config
- Both have restricted permissions

### Logging
- Commands logged to /var/log/smart-update.log
- Do not store sensitive data in update commands

## Best Practices

1. Review services.conf before running
2. Test on non-production systems first
3. Backup containers before major updates
4. Use --list to verify configuration
5. Use setup wizard for initial configuration
