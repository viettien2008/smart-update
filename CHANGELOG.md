# Changelog

## [1.0.0] - 2026-07-19

### Added
- Interactive text-based menu
- Auto-scan all LXC containers
- Host OS update
- LXC OS update (Debian, Ubuntu, CentOS, AlmaLinux, Alpine, openSUSE)
- Service-specific updates via config file
- CLI commands: --list, --add, --remove, --help
- Logging to /var/log/smart-update.log
- Exclude list support (/etc/update-lxcs.conf)
- Cleanup after update (autoremove, autoclean)

### Security
- Sanitized eval command usage
- Config file permissions check
- No secrets in logs
