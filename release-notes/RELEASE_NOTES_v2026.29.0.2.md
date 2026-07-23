# ALTOVPN-WG V.2026.29.0.2

Update feedback and managed-device compatibility patch.

## Added

- Live Preparing, Downloading, Verifying, Scheduling, Ready, and Error stages.
- Download percentage, transferred bytes, and progress bars in Settings and Update Details.
- Lightweight update progress pushes without full application-state refreshes.

## Changed

- Settings now uses a control-center layout with clear update, system, support, and protected-policy rows.
- Recovery builds use isolated output directories to avoid antivirus-locked stale build files.

## Fixed

- Restart App now uses a copied native helper coordinator instead of `powershell.exe`.
- Update actions are disabled while an operation is active to prevent duplicate downloads.

## Artifact

- File: `ALTOVPN-WG-V.2026.29.0.2-win-x64-setup.exe`
- SHA256: `9B1B61A3E451208ACA5508312620CF9933F98EC032F4AB197BEFE92CAA3A76EC`
- Size: `172229455` bytes
- Type: `installer-exe`
- Git LFS: not used

## Upgrade from V.2026.28.1.1

Download the update, close ALTOVPN-WG, and choose **Exit & Install Update**. The old V.2026.28.1.1 Restart button still calls blocked PowerShell; after V.2026.29.0.2 is installed, Restart App uses the native coordinator.
