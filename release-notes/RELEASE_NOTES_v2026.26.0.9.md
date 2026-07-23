# ALTOVPN-WG V.2026.26.0.9 Release Notes

Release date: 2026-06-23

## Versioning

- App version: `V.2026.26.0.9`
- Assembly/file version: `2026.26.0.9`
- MSI ProductVersion: `226.26.9`
- Runtime: `win-x64`
- Installer: `ALTOVPN-WG-V.2026.26.0.9-win-x64.msi`

## Fixes

- Removed the duplicate Check Update button from the Changelog modal.
- Fixed Open Release Notes in the WebView2 client by routing the action through the native host and default browser.
- Kept Check Update in Settings > Operations.
- Kept Install Update visible only when an update is available.

## Security Notes

- The installer is published as a full MSI update for the Windows desktop client.
- The update checker verifies file size and SHA256 before helper-backed MSI installation.
- Helper service installation remains admin-required.

## Build Artifact

Expected installer path:

```text
releases/v2026.26.0.9/ALTOVPN-WG-V.2026.26.0.9-win-x64.msi
```

SHA256:

```text
BED36F6298B7E0A31F79144C10906130CA17786F8E9721AFF30A902580FA65C2
```
