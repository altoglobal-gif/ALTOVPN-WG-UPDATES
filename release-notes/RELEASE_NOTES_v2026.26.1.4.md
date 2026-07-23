# ALTOVPN-WG V.2026.26.1.4

Published: 2026-06-24

## Fixed

- Synced Tray Panel profile selection back to the main app state so selected-profile actions no longer drift from the web UI.
- Clarified the Quick Connect tile by showing the target profile name and disabling it when no Quick Connect profile is configured.
- Disabled selected-profile Diagnose and Health actions when no profile is selected.
- Added confirmation before Kill VPN runs from either the Tray Panel or WebView UI.
- Prevented the Tray Panel from auto-hiding immediately while native dialogs or prompts are opening.
- Increased native bridge timeouts for long-running update install, reconnect, diagnostics, export, and WireGuard manager actions.
- Locked additional profile actions while config editing is active to avoid mixed edit/action state.

## Verification

- Built the Windows x64 MSI with ProductVersion `226.26.14`.
- Verified WebView script syntax.
- Short idle debug sampling did not show obvious RAM or CPU growth.

## Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.4-win-x64.msi` installer.
