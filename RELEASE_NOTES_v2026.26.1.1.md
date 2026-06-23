# ALTOVPN-WG V.2026.26.1.1

Release date: 2026-06-23

## Fixed

- Update installation no longer fails early while the helper service is still verifying the MSI hash.
- The helper now returns `Installer scheduled` only after validating the managed update path and SHA256.
- DNS and route diagnostics no longer run on every health poll, reducing shell/process load on the machine.
- Automatic reconnect is now more conservative: inactive tunnels and network-change recovery can reconnect, but stale/no-handshake states warn without restarting the tunnel.
- Helper service dependencies now use a stable pipe ACL package instead of a preview package.

## Changed

- Includes the compact Tray Settings and Connection Detail UI cleanup.
- Keeps the existing admin passcode design unchanged.

## Artifact

- File: `ALTOVPN-WG-V.2026.26.1.1-win-x64.msi`
- SHA256: `3E20FEB53F20E5651AB7B2B34D83C256A85EF35EE5AFF9C036211EDB65D6E36E`
- Size: `96948224` bytes
- MSI ProductVersion: `226.26.11`
