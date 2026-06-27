# Changelog

## V.2026.26.2.2 - 2026-06-27

### Fixed

- Fixed the modern setup executable failing to open because WPF UI assets were packaged as external content instead of embedded resources.
- Embedded the installer icon and brand images into the WPF assembly so the single-file setup can start without sidecar files.

### Verification

- Opened the setup executable locally for 5 seconds without an immediate crash.
- Checked Windows Application event log after launch and found no new setup crash events.

## V.2026.26.2.1 - 2026-06-27

### Fixed

- Preserved the running `AltoVpnWgHelper` service during modern installer updates when the helper binary hash is unchanged.
- The modern installer now stops and recreates the helper service only when the helper payload is actually updated or missing.

### Release

- Published the custom modern `.exe` setup package as a GitHub Release asset because it is larger than the git blob limit.
- The in-app update channel remains on MSI artifacts until deployed clients can safely consume installer-exe artifacts.

## V.2026.26.2.0 - 2026-06-27

### Added

- Added a custom .NET/WPF modern setup experience for ALTOVPN-WG.
- Published a manual `.exe` setup package that is not WiX MSI and not MSIX.
- The setup package installs the app payload, registers `AltoVpnWgHelper`, creates shortcuts, and registers an uninstall entry.

### Compatibility

- The in-app update channel remains on MSI artifacts until deployed clients have installer-exe updater support.

## V.2026.26.1.9 - 2026-06-27

### Changed

- Refreshed the MSI setup wizard visuals with a modern app-installer style while keeping the package as MSI/WiX.
- Replaced the dark full-panel wizard art with a branded left rail and light content card for reliable readability.
- Updated installer typography to Segoe UI project styles.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.9-win-x64.msi` installer.

## V.2026.26.1.8 - 2026-06-27

### Fixed

- Fixed installer readability on Welcome, Interrupted, Error, and other WixUI dialogs by replacing the dark content panel with a light panel.
- Normalized MSI text controls to project text styles so titles and descriptions remain readable across installer states.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.8-win-x64.msi` installer.

## V.2026.26.1.7 - 2026-06-27

### Fixed

- Prevented MSI/full desktop update installation from starting while any VPN tunnel is connected.
- Kept active VPN sessions and the helper service online by pausing before helper/MSI installation when connected profiles exist.
- Allowed non-helper web UI patch updates to remain eligible while connected.
- Left the update available after a protected-session pause so users can install later during a maintenance window.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.7-win-x64.msi` installer.

## V.2026.26.1.6 - 2026-06-27

### Fixed

- Aligned MSI build parameters with host and helper binary versions so published artifacts do not report stale app versions.
- Patched installer dialog text styles across dark-background dialogs to avoid black text on black backgrounds.
- Added helper response timeouts to prevent privileged operations from hanging indefinitely after a pipe connection succeeds.
- Cleared stale update availability state when update checks fail.
- Re-enabled the Connect/Disconnect action after native bridge command timeouts.

### Changed

- Reduced connect/disconnect wait time and moved manager status refresh to the background after tunnel toggles.
- Update install scheduling now starts `msiexec` immediately and returns the installer PID/log path after SHA256 verification.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.6-win-x64.msi` installer.

## V.2026.26.1.5 - 2026-06-24

### Fixed

- Prevented normal Tray Panel connect and Quick Connect results from opening the tunnel-limit warning panel.
- Increased WebView bridge timeouts for connect/disconnect and WireGuard manager start actions.
- Updated successful connect and disconnect actions to leave a clear final status message.
- Reduced unnecessary reconnect churn by treating network address changes as a health refresh instead of immediately reconnecting every active tunnel.

### Changed

- Made `Cancel` the default option on the destructive Kill VPN confirmation dialog.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.5-win-x64.msi` installer.

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
