# ALTOVPN-WG V.2026.28.1.1 Recovery Release

## Critical Fix

- Replaced the PowerShell update worker with a self-contained native helper worker.
- Avoids `powershell.exe` access-denied failures on managed Windows devices.
- Recovery web patch updates the UI on older clients and exposes the full installer release page.

## Assets

- `ALTOVPN-WG-V.2026.28.1.1-win-x64.msi`
  - MSI ProductVersion: `226.28.11`
  - SHA256: `DF76F6E82F7B709DDEDF518B6349B744C987112CD5A00BF587DF84055F9C567D`
  - Size: `97202176`
- `ALTOVPN-WG-webapp-V.2026.28.1.1-win-x64.zip`
  - SHA256: `A486F9BAA34A221B57A5B896F841E7B290C24219E84B18D53F59B60FA0C56609`
  - Size: `766672`
