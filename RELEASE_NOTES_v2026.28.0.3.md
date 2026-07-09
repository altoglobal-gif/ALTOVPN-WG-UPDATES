# ALTOVPN-WG V.2026.28.0.3

## Compatibility

- Published this release as an MSI bridge update so older ALTOVPN-WG clients with MSI-only updater support can update directly to the latest client.
- This build includes the `V.2026.28.0.2` silent update fix that closes the running desktop client before replacing installed files.

## Artifact

- File: `ALTOVPN-WG-V.2026.28.0.3-win-x64.msi`
- MSI ProductVersion: `226.28.3`
- SHA256: `1490D0BFD499D944F0DCE8FED86D3637A72493D97AF2307F785266142EC3FB59`
- Size: `96768000`

## Verification

- `scripts/build-altovpn-msi.ps1 -Version V.2026.28.0.3 -ProductVersion 226.28.3` created the Windows x64 MSI.
- MSI ProductVersion was verified as `226.28.3`.
