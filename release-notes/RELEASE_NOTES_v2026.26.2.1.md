# ALTOVPN-WG V.2026.26.2.1

## Modern Installer

- Replaced the WiX/MSI path for the new manual installer with a custom .NET/WPF setup executable.
- Keeps the installer visual style closer to a modern Windows app installer while remaining a normal `.exe`, not MSIX.
- Installs the desktop client, app assets, WebView payload, helper service, shortcuts, and uninstall entry.

## Helper Service Safety

- The installer compares the embedded `AltoVpnWgHelper.exe` payload hash with the installed helper before making service changes.
- If the helper binary is unchanged, the running helper service is preserved so active VPN sessions are not interrupted by app-only updates.
- The helper service is stopped and recreated only when the helper itself changes or is missing.

## Artifact

- File: `ALTOVPN-WG-V.2026.26.2.1-win-x64-setup.exe`
- SHA256: `25E4F7C603928AAF4038900ACE95D1A36E06CD61991355E4383689F511F2520A`
- Size: `171452797`

## Compatibility Note

This release is published as a manual GitHub Release asset first. Keep `latest.json` on MSI artifacts until deployed clients include installer-exe updater support.
