# ALTOVPN-WG V.2026.26.1.6

## Fixed

- Fixed MSI release builds so the packaged `ALTOVPN-WG.exe` and `AltoVpnWgHelper.exe` receive the same app version as the MSI artifact.
- Fixed installer dialog readability on the dark ALTOVPN-WG background by applying explicit light text styles to text-bearing installer controls.
- Fixed helper pipe calls that could hang while waiting for a response after the pipe connection succeeded.
- Fixed update check failure state so stale Install Update buttons are cleared after a failed refresh.
- Fixed the Connect/Disconnect button remaining disabled after a native bridge timeout.

## Improved

- Reduced connect/disconnect UI latency by shortening tunnel-state wait polling and moving manager status refresh to the background after a tunnel toggle.
- Update installation now starts `msiexec` immediately after SHA256 verification and returns the installer PID plus log path when scheduling succeeds.

## Release Metadata

- Built the Windows x64 MSI with ProductVersion `226.26.16`.
- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.6-win-x64.msi` installer.
