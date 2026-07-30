# ALTOVPN-WG V.2026.31.0.4 Main / Stable

Unified single-file Windows release.

## One-file behavior

- New machine: installs the desktop App, Helper `V.2026.29.2.2`, and pinned official WireGuard runtime.
- Existing installation: quiet/in-app update repairs App files only and preserves the installed Helper.
- Interactive maintenance still exposes explicit repair, full reinstall, Helper reinstall, and uninstall choices.

## Safety and validation

- The updater accepts the file only with component `desktop-client-unified` and filename suffix `-unified-setup.exe`.
- SHA256 is verified by the desktop client and again by the LocalSystem update worker.
- Installation is refused while a WireGuard tunnel service is active.
- Existing-install validation preserved Helper service/hash/version, profiles, keys, and update channel.
- Windows host tests passed `54/54`.

## Artifact

- `ALTOVPN-WG-V.2026.31.0.4-win-x64-unified-setup.exe`
  - Size: `178980259` bytes
  - SHA256: `11BCE6FE40DD3C859114D08737C45AE81F756A481BDAAF4351E0B2EAAD8FFC2D`

This GitHub release intentionally contains this one asset only.
