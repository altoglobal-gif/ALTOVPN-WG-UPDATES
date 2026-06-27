# ALTOVPN-WG V.2026.26.2.0 Modern Installer Preview

## Changed

- Added a custom .NET/WPF modern setup experience for ALTOVPN-WG.
- This installer is an `.exe` setup package, not WiX MSI and not MSIX.
- The setup UI uses a branded app-installer style, installs the desktop client, registers `AltoVpnWgHelper`, creates shortcuts, and registers an uninstall entry.

## Compatibility

- This artifact is published as a manual installer package first.
- The in-app update channel remains on MSI artifacts until deployed clients have installer-exe updater support.

## Release Metadata

- Artifact: `ALTOVPN-WG-V.2026.26.2.0-win-x64-setup.exe`
- SHA256: `ABFFA0B31833EE3EB67AF3AA16BA45C22041702B7287092CC36EFC4E1D3C6A17`
- Size: `171315069`
