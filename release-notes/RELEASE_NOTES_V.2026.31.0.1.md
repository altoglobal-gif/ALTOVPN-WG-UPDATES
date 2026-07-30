# ALTOVPN-WG V.2026.31.0.1 Beta

Standalone identity cleanup and update compatibility hardening.

## Highlights

- Replaced the predecessor desktop namespace with `AltoVpnWg.Desktop`.
- Preserved all installed compatibility identifiers used by existing clients and the Helper.
- Added fail-closed payload creation with file-count, size, and SHA256 verification.
- Verified app-only updating against an installed `V.2026.29.2.3` layout.

## Artifacts

- App-only update: `ALTOVPN-WG-V.2026.31.0.1-win-x64-app-update.exe`
  - Size: `146168739` bytes
  - SHA256: `4F9BC00FE0457690A33F3BC123EFC9C1F7AB87614FE76869916D3F910EEF24C6`
- Full Setup fallback: `ALTOVPN-WG-V.2026.31.0.1-win-x64-setup.exe`
  - Size: `178979235` bytes
  - SHA256: `2F28DDE9B794490CEFB9F4DE471D5A054C19D7CDC0FA1B62C7F4F12553770E2D`

Helper remains `V.2026.29.2.2`. This release is available on Beta only; Stable remains `V.2026.31.0.0`.
