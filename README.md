# ALTOVPN-WG Updates

Public update manifest and release artifacts for ALTOVPN-WG.

This repository is intentionally separate from the application source tree so the desktop client can check for updates without embedding a GitHub token.

Historical release notes are stored in [`release-notes/`](release-notes/).

## Platform Status

- Windows Main/Stable is promoted to `V.2026.32.0.0` from the verified Beta artifact; Helper `V.2026.29.2.2` remains unchanged.
- Ubuntu Client/Site `V.2026.31.0.1` source is merged in the application repository through [PR #1](https://github.com/altoglobal-gif/ALTOVPN-WG/pull/1).
- Ubuntu artifacts and updater metadata are not published here yet. Native Ubuntu 22.04 and 24.04 acceptance must finish first.

## Current Channel

- Production channel: `stable` at `V.2026.32.0.0`
- Opt-in Beta channel: `V.2026.32.0.0`
- Legacy/Safe Main manifest: `latest.json`
- Moving stable manifest: `stable.json`
- Safe Main bridge: `V.2026.29.1.7` app-only
- Moving stable: `V.2026.32.0.0` signed app-only update with Full Setup fallback
- Automatic in-place floor: `V.2026.28.1.1`; older native clients use GitHub Release only as the final fallback
- Stable artifact: `ALTOVPN-WG-V.2026.32.0.0-win-x64-app-update.exe`
- Stable SHA256: `E0125AC51435692AC404D03E64E9166F198E3A4E22AF4531398FD0766D5FA63D`
- Stable fallback: `ALTOVPN-WG-V.2026.32.0.0-win-x64-setup.exe`
- Stable fallback SHA256: `FCEF5A2924B60D012CF8003A9EC51D79700079E6153C885A4081C8C57B82E485`
- Artifact type: Modern Installer `installer-exe`; new MSI releases are prohibited

## Client Behavior

Legacy ALTOVPN-WG clients read `latest.json`, which remains pinned to the permanent Safe Main release. Safe Main and newer clients follow its HTTPS-only `nextManifestUrl` to `stable.json` after the landing version is installed. Every artifact is verified by size and SHA256 before the local `AltoVpnWgHelper` schedules installation.

The installed native desktop file version is authoritative. `V.2026.29.0.3` is source-only and `V.2026.28.1.2` is Web UI-only; neither may be treated as a native updater generation. See [VERSION_HISTORY.md](VERSION_HISTORY.md).

Desktop and helper versions are independent. Ordinary releases remain app-only unless an explicitly approved unified release is required.

Stable `V.2026.32.0.0` is the verified app-only promotion of the Beta release. It keeps the established `desktop-client` / `-app-update.exe` contract for installed clients, leaves the existing Helper `V.2026.29.2.2` running, and uses the signed Full Setup only for fresh install, manual repair, or maintenance. The same artifact bytes, size, and SHA256 are used by Beta and Stable. `V.2026.32.0.1` remains withdrawn because endpoint security blocked its copied update worker before the installer started.

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
4. Update `stable.json`. Change `latest.json` only together with an intentional Safe Main policy change.
5. For a Helper-changing Stable promotion, add the required production-smoke attestation described in [`attestations/README.md`](attestations/README.md).
6. Run `powershell -ExecutionPolicy Bypass -File .\scripts\test-manifest-guard.ps1` and `powershell -ExecutionPolicy Bypass -File .\scripts\validate-manifests.ps1 -Online`.
7. Add release notes for the version and open a pull request; do not push a channel promotion directly to `main`.
8. Verify raw `latest.json`, raw `stable.json`, and the artifact URL return HTTP 200.

For a unified release, also verify that the GitHub Release contains exactly one asset and a clean-machine payload includes Helper and WireGuard. Helper-changing Stable promotions are rejected unless the exact artifact has a passing installed-transition smoke with Endpoint EDR enabled and explicit approval metadata. `V.2026.32.0.1` remains available only as a withdrawn forensic artifact and is blocked by `withdrawn-versions.json`.

Repository administrators should require the `Manifest channel guard / validate` check and Code Owner approval before merging channel changes. The workflow also audits pushes, but a required check is what prevents a bad manifest from reaching a protected branch.

For Ubuntu, do not add an artifact or manifest entry until the source QA document shows complete native Ubuntu 22.04/24.04 Client and Site acceptance. WSL2 validation alone is not sufficient for publication.

## Publishing Rules

- Never commit installer binaries or release artifacts to git, and never use Git LFS. Publish binaries only as GitHub Release assets.
- Publish application source changes in the standalone `ALTOVPN-WG` repository before publishing this update repository. Do not sync releases through `VPNCLIENT-WG-CORE-WEBAPP`.
- Keep each manifest aligned with its artifact: version, file name, download URL, SHA256, size, release notes URL, and tag must describe the same release.
- Do not use local-only `Updater/latest.json` changes as a real release; installed clients read the GitHub update repository by default.
- For full installer updates, preserve the helper install path: client downloads and verifies the artifact, then `AltoVpnWgHelper` verifies SHA256 again before running the installer.
