# ALTOVPN-WG V.2026.31.0.4 Main / Stable

Unified single-file Windows release.

Published directly to Main/Stable with one downloadable Windows asset.

## One-file behavior

- New machine: installs the desktop App, Helper `V.2026.29.2.2`, and pinned official WireGuard runtime.
- Existing installation: quiet/in-app update repairs App files only and preserves the installed Helper.
- Interactive maintenance still exposes explicit repair, full reinstall, Helper reinstall, and uninstall choices.

## Safety and validation

- The updater uses the established component `desktop-client` and filename suffix `-app-update.exe` so current Stable clients can install this unified file.
- SHA256 is verified by the desktop client and again by the LocalSystem update worker.
- Installation is refused while a WireGuard tunnel service is active.
- Existing-install validation preserved Helper service/hash/version, profiles, keys, and update channel.
- Windows host tests passed `51/51`.
- Final release build verified that the embedded payload contains Helper and WireGuard for a new machine.
- The published asset returned HTTP 200 and matched the size and SHA256 below after downloading it back from GitHub.
- Existing-install smoke testing completed with exit code `0`; App reached `2026.31.0.4`, Helper remained running and byte-identical at `2026.29.2.2`, and nine checked profile/channel files were unchanged.

## Artifact

- `ALTOVPN-WG-V.2026.31.0.4-win-x64-app-update.exe`
  - Size: `178979747` bytes
  - SHA256: `54C6FA1E2C8DEF3BFBBBE27BF21B1983F72FD5902FAFE9286CBFB55593FB4BE7`

This GitHub release intentionally contains this one asset only.
