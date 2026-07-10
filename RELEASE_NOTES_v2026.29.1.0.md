# ALTOVPN-WG V.2026.29.1.0

Major Windows VPN visibility, workflow, and performance release.

## Added

- Network VPN Scanner for a selected connected profile destination CIDR.
- Live scan percentage/count, cancellation, reachable/all filters, reverse DNS, latency, MAC availability, vendor, and last-seen state.
- CSV and JSON export with sensitive-network-data warnings.
- IEEE Registration Authority OUI refresh with a seven-day local cache and bundled offline fallback.
- Automated CIDR, cancellation, performance, memory, update-floor, and payload-parity QA.

## Changed

- Profile Config is now a dedicated Basic/Advanced popup.
- Tray Panel uses a clearer VPN-first hierarchy with selected-profile actions and Quick Connect.
- Main Window connection status is more compact and prioritizes the active VPN state.

## Security and limits

- Only a CIDR configured on the selected connected profile can be scanned.
- `0.0.0.0/0` and `::/0` are blocked.
- Normal scans are capped at 256 addresses; Admin Mode supports at most 4,096.
- Discovered IP/MAC data is never submitted to IEEE. The app downloads the complete public OUI registry instead.
- MAC/vendor may correctly show unavailable across routed VPNs.

## Two-step update path

`V.2026.29.0.2` is the Safe Landing floor for this Major. If the installed client is older, follow [the one-time Safe Landing guide](LEGACY_BOOTSTRAP.md), confirm `V.2026.29.0.2`, then check for updates again.

## Artifact

- `ALTOVPN-WG-V.2026.29.1.0-win-x64-setup.exe`
- Size: `173119823` bytes
- SHA256: `C3AC1F3563ADDD6C37E4B302FAEAF052AAC54A21FEBD3C5967798106D35A98F2`
- Modern Installer EXE only
- MSI: not used
- Git LFS: not used
