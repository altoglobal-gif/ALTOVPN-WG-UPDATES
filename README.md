# ALTOVPN-WG Updates

Public update manifest and release artifacts for ALTOVPN-WG.

This repository is intentionally separate from the application source tree so the desktop client can check for updates without embedding a GitHub token.

## Current Channel

- Channel: `stable`
- Manifest: `latest.json`
- Latest version: `V.2026.26.1.0`
- Minimum supported client: `V.2026.25.0.0`
- Artifact type: `msi` for this release; `webapp-patch` remains supported for UI-only updates

## Client Behavior

ALTOVPN-WG reads `latest.json`, compares the installed version, downloads the listed artifact, verifies file size and SHA256, then asks the local `AltoVpnWgHelper` service to apply the update.

Full desktop releases use an MSI artifact and are installed by the helper service through `msiexec` because native host, tray, service, or bridge code changed.

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
2. Copy the artifact into `releases/<version>/`.
3. Compute SHA256 and size.
4. Update `latest.json`.
5. Add release notes for the version.
6. Commit and push this repository.
7. Verify the raw `latest.json` URL and artifact URL return HTTP 200.
