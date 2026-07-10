# Update ALTOVPN-WG from an older version

Use this one-time recovery path for clients older than `V.2026.28.1.1`, or whenever a legacy updater reports an MSI, PowerShell, or installer-type error.

## Install Safe Main once

1. Disconnect every VPN tunnel.
2. Download [ALTOVPN-WG V.2026.29.1.3 Windows Setup](https://github.com/altoglobal-gif/ALTOVPN-WG-UPDATES/releases/download/v2026.29.1.3/ALTOVPN-WG-V.2026.29.1.3-win-x64-setup.exe).
3. Close ALTOVPN-WG completely.
4. Run the downloaded setup EXE as Administrator.
5. Open ALTOVPN-WG and confirm version `V.2026.29.1.3`.

Profiles and private keys remain in the existing ALTOVPN-WG profile store. Safe Main then checks the separate moving stable channel automatically. If a version higher than `V.2026.29.1.3` exists, install that second update normally.

## Verification

- File: `ALTOVPN-WG-V.2026.29.1.3-win-x64-setup.exe`
- Size: `175965352` bytes
- SHA256: `8BCE137AC2F80991E020AD30DCBF8061C28AC92DC7659E0772DAF9A5CAB071B7`
- [Release notes](RELEASE_NOTES_v2026.29.1.3.md)
- MSI: not used
- Git LFS: not used
