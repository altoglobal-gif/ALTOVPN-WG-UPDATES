# Handoff - V.2026.29.2.2 Beta

## Published target

- Source commit: `0f5ef6e347a4461fa3fbbb48a264f239208992fb`.
- Source `dev` and `beta` branches are byte-aligned at that commit; `main` remains the accepted Stable baseline.
- App and Helper: `V.2026.29.2.2`.
- Stable: promoted to `V.2026.29.2.2` on 2026-07-21.

## Artifact invariants

- App Update: 146,161,571 bytes; SHA256 `A048E95F213F239AB825714ECEA953A6830DDAFE780975682F851E8289BECCCD`.
- Full Setup: 178,972,067 bytes; SHA256 `5737B1F44914023DB64567FC04448355F1FF1CEFECD73457C0CCF6ED074F3F60`.
- App Update contains neither Helper nor WireGuard.
- Full Setup contains App `2026.29.2.2`, Helper `2026.29.2.2`, and `WireGuardInstaller.msi` SHA256 `6DAA5D37A9E2950DFB8C48B95AB8E562CB2BAD1C785D020F38F97BEA4C6A5566` with a valid WireGuard LLC signature.
- ALTOVPN installer EXEs are currently unsigned.

## Channel behavior

- `beta.json` and `dev.json` target the Full Setup because this release changes the helper.
- `stable.json` targets the same verified Full Setup artifact. `latest.json` remains the Safe Main bridge.
- `minimumSupportedVersion` remains `V.2026.29.1.7` so existing opt-in clients receive the update instead of being classified unsupported.
- Full Setup refuses installation while a `WireGuardTunnel$*` service is active.

## Promotion rule

Promotion was accepted on 2026-07-21. Do not rebuild; keep Stable on the exact verified release asset bytes and preserve the Safe Main landing manifest.
