# Update ALTOVPN-WG from an older version

Use this one-time recovery path for clients older than `V.2026.28.1.1`, or whenever an older updater reports an MSI, PowerShell, or installer-type error.

## One-time bootstrap

1. Disconnect all VPN tunnels.
2. Download [ALTOVPN-WG V.2026.29.0.2 Windows Setup](https://github.com/altoglobal-gif/ALTOVPN-WG-UPDATES/releases/download/v2026.29.0.2/ALTOVPN-WG-V.2026.29.0.2-win-x64-setup.exe).
3. Close ALTOVPN-WG completely.
4. Run the downloaded setup EXE as Administrator.
5. Open ALTOVPN-WG and confirm that the version is `V.2026.29.0.2`.

Profiles and private keys remain in the existing ALTOVPN-WG profile store. `V.2026.29.0.2` is the permanent Safe Landing release with the native restart coordinator.

## Continue to the current Major

1. Open `V.2026.29.0.2`.
2. Open **Settings → Check Update**.
3. Download and install `V.2026.29.1.1`.
4. Exit or choose Restart & Finish, then confirm the installed version is `V.2026.29.1.1`.

This deliberate second check prevents legacy clients from skipping the Safe Landing update worker.

## Verification

- Size: `172229455` bytes
- SHA256: `9B1B61A3E451208ACA5508312620CF9933F98EC032F4AB197BEFE92CAA3A76EC`
- [Release notes](https://github.com/altoglobal-gif/ALTOVPN-WG-UPDATES/releases/tag/v2026.29.0.2)
- MSI: not used
- Git LFS: not used

## Current Major verification

- File: `ALTOVPN-WG-V.2026.29.1.1-win-x64-setup.exe`
- Size: `173122383` bytes
- SHA256: `15B80D2AEC62D617ECF9BB634E8A910B856DF0D2F7BC97056B625D6A4CEB0B62`
- [Current release notes](RELEASE_NOTES_v2026.29.1.1.md)
