# ALTOVPN-WG V.2026.28.1.0

## Major Update

- Reworked Software Update into a readable status summary with current/latest versions and next-step guidance.
- Reorganized Settings into Software Update, App & System, and Admin Mode sections.
- Split Admin Mode into Session Policy and Profile Credentials with explicit save actions.
- Scheduled updates install when the user fully exits ALTOVPN-WG; Restart App is no longer the only completion path.
- Restart App installs and reopens ALTOVPN-WG, while Exit installs without reopening it.
- Auto Disconnect changes now require Save Policy instead of applying immediately.
- Added visible Admin Mode Locked/Unlocked state and a Lock Now action.

## Artifact

- File: `ALTOVPN-WG-V.2026.28.1.0-win-x64.msi`
- MSI ProductVersion: `226.28.10`
- SHA256: `2B2CD1488A1EAFDDCBAD39AA3831519232788D0DBB303A4E2295D5F001330B07`
- Size: `97198080`

## Verification

- Windows app, helper service, and modern installer builds passed with no warnings or errors.
- MSI database ProductVersion is `226.28.10`.
- MSI contains the close-application action targeting `ALTOVPN-WG.exe`.
- New release binaries are published only as GitHub Release assets, without Git LFS.
