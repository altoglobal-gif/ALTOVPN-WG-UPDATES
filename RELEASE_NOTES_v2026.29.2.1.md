# ALTOVPN-WG V.2026.29.2.1

Main/Stable release of the assisted WireGuard Portal workflow and refreshed Windows VPN client.

## Highlights

- Imports Portal `.conf` files that omit the client `PrivateKey`, generates a unique key locally, and exposes only the matching PublicKey for Portal registration.
- Keeps Connect blocked while a generated PublicKey is waiting to be registered in Portal.
- Makes VPN Destination Networks the primary profile information for identifying the routed Site IP/CIDR.
- Reorganizes the Main window and Tray panel around VPN status, site selection, telemetry, and primary connection actions.
- Makes Stable and Beta channel selection directly available in Settings > Software Update.

## Modern Installer EXE packages

- `ALTOVPN-WG-V.2026.29.2.1-win-x64-app-update.exe` updates the desktop through the existing LocalSystem helper. It contains no Helper or WireGuard payload.
- `ALTOVPN-WG-V.2026.29.2.1-win-x64-setup.exe` contains the desktop client, Helper `V.2026.29.1.6`, and official WireGuard for Windows `amd64 1.1` for clean-machine installation.
- The WireGuard payload is pinned to SHA256 `6DAA5D37A9E2950DFB8C48B95AB8E562CB2BAD1C785D020F38F97BEA4C6A5566` and a valid `WireGuard LLC` Authenticode signer.

## Adoption policy

- This is the sole Main/Stable target for the `V.2026.29` line.
- Verified native-updater clients follow the Safe Main bridge and then converge on this Stable release.
- Older clients outside the native automatic floor use this release's Full Setup as the supported bootstrap.
- A server manifest cannot retroactively add a hard runtime lock to installed clients that never shipped that capability; the publication targets every supported route and provides one current Full Setup.

## Versions and integrity

- Desktop and Modern Installer: `V.2026.29.2.1`
- Helper: `V.2026.29.1.6` (unchanged)
- App Update SHA256: `148EE751651EC771532DD6084DE3D0DD1C73A9D3AEDA81678D754D02A74CAA53`
- Full Setup SHA256: `F9F2348327C274A6AD5A5623BBB534F7B2CABA6190B355040ED21F638499E05D`
- The ALTOVPN Modern Installer EXE artifacts are currently unsigned.
