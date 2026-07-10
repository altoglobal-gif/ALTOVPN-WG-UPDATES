# Update ALTOVPN-WG from an older version

Use this one-time recovery path for clients older than `V.2026.29.1.2`, or whenever an updater reports an MSI, PowerShell, installer-type, or mismatched-version error.

## Install Safe Main once

1. Disconnect every VPN tunnel.
2. Download [ALTOVPN-WG V.2026.29.1.3 Windows Setup](https://github.com/altoglobal-gif/ALTOVPN-WG-UPDATES/releases/download/v2026.29.1.3/ALTOVPN-WG-V.2026.29.1.3-win-x64-setup.exe).
3. Close ALTOVPN-WG completely.
4. Run the downloaded setup EXE as Administrator.
5. Open ALTOVPN-WG and confirm the native installed version is `V.2026.29.1.3` (not only a Web UI label).

Profiles and private keys remain in the existing ALTOVPN-WG profile store. Safe Main then checks the separate moving stable channel automatically. If a version higher than `V.2026.29.1.3` exists, install that second update normally.

`V.2026.29.0.3` was never published as a desktop installer, and `V.2026.28.1.2` was a Web UI-only patch. If either number is visible while Windows file properties show an older native host, trust the native host version and use this manual recovery.

## Verification

- File: `ALTOVPN-WG-V.2026.29.1.3-win-x64-setup.exe`
- Size: `175965352` bytes
- SHA256: `8BCE137AC2F80991E020AD30DCBF8061C28AC92DC7659E0772DAF9A5CAB071B7`
- [Release notes](RELEASE_NOTES_v2026.29.1.3.md)
- MSI: not used
- Git LFS: not used
