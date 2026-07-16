# Handoff - Next Chat - V.2026.29.2.0

## State

- Source repository: `VPNCLIENT-WG-CORE-WEBAPP`, Dev commit `ce51b60`.
- Update channel: Dev only. Do not modify Beta/Stable manifests until their observation gates are satisfied.
- Desktop: `V.2026.29.2.0`; helper remains `V.2026.29.1.6`.

## Immutable promotion artifacts

| Artifact | Bytes | SHA256 |
|---|---:|---|
| `ALTOVPN-WG-V.2026.29.2.0-win-x64-app-update.exe` | 146096035 | `F7CFC40FF22D39B206CF40601F2AB430E876A7CC3E207B75FB7219AB372D5484` |
| `ALTOVPN-WG-V.2026.29.2.0-win-x64-setup.exe` | 175989667 | `D55CEB52A0F8FF2E61D042A96264DBCDDAE82466B0CD400C241D151D753E6642` |

Beta and Stable promotion must reuse those exact files and digests. Never rebuild.

## Validation completed

- 35 Windows host tests passed.
- Host, Helper, and Modern Installer compiled with zero warnings/errors.
- App-only payload contains no helper files.
- Full Setup contains App `V.2026.29.2.0` and Helper `V.2026.29.1.6`.
- Both payloads contain Portal enrollment, channel selection, and target-version markers.
- JSON and inline JavaScript syntax checks passed.

## Remaining gates

- Smoke install/update with every tunnel disconnected.
- Exercise missing-PrivateKey Drop -> Generate & Import -> Copy PublicKey -> Portal Updated -> Connect.
- Observe Dev, then promote the identical artifacts to Beta; observe Beta before Stable.

## Public verification completed

- Raw `dev.json` returned `V.2026.29.2.0` from the Dev branch.
- Both GitHub release assets returned HTTP 200.
- Both assets were downloaded back from GitHub; byte sizes and SHA256 values matched this handoff and `dev.json` exactly.
- GitHub Release API digests matched both expected SHA256 values.

## Known limitations

- Artifacts are not Authenticode-signed.
- Full Setup does not bundle WireGuard. Official WireGuard must already exist in `%ProgramFiles%\WireGuard`.
