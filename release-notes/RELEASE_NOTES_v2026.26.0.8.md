# ALTOVPN-WG V.2026.26.0.8 Release Notes

Release date: 2026-06-23

## Versioning

- App version: `V.2026.26.0.8`
- Assembly/file version: `2026.26.0.8`
- MSI ProductVersion: `226.26.8`
- Runtime: `win-x64`
- Installer: `ALTOVPN-WG-V.2026.26.0.8-win-x64.msi`

## Highlights

- Restored the visible update status badge in the main header.
- Restored the Changelog view in Settings.
- Added release-note access from the Changelog view.
- Split Check Update from Install Update so users can see that an update is available before installing it.

## Migration Notes

- This is a migration MSI for machines that previously received MSI ProductVersion values in the `2026.26.0.x` format.
- The app-facing version remains `V.2026.26.0.8`.
- The MSI ProductVersion moves to the `226.week.build` scheme.
- The installer removes older ALTOVPN-WG MSI registrations before installing this version.

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
releases/v2026.26.0.8/ALTOVPN-WG-V.2026.26.0.8-win-x64.msi
```

SHA256:

```text
9C4D89BF9758E75D840ECA2D5DE0B7BED8AB133943EF73B7ED930D2ABE898756
```
