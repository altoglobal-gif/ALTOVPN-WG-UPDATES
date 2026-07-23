# ALTOVPN-WG V.2026.25.0.3 Release Notes

Release date: 2026-06-17

## Versioning

- App version: `V.2026.25.0.3`
- Assembly/file version: `2026.25.0.3`
- MSI product version: `226.25.3`
- Runtime: `win-x64`

## Fixes

- Fixed Generate Key creating a temporary profile that could reuse an existing profile's private/public key through stale pending state.
- Fixed config import so an imported `.conf` that already has a real `PrivateKey` keeps its own key instead of being overwritten by a pending generated key.
- Fixed Generate Key followed by Import Config leaving a duplicate temporary `WG*` profile behind.
- Fixed web bridge response handling for commands without a `profileId`.

## Security Notes

- Key generation now retries if a generated private or public key matches an existing profile.
- Config save now rejects duplicate private keys.
- Generated temporary profiles cannot be saved with a different private key through normal editing.

## Build Artifact

Expected installer path:

```text
artifacts\altovpn-wg\installer\ALTOVPN-WG-V.2026.25.0.3-win-x64.msi
```
