# ALTOVPN-WG V.2026.29.1.1

Corrective Tray Panel UX and protected CIDR policy patch.

## Changed

- Tray Panel now has a new connection header card, semantic VPN status badge, selected profile context, and Open Window action.
- Profiles/Tools now use a modern blue segmented control.
- Profile cards now show connection state, VPN destination CIDR, traffic/Quick Connect context, and compact status badges.
- Main profile toolbar now separates Profile/Connection/Activity views, primary Profile Config/Connect actions, and secondary tools.

## Added

- Admin Mode setting **Block duplicate VPN destination CIDRs**.
- When enabled, Connect is blocked if an active tunnel already uses the same normalized IPv4 or IPv6 destination CIDR.
- Conflict messages identify the active profile and exact CIDR.
- Policy is disabled by default and persists locally after Apply.

## Fixed

- Corrected `V.2026.29.1.0`, which contained only a subtle Tray refinement rather than the promised full redesign.
- Corrected Connect/Disconnect client timeout so it waits for the helper's real WireGuard result instead of failing at 20 seconds while the helper is still working.
- Restored direct Update Available / Download for `V.2026.29.0.1` instead of leaving that client in a Manual-only state without a usable popup.

## QA and artifact

- 20 automated tests passed.
- `ALTOVPN-WG-V.2026.29.1.1-win-x64-setup.exe`
- Size: `173122383` bytes
- SHA256: `15B80D2AEC62D617ECF9BB634E8A910B856DF0D2F7BC97056B625D6A4CEB0B62`
- Modern Installer EXE only; no MSI and no Git LFS.
