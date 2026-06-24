# ALTOVPN-WG V.2026.26.1.3

Release date: 2026-06-24

## Fixed

- Tray Panel header status now describes the selected profile, so a disconnected selected profile no longer appears as `CONNECTED` just because another tunnel is active.
- Connected profiles are easier to identify in the Tray Panel list with a stronger connected row, status dot, border, and `CONNECTED` badge.
- Tray Panel refresh no longer jumps the selected profile while live state updates arrive.
- Reconnect from Tray Panel is now available only for connected profiles and no longer starts an extra connection when the selected profile is offline.
- The bottom quick action tile now uses `Diagnose / Health` instead of `Public Key`, matching common tray troubleshooting workflows.
- The tray icon continues to use ALTOVPN-WG branding even if the external icon asset is unavailable at runtime.

## Artifact

- File: `ALTOVPN-WG-V.2026.26.1.3-win-x64.msi`
- SHA256: `CB3B3425140200A014500A865B1A841EB512C7C2A71C964DC0DC0A701E4251B1`
- Size: `96956416` bytes
- MSI ProductVersion: `226.26.13`
