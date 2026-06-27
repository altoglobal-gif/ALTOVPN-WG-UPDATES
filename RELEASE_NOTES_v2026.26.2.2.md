# ALTOVPN-WG V.2026.26.2.2

## Fix

- Fixed the modern setup executable failing to open with `Cannot locate resource 'assets/alto-icon.ico'`.
- Installer UI assets are now embedded WPF resources, so the single-file `.exe` does not require external icon or image files beside it.

## Artifact

- File: `ALTOVPN-WG-V.2026.26.2.2-win-x64-setup.exe`
- SHA256: `028A9E157D1EF58B15A608459342997801BBD26BCE92A5BCAA57C841FBB4280D`
- Size: `172210511`

## Verification

- `dotnet build` passed for the app, helper service, and modern installer.
- The setup executable was launched locally and stayed open without an immediate crash.
- Windows Application event log showed no new setup crash events after launch.
