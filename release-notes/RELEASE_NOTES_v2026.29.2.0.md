# ALTOVPN-WG V.2026.29.2.0 Dev

Major assisted WireGuard Portal enrollment prerelease.

## New import flow

1. Drop or select the `.conf` exported by WireGuard Portal.
2. If only the client PrivateKey is missing, select **Generate & Import**.
3. ALTOVPN-WG generates a unique key pair and inserts the PrivateKey into its managed local config.
4. Copy the displayed PublicKey to the matching peer in WireGuard Portal.
5. Return to ALTOVPN-WG and select **Portal Updated** before connecting.

PrivateKeys are never sent to the Portal. This flow does not create a temporary `WG0` profile and does not require Admin Mode.

## Also included

- Visible native errors for rejected Drag/Drop imports.
- Persistent Stable/Beta channel selection inside unlocked Admin Mode.
- Context-aware install/repair/helper-reinstall/uninstall choices.
- App-only updates preserve the installed full maintenance setup.

## Release boundaries

- Desktop: `V.2026.29.2.0`
- Helper: unchanged `V.2026.29.1.6`
- Channel: Dev prerelease; Beta and Stable are not yet promoted.
- App-only SHA256: `F7CFC40FF22D39B206CF40601F2AB430E876A7CC3E207B75FB7219AB372D5484`
- Full Setup SHA256: `D55CEB52A0F8FF2E61D042A96264DBCDDAE82466B0CD400C241D151D753E6642`

The artifacts are currently unsigned. Full Setup includes ALTOVPN-WG and its helper but does not bundle the official WireGuard installer; WireGuard must already be installed separately.
