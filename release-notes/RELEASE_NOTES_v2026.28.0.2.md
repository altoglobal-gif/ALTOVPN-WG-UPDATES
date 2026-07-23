# ALTOVPN-WG V.2026.28.0.2

## Fix

- Fixed silent in-app updates from modern-installer builds by closing the running ALTOVPN-WG desktop client before replacing installed files.
- This prevents the installer from failing when `ALTOVPN-WG.exe` or loaded application files are still locked by the running app.

## Artifact

- File: `ALTOVPN-WG-V.2026.28.0.2-win-x64-setup.exe`
- SHA256: `E8D10CA02676FEC576C097C894A9374936215292119DA4F26F5B9DD32E775A45`
- Size: `172212047`

## Verification

- `dotnet build` passed for the app, helper service, and modern installer.
- `scripts/build-modern-installer.ps1 -Version V.2026.28.0.2` created the Windows x64 setup executable.
