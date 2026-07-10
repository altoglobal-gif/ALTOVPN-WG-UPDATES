# ALTOVPN-WG Updates

Public update manifest and release artifacts for ALTOVPN-WG.

This repository is intentionally separate from the application source tree so the desktop client can check for updates without embedding a GitHub token.

## Current Channel

- Channel: `stable`
- Manifest: `latest.json`
- Latest version: `V.2026.28.1.2` recovery web patch
- Minimum supported client: `V.2026.25.0.0`
- Artifact type: `msi` for broad old-client updater compatibility; `webapp-patch` remains supported for UI-only updates

## Client Behavior

ALTOVPN-WG reads `latest.json`, compares the installed version, downloads the listed artifact, verifies file size and SHA256, then asks the local `AltoVpnWgHelper` service to apply the update. If the primary artifact returns GitHub 404 and `fallbackArtifact` is present, clients that support fallback download and verify the latest full `.exe` installer URL instead.

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

1. Build the MSI for native/desktop changes, or stage `packages/web-ui` for UI-only patch changes.
2. Upload the artifact directly as a GitHub Release asset.
3. Compute SHA256 and size from the uploaded/downloaded artifact.
4. Update `latest.json`.
5. Add release notes for the version.
6. Commit and push this repository.
7. Verify the raw `latest.json` URL and artifact URL return HTTP 200.

## Publishing Rules

- Never commit installer binaries or release artifacts to git, and never use Git LFS. Publish binaries only as GitHub Release assets.
- Publish application source changes in the original source repository before publishing this update repository.
- Keep `latest.json` aligned with the built artifact: version, file name, download URL, SHA256, size, release notes URL, and tag must all describe the same release.
- Do not use local-only `Updater/latest.json` changes as a real release; installed clients read the GitHub update repository by default.
- For full installer updates, preserve the helper install path: client downloads and verifies the artifact, then `AltoVpnWgHelper` verifies SHA256 again before running the installer.
