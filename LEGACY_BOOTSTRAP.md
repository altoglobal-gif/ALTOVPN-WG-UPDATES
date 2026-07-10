# Update ALTOVPN-WG from an older version

Use this final fallback only for native clients older than `V.2026.28.1.1`, or when the in-place updater cannot start after retrying with every VPN tunnel disconnected.

## Install the in-place bridge once

1. Disconnect every VPN tunnel.
2. Download [ALTOVPN-WG V.2026.29.1.8 Full Setup](https://github.com/altoglobal-gif/ALTOVPN-WG-UPDATES/releases/download/v2026.29.1.8/ALTOVPN-WG-V.2026.29.1.8-win-x64-setup.exe).
3. Close ALTOVPN-WG completely.
4. Run the downloaded setup EXE as Administrator.
5. Open ALTOVPN-WG and confirm the native desktop version is `V.2026.29.1.8`.

Profiles and private keys remain in the existing ALTOVPN-WG profile store. Full setup may replace the helper only because this path is reserved for missing, unusable, or very old helpers.

`V.2026.29.0.3` was never published as a desktop installer, and `V.2026.28.1.2` was a Web UI-only patch. If either number is visible while Windows file properties show an older native host, trust the native host version and use this manual recovery.

## Verification

- File: `ALTOVPN-WG-V.2026.29.1.8-win-x64-setup.exe`
- Size: `175977640` bytes
- SHA256: `E50A3627BBD80BA83F6CE908FC69FC16B762828523286CAEEBBF51548BC035B2`
- [Release notes](RELEASE_NOTES_v2026.29.1.8.md)
- MSI: not used
- Git LFS: not used
