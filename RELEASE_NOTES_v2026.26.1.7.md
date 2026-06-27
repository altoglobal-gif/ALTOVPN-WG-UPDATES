# ALTOVPN-WG V.2026.26.1.7

## Fixed

- Prevented MSI/full desktop update installation from starting while any VPN tunnel is connected.
- `INSTALL_UPDATE` can still download and verify the update package, but it pauses before helper/MSI installation when an active tunnel is detected.
- Web UI patch updates that do not touch the helper service may still be applied while connected.
- The update UI now keeps the update available instead of switching to restart-required when installation is paused to protect an active VPN session.

## Release Metadata

- Built the Windows x64 MSI with ProductVersion `226.26.17`.
- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.7-win-x64.msi` installer.
