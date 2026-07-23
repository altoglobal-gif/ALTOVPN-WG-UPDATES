# ALTOVPN-WG V.2026.29.1.2

Corrective profile-list and safe-update patch.

## Fixed

- Restored the Main Window profile list. A Web UI state reference in `V.2026.29.1.1` stopped JavaScript before profile buttons were created even though the profile store remained intact.
- Existing `%APPDATA%\ALTOVPN-WG\profiles.json`, managed `.conf` files, and WireGuard keys are preserved without migration or regeneration.
- Full desktop updates now disconnect all active tunnels before downloading or scheduling the installer.
- Connect, manual reconnect, permanent-connect recovery, and automatic reconnect cannot reactivate a tunnel during update maintenance.
- Repeated update clicks are serialized so downloads and helper scheduling cannot overlap.
- Installer failures now report `Update failed` accurately.

## QA and artifact

- Inline Web UI JavaScript syntax check passed.
- 21 Windows host automated tests passed.
- Host, helper, and Modern Installer Release builds passed at `V.2026.29.1.2`.
- `ALTOVPN-WG-V.2026.29.1.2-win-x64-setup.exe`
- Size: `173124431` bytes
- SHA256: `CF9D80592FC2C264195AECC9FD57566F42E2CF0962C8EAD345E33E4B7CF8F0C3`
- Modern Installer EXE only; no MSI and no new Git LFS.
