# ALTOVPN-WG V.2026.29.0.1

Recovery patch for the V.2026.29 Windows major release.

## Fixed

- Restored the latest Software Update, App & System, and Admin Mode Settings layout in the packaged Modern Installer.
- Preserved Lock Now, Unlimited tunnels, session policy, and profile credential controls.
- Corrected the stable artifact contract for V.2026.28.1.1 by using `installer-exe`.
- Added explicit compatibility routes and a manifest release gate.

## Included

- Phase 1 Main Window, Tray Panel, Tunnel Address, and VPN Destination Networks UX.
- Phase 2 compact telemetry and polling performance changes.
- Linear update changelog presentation.

## Artifact

- File: `ALTOVPN-WG-V.2026.29.0.1-win-x64-setup.exe`
- SHA256: `56961E2AE04730D7FB2FC87483F76650CC49947F1B58E19FCF63DEED7954E0C6`
- Size: `172225359` bytes
- Type: `installer-exe`
- Git LFS: not used

## Compatibility

- V.2026.28.1.1 and newer: direct automatic update.
- V.2026.28.0.1 through V.2026.28.1.0: automatic when the legacy scheduler is allowed; otherwise use this EXE manually.
- V.2026.26.1.9 and older: run this EXE once as a bootstrap.
