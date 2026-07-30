# ALTOVPN-WG V.2026.31.0.3 Beta

Windows responsive-shell hardening for the desktop client.

## Highlights

- Main Window content adapts from the supported `920x680` minimum through wide and tall desktop layouts.
- Profile, connection, activity, configuration, network scanner, Settings, changelog, menus, overlays, and active-tunnel controls remain reachable.
- Long profile names and active-tunnel chips are bounded instead of expanding or clipping the shell.
- Scroll regions appear only when required and retain access to the final action or row.

## Validation

- `221/221` state and viewport combinations passed.
- `25/25` live-resize checks passed.
- Scroll-to-end checks passed for all bounded regions.
- Windows host tests passed `51/51`.

## Artifacts

- App-only update: `ALTOVPN-WG-V.2026.31.0.3-win-x64-app-update.exe`
  - Size: `146169763` bytes
  - SHA256: `05F987C9F28718440AA2959D6A5CBB13AF855A8BEDA9262C30DB5A468D383553`
- Full Setup fallback: `ALTOVPN-WG-V.2026.31.0.3-win-x64-setup.exe`
  - Size: `178980259` bytes
  - SHA256: `4F9710ADABEF5BD5DCDEFA147DFA82FE8B286EE05D777D203BBB2E099F9053FF`

Helper remains `V.2026.29.2.2`. This release is available on Beta only; Stable remains `V.2026.31.0.0`.
