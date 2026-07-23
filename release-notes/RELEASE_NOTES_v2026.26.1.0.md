# ALTOVPN-WG V.2026.26.1.0 Release Notes

Release date: 2026-06-23

## Versioning

- App version: `V.2026.26.1.0`
- Assembly/file version: `2026.26.1.0`
- MSI ProductVersion: `226.26.10`
- Runtime: `win-x64`
- Installer: `ALTOVPN-WG-V.2026.26.1.0-win-x64.msi`

## Major Changes

- Tray Settings actions now work for auto-disconnect modes, selected profile diagnose/reconnect, diagnostics export, update check, and restart.
- Tray Exit now asks for confirmation before closing ALTOVPN-WG completely.
- Importing WireGuard configs now validates required fields and previews the profile before saving.
- Diagnostics export creates a redacted support report with app, WireGuard, profile, health, DNS, route, update, and log data.
- Connection detail now includes DNS health, route health, tunnel mode, latest handshake, runtime endpoint, latency, and auto reconnect count.
- Notifications were added for important connect/disconnect, reconnect, update, and health events.
- Common WireGuard/helper/config/update errors now show clearer user-facing messages.

## Security Notes

- Diagnostic exports redact `PrivateKey` and `PresharedKey`.
- The installer is published as a full MSI update for the Windows desktop client.
- The update checker verifies file size and SHA256 before helper-backed MSI installation.
- Helper service installation remains admin-required.

## Build Artifact

Expected installer path:

```text
releases/v2026.26.1.0/ALTOVPN-WG-V.2026.26.1.0-win-x64.msi
```

SHA256:

```text
6C77ADDB62098FC47A45588A518EA3C1DC2C702997F2155493C37DE97D1E26AF
```
