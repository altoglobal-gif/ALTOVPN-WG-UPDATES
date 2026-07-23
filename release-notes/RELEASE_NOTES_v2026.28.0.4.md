# ALTOVPN-WG V.2026.28.0.4

## Fixed

- Prevented MSI updates from stopping or replacing the helper service while the old desktop client is still running.
- Made the update worker wait for ALTOVPN-WG to close before starting the installer.
- Made Restart App wait for the installer to finish before reopening ALTOVPN-WG.
- Added an MSI-side close rule so older MSI-only clients cannot leave a mixed-version app/helper installation.
- Added a final active-tunnel check immediately before installation and cancel the update if a WireGuard tunnel is active.

## Artifact

- File: `ALTOVPN-WG-V.2026.28.0.4-win-x64.msi`
- MSI ProductVersion: `226.28.4`
- SHA256: `2E3418AF99128F7F9F562FF90DB31A3CDC05E8F2ABDA4D8052D198139A2D7382`
- Size: `97198080`

## Verification

- Windows app, helper service, and modern installer builds passed with no warnings or errors.
- Windows x64 MSI build completed successfully.
- MSI database contains ProductVersion `226.28.4` and a close-application rule targeting `ALTOVPN-WG.exe`.
