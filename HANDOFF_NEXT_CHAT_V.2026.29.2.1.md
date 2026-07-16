# Handoff - V.2026.29.2.1 Main/Stable

## Published baseline

- Source commit: `4b615cc844a7319024dbc8ef8ddd41cbe87296bd`
- Source branches `dev`, `beta`, and `main` are byte-aligned at that commit.
- Update target: `V.2026.29.2.1`
- Helper: unchanged `V.2026.29.1.6`
- Stable and Beta selection is available directly in Settings > Software Update.

## Artifact invariants

- App Update: 146,098,595 bytes; SHA256 `148EE751651EC771532DD6084DE3D0DD1C73A9D3AEDA81678D754D02A74CAA53`.
- Full Setup: 178,902,947 bytes; SHA256 `F9F2348327C274A6AD5A5623BBB534F7B2CABA6190B355040ED21F638499E05D`.
- App Update contains neither Helper nor WireGuard.
- Full Setup contains App `2026.29.2.1`, Helper `2026.29.1.6`, and `WireGuardInstaller.msi` with pinned SHA256 `6DAA5D37A9E2950DFB8C48B95AB8E562CB2BAD1C785D020F38F97BEA4C6A5566` and valid WireGuard LLC signature.
- Both ALTOVPN installer EXEs are currently unsigned.

## Channel and compatibility behavior

- `latest.json` remains the verified `V.2026.29.1.7` Safe Main bridge and chains to `stable.json`.
- `stable.json`, `beta.json`, and `dev.json` target the exact same `V.2026.29.2.1` artifacts.
- Versions from the native automatic floor through `V.2026.29.1.6` land on the bridge first; `V.2026.29.1.7` through `V.2026.29.2.0` converge on Stable `V.2026.29.2.1`.
- Legacy versions below the native automatic floor use the `V.2026.29.2.1` Full Setup bootstrap.
- Do not raise `minimumSupportedVersion` to the target version: old clients interpret that as unsupported/manual-only, not mandatory install.
- A hard runtime lock cannot be retrofitted into already-installed old clients through manifest metadata alone.

## Next release rule

Develop on `dev`, publish one verified artifact set, promote those exact bytes through Beta/Stable, and never rebuild between channels.
