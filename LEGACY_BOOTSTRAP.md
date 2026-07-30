# Update ALTOVPN-WG from an older version

Use this final fallback only for native clients older than `V.2026.28.1.1`, or when the in-place updater cannot start after retrying with every VPN tunnel disconnected.

## Install the current Full Setup once

1. Disconnect every VPN tunnel.
2. Download [ALTOVPN-WG V.2026.31.0.0 Full Setup](https://github.com/altoglobal-gif/ALTOVPN-WG-UPDATES/releases/download/v2026.31.0.0/ALTOVPN-WG-V.2026.31.0.0-win-x64-setup.exe).
3. Close ALTOVPN-WG completely.
4. Run the downloaded setup EXE as Administrator.
5. Open ALTOVPN-WG and confirm the native desktop version is `V.2026.31.0.0`.

Profiles and private keys remain in the existing ALTOVPN-WG profile store. Full Setup may replace the helper only because this path is reserved for missing, unusable, or very old helpers. It also installs the pinned official WireGuard for Windows package when WireGuard is missing.

`V.2026.29.0.3` was never published as a desktop installer, and `V.2026.28.1.2` was a Web UI-only patch. If either number is visible while Windows file properties show an older native host, trust the native host version and use this manual recovery.

## Verification

- File: `ALTOVPN-WG-V.2026.31.0.0-win-x64-setup.exe`
- Size: `178979235` bytes
- SHA256: `1CEB3388D476052F1D0A2AD9631A09718171988C99547CD0AB49D83A5BCE8F53`
- [Release notes](release-notes/RELEASE_NOTES_V.2026.31.0.0.md)
- MSI: not used
- Git LFS: not used
