# ALTOVPN-WG V.2026.26.1.2

Release date: 2026-06-24

## Fixed

- The Windows tray icon no longer falls back to the generic default app icon when the runtime asset path is unavailable. ALTOVPN-WG now uses the packaged icon asset first, then the icon embedded in the executable.
- Tray Panel actions are clearer: profile connect/disconnect, Quick Connect, Kill VPN, public-key copy, app open, and show/hide actions now use more explicit labels and tooltips.
- The selected-profile status in the Tray Panel now explains whether the profile is connected or disconnected and points users to the correct next action.

## Artifact

- File: `ALTOVPN-WG-V.2026.26.1.2-win-x64.msi`
- SHA256: `85F8936900015E4FD1D36C060EAF606627722A061C46A4F8DA4036B6DAA0B2E6`
- Size: `96948224` bytes
- MSI ProductVersion: `226.26.12`
