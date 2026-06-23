# ALTOVPN-WG V.2026.26.0.6 Release Notes

Release date: 2026-06-23

## Versioning

- App version: `V.2026.26.0.6`
- Assembly/file version: `2026.26.0.6`
- Runtime: `win-x64`
- Installer: `ALTOVPN-WG-V.2026.26.0.6-win-x64.msi`

## Highlights

- Added drag-and-drop import for WireGuard `.conf` files.
- Users can drag one or more `.conf` files onto the app window instead of using the Import Profile button.
- A pulsing overlay is shown while a valid drag operation is active.
- Drops are blocked while a config edit is active so unsaved edits are not overwritten.

## Fixes

- Fixed drag-and-drop imported profile names showing a GUID hash suffix.
- The temporary unique ID is now placed in the temp directory name, so the imported profile name matches the original `.conf` filename.
- Includes cumulative V.2026.26.0.x stability, edit-lock, flow, and installer polish fixes.

## Security Notes

- The installer is published as a full MSI update for the Windows desktop client.
- The update checker verifies file size and SHA256 before helper-backed MSI installation.
- Helper service installation remains admin-required.

## Build Artifact

Expected installer path:

```text
releases/v2026.26.0.6/ALTOVPN-WG-V.2026.26.0.6-win-x64.msi
```

SHA256:

```text
50BE93C214CB374301AB8C51B56EFFFEA4C1FAA8DE11329B0D6050D852CCA361
```
