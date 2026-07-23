# ALTOVPN-WG V.2026.26.0.7 Release Notes

Release date: 2026-06-23

## Versioning

- App version: `V.2026.26.0.7`
- Assembly/file version: `2026.26.0.7`
- Runtime: `win-x64`
- Installer: `ALTOVPN-WG-V.2026.26.0.7-win-x64.msi`

## Highlights

- Restored the visible update status badge in the main header.
- Restored the Changelog view in Settings.
- Added release-note access from the Changelog view.
- Split Check Update from Install Update so users can see that an update is available before installing it.

## Fixes

- Check Update now reports `Update available`, `Up to date`, or `Manual update required` in app state.
- Update metadata remains visible after the MSI is downloaded.
- The GitHub manifest fallback now decodes GitHub contents API responses when curl.exe is used.

## Security Notes

- The installer is published as a full MSI update for the Windows desktop client.
- The update checker verifies file size and SHA256 before helper-backed MSI installation.
- Helper service installation remains admin-required.

## Build Artifact

Expected installer path:

```text
releases/v2026.26.0.7/ALTOVPN-WG-V.2026.26.0.7-win-x64.msi
```

SHA256:

```text
C2804DFE1E3520771C2A76A0D8496BE59E7151932B7136D2F71C720DBA7B7665
```
