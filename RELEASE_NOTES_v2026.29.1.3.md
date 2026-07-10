# ALTOVPN-WG V.2026.29.1.3

Safe Main staged-update, routed discovery, SSH inventory, and Tray Panel consistency release.

## Update path

- `latest.json` permanently lands compatible older clients on this Safe Main release.
- After relaunch, Safe Main follows HTTPS-only `stable.json` and checks again for a higher release.
- Only native `V.2026.29.1.2` is accepted for automatic landing. Older clients use the one-time Modern Installer EXE bootstrap; no new MSI is published.
- `V.2026.29.0.3` is source-only and `V.2026.28.1.2` is Web UI-only; neither is an automatic native baseline.

## Discovery and SSH

- Routed discovery now checks ICMP plus TCP 22, 80, and 443.
- Layer-3 routed devices are no longer labeled unavailable simply because MAC/ARP data is hidden.
- SSH actions appear only for discovered TCP 22 targets.
- Credentials are requested by native controls, never stored or sent to the web UI, and host-key confirmation is mandatory.
- Linux and MikroTik use fixed read-only inventory commands.

## UI

- Expanded the scanner for wider and longer client lists.
- Rebalanced the native Tray Panel design and added a themed profile scrollbar.
- Added a Tray **CIDR List** with service labels and SSH actions.

## Verification

- Windows host tests: 24 passed, 0 failed.
- Host and Modern Installer builds: 0 warnings, 0 errors.
- Inline Web UI JavaScript syntax passed.
- Artifact: `ALTOVPN-WG-V.2026.29.1.3-win-x64-setup.exe`
- Size: `175965352` bytes
- SHA256: `8BCE137AC2F80991E020AD30DCBF8061C28AC92DC7659E0772DAF9A5CAB071B7`
- MSI: not used
