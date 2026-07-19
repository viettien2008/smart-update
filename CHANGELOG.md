# Changelog

## [2.0.0] - 2026-07-19

### Added
- Multi-language support (Tieng Viet / English)
- First-run setup wizard
- Auto-detect services in LXC containers
- Settings menu (Default/Custom/Later)
- Config file system
- `--lang` command to switch language
- `--detect` command for auto service detection

### Improved
- Better user experience with guided setup
- Cleaner menu structure
- Configurable options

## [1.0.0] - 2026-07-19

### Added
- Interactive text-based menu
- Auto-scan all LXC containers
- Host OS update
- LXC OS update (Debian, Ubuntu, CentOS, AlmaLinux, Alpine, openSUSE)
- Service-specific updates via config file
- CLI commands: --list, --add, --remove, --help
- Logging to /var/log/smart-update.log
- Exclude list support
- Cleanup after update

### Security
- Sanitized eval command usage
- Config file permissions check
- No secrets in logs
