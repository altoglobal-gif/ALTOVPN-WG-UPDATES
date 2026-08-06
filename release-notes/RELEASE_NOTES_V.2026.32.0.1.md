# ALTOVPN-WG V.2026.32.0.1 Main / Stable

Windows Stable release. Ubuntu remains a release candidate and is not included in the public update manifest.

## Highlights

- Bundled signed WireGuard runtime binaries replace the separate WireGuard desktop dependency.
- Microsoft’s signed WebView2 Evergreen bootstrapper installs the runtime when required.
- Client Mode can create a protected Cloudflare WARP profile with pinned WGCF `2.2.32` after Admin unlock and Terms confirmation.
- App, Helper, and installer advance together to `V.2026.32.0.1`.
- Quiet updates compare the installed and packaged Helper versions, choosing a tunnel-safe full reinstall when they differ.

## Validation

- Windows host and installer policy tests pass `56/56`.
- Windows App, Helper, installer, hosted release artifact, bridge parity, release metadata, production Web UI, and npm audit gates pass.
- GitHub-hosted artifact metadata and SHA256 match the uploaded asset.
- The local UAC installed-update smoke was declined and skipped at the owner’s direction; this release does not claim a successful installed transition on that machine.

## Artifact

- `ALTOVPN-WG-V.2026.32.0.1-win-x64-app-update.exe`
- Size: `149802670` bytes
- SHA256: `178383D7B16DAE38B079AA4595543E19FACAF8086B9C001391D5D2D6C06A58A6`
