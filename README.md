# ALTOVPN-WG Updates

Public update manifest and release artifacts for ALTOVPN-WG.

This repository is intentionally separate from the application source tree so the desktop client can check for updates without embedding a GitHub token.

Historical release notes are stored in [`release-notes/`](release-notes/).

## Current Channel

- Production channel: `stable` at `V.2026.31.0.0`
- Opt-in Beta channel: `V.2026.29.2.3`
- Legacy/Safe Main manifest: `latest.json`
- Moving stable manifest: `stable.json`
- Safe Main bridge: `V.2026.29.1.7` app-only
- Moving stable: `V.2026.31.0.0` app-only update
- Automatic in-place floor: `V.2026.28.1.1`; older native clients use GitHub Release only as the final fallback
- Artifact type: Modern Installer `installer-exe`; new MSI releases are prohibited

## Client Behavior

Legacy ALTOVPN-WG clients read `latest.json`, which remains pinned to the permanent Safe Main release. Safe Main and newer clients follow its HTTPS-only `nextManifestUrl` to `stable.json` after the landing version is installed. Every artifact is verified by size and SHA256 before the local `AltoVpnWgHelper` schedules installation.

The installed native desktop file version is authoritative. `V.2026.29.0.3` is source-only and `V.2026.28.1.2` is Web UI-only; neither may be treated as a native updater generation. See [VERSION_HISTORY.md](VERSION_HISTORY.md).

Desktop and helper versions are independent. Ordinary updates contain no helper file and run through the existing LocalSystem helper without UAC. Full setup/UAC is fallback-only when the helper is missing, unusable, or genuinely changed.

Full desktop releases use a Modern Installer `.exe` artifact because native host, tray, service, or bridge code changed. Modern installer artifacts are started by the helper in quiet mode.

UI-only releases may use a ZIP `webapp-patch` artifact. Patch artifacts may only contain files under:

```text
packages/web-ui/
```

The helper service rejects patch entries outside that folder, rejects invalid paths, verifies SHA256 again, writes the files into the installed application folder, and stores the applied webapp version in:

```text
packages/web-ui/.webapp-version
```

Restart ALTOVPN-WG after applying an update so WebView2 reloads the updated application files.

## Publishing Checklist

1. Build the Modern Installer EXE for native/desktop changes, or stage `packages/web-ui` for UI-only patch changes.
2. Upload the artifact directly as a GitHub Release asset.
3. Compute SHA256 and size from the uploaded/downloaded artifact.
4. Update `stable.json`. Change `latest.json` only when intentionally replacing the permanent Safe Main landing release.
5. Add release notes for the version.
6. Commit and push this repository.
7. Verify raw `latest.json`, raw `stable.json`, and the artifact URL return HTTP 200.

## Publishing Rules

- Never commit installer binaries or release artifacts to git, and never use Git LFS. Publish binaries only as GitHub Release assets.
- Publish application source changes in the standalone `ALTOVPN-WG` repository before publishing this update repository. Do not sync releases through `VPNCLIENT-WG-CORE-WEBAPP`.
- Keep each manifest aligned with its artifact: version, file name, download URL, SHA256, size, release notes URL, and tag must describe the same release.
- Do not use local-only `Updater/latest.json` changes as a real release; installed clients read the GitHub update repository by default.
- For full installer updates, preserve the helper install path: client downloads and verifies the artifact, then `AltoVpnWgHelper` verifies SHA256 again before running the installer.
