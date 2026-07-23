# ALTOVPN-WG V.2026.26.1.5

Published: 2026-06-24

## Fixed

- Prevented normal Tray Panel connect and Quick Connect results from opening the tunnel-limit warning panel.
- Increased WebView bridge timeouts for connect/disconnect and WireGuard manager start actions.
- Updated successful connect and disconnect actions to leave a clear final status message.
- Reduced unnecessary reconnect churn by treating network address changes as a health refresh instead of immediately reconnecting every active tunnel.

## Changed

- Made `Cancel` the default option on the destructive Kill VPN confirmation dialog.

## Verification

- Built the Windows x64 MSI with ProductVersion `226.26.15`.
- Verified Debug build and WebView script syntax.

## Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.5-win-x64.msi` installer.
