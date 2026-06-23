# Changelog

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
