# Changelog

## V.2026.26.1.4 - 2026-06-24

### Fixed

- Synced Tray Panel profile selection back to the main app state so selected-profile actions no longer drift from the web UI.
- Clarified the Quick Connect tile by showing the target profile name and disabling it when no Quick Connect profile is configured.
- Disabled selected-profile Diagnose and Health actions when no profile is selected.
- Added confirmation before Kill VPN runs from either the Tray Panel or WebView UI.
- Prevented the Tray Panel from auto-hiding immediately while native dialogs or prompts are opening.
- Increased native bridge timeouts for long-running update install, reconnect, diagnostics, export, and WireGuard manager actions.
- Locked additional profile actions while config editing is active to avoid mixed edit/action state.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.4-win-x64.msi` installer.

## V.2026.26.1.3 - 2026-06-24

### Fixed

- Clarified Tray Panel connection state by tying the header status to the selected profile instead of the global active-tunnel count.
- Made connected profiles visually obvious in the Tray Panel profile list with a stronger row highlight, green border, larger status dot, and `CONNECTED` badge.
- Fixed Tray Panel refresh causing profile selection to jump during live state updates.
- Fixed Tray Panel Reconnect being available for disconnected profiles; reconnect is now limited to already-connected profiles and no longer starts an extra tunnel.
- Replaced the low-value bottom `Public Key` quick tile with `Diagnose / Health` for selected-profile diagnostics.
- Kept the tray icon on the ALTOVPN-WG icon by falling back to the executable icon if the runtime asset path cannot be resolved.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.3-win-x64.msi` installer.

## V.2026.26.1.2 - 2026-06-24

### Fixed

- Fixed the Windows tray icon falling back to the default application icon when the external icon asset cannot be resolved at runtime; the app now falls back to the embedded executable icon before using a system fallback.
- Clarified Tray Panel actions with more explicit labels and tooltips for opening the app, connecting the selected profile, Quick Connect, emergency Kill VPN, public-key copy, and window show/hide behavior.
- Improved Tray Panel selected-profile status copy so disconnected profiles clearly point users to the Connect selected action.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.2-win-x64.msi` installer.

## V.2026.26.1.1 - 2026-06-23

### Fixed

- Fixed update installation false failures by allowing the desktop client to wait longer for helper MSI SHA256 verification.
- Kept helper-side update validation synchronous so `Installer scheduled` is only returned after path and hash checks pass.
- Reduced machine-freeze risk by running DNS and route diagnostics only during manual Diagnose or forced health refresh instead of every health poll.
- Reduced reconnect churn by limiting automatic reconnect to inactive tunnels and network-change recovery; stale/no-handshake states now warn without restarting the tunnel.
- Switched the helper pipe ACL package from preview to stable `System.IO.Pipes.AccessControl` `5.0.0`.

### Changed

- Published the compact Tray Settings and Connection Detail UI cleanup in the update channel.
- Preserved the intentional admin passcode workflow.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.1-win-x64.msi` installer.

## V.2026.26.1.0 - 2026-06-23

### Major

- Promoted this release to the `2026.26.1.x` major line for production VPN client improvements.
- Added functional Tray Settings actions for auto-disconnect modes, selected-profile diagnose/reconnect, diagnostics export, update check, and app restart.
- Added exit confirmation when quitting ALTOVPN-WG from the tray.
- Added WireGuard import validation and preview before saving imported `.conf` profiles.
- Added redacted diagnostic bundle export for support/debug workflows.
- Added DNS, route, tunnel mode, latest handshake, runtime endpoint, latency, and auto reconnect health details.
- Added tray notifications for connect/disconnect, reconnect, update restart required, and VPN health warnings.
- Added user-friendly error mapping for common WireGuard/helper/config/update failures.

### Security

- Diagnostic bundle export redacts private and preshared keys before writing reports.
- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.0-win-x64.msi` installer.

## V.2026.26.0.9 - 2026-06-23

### Fixed

- Removed the duplicate Check Update button from the Changelog modal.
- Fixed Open Release Notes in the WebView2 client by routing the action through the native host and default browser.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.0.9-win-x64.msi` installer.

## V.2026.26.0.8 - 2026-06-23

### Changed

- Published a migration MSI that keeps the displayed app version as `V.2026.26.0.8` while using MSI `ProductVersion` `226.26.8`.
- This migration build allows machines with earlier `2026.26.0.x` MSI product-version registrations to remove the old package before installing the new package.

### Fixed

- Restored visible update status in the ALTOVPN-WG WebView2 client header.
- Restored the Changelog view in Settings with release-note links.
- Added an explicit Install Update action so Check Update can show availability before installation.
- GitHub manifest fallback reads decoded contents correctly when curl.exe is used.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.0.8-win-x64.msi` installer.

## V.2026.26.0.7 - 2026-06-23

### Added

- Restored visible update status in the ALTOVPN-WG WebView2 client header.
- Restored the Changelog view in Settings with release-note links.
- Added an explicit Install Update action so Check Update can show availability before installation.

### Fixed

- Check Update no longer silently downloads and schedules installation before showing update state.
- Update metadata remains visible after a download completes or installation is deferred.
- GitHub manifest fallback reads decoded contents correctly when curl.exe is used.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.0.7-win-x64.msi` installer.

## V.2026.26.0.6 - 2026-06-23

### Added

- Published the Windows x64 MSI for the drag-and-drop WireGuard profile import release.
- Added release metadata for `ALTOVPN-WG-V.2026.26.0.6-win-x64.msi`.

### Fixed

- Drag-and-drop imported profile names now keep the original `.conf` filename without a GUID hash suffix.
- Included cumulative V.2026.26.0.x stability and installer fixes from the Windows WebView2 client.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.0.6-win-x64.msi` installer.

## V.2026.25.0.3 - 2026-06-17

### Fixed

- Published the duplicate-key and generated-profile cleanup fixes from the Windows WebView2 client.
- Preserved imported WireGuard configs that already contain their own `PrivateKey`.
- Fixed bridge responses for commands that do not include a `profileId`.

### Security

- Update metadata now points to the SHA256-verified `ALTOVPN-WG-V.2026.25.0.3-win-x64.msi` installer.
- Client-side key generation now retries duplicate private/public key pairs and rejects duplicate private keys on save.

## V.2026.25.0.2 - 2026-06-17

### Added

- Published the full ALTOVPN-WG desktop client installer update for tray panel, Settings, Admin Mode, and tunnel-limit controls.
- Added release metadata for `ALTOVPN-WG-V.2026.25.0.2-win-x64.msi`.

### Changed

- Switched this release artifact from `webapp-patch` to full `msi` because native Windows host and tray code changed.

### Security

- Installer download is SHA256 verified before privileged helper installation.

## V.2026.25.0.1 - 2026-06-17

### Added

- Added the first ALTOVPN-WG webapp binary patch channel.
- Published `ALTOVPN-WG-webapp-V.2026.25.0.1-win-x64.zip` as a `webapp-patch` artifact.

### Changed

- Update artifacts for web UI changes no longer require a full MSI installer.

### Security

- Patch artifacts are SHA256 verified before and during privileged application.
- Patch contents are constrained to `packages/web-ui/**`.
