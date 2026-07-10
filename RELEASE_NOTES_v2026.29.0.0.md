# ALTOVPN-WG V.2026.29.0.0

Major Windows UX and performance release.

## Added

- VPN Destination Networks with readable CIDR route chips, Split/Full Tunnel state, and default-route warnings.
- A streamlined What's New view with collapsible technical update details.
- Modern Installer `.exe` restored as the Windows updater package.
- Network VPN Scanner implementation and QA roadmap.

## Changed

- Main Window and Tray Panel information hierarchy.
- Compact telemetry pushes replace full-state traffic refreshes.
- WireGuard health polling now uses one dump command per tunnel.
- DNS diagnostics now use managed .NET APIs.

## Fixed

- Overlapping background timer callbacks.
- Repeated unchanged Main UI and Tray list rendering.
- Modern Installer file replacement while the previous client is closing.

## Removed

- MSI from the primary updater path.
- PowerShell dependency from DNS diagnostics.

## Artifact

- File: `ALTOVPN-WG-V.2026.29.0.0-win-x64-setup.exe`
- SHA256: `4854328C8BD98075A0CCA812AFFD7875C1CB064379623AAF5749874F2FAC84C6`
- Size: `172225359` bytes
- Git LFS: not used
