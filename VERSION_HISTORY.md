# ALTOVPN-WG version and updater history

Audited on 2026-07-10 from the public GitHub Releases API, update-repository tags/manifests, and native source history. “Source version” alone does not mean an installable client was released.

## Authoritative route now

| Native installed version | Route |
|---|---|
| Below `V.2026.29.1.2` | One-time manual install of Safe Main `V.2026.29.1.3`; relaunch; check again |
| `V.2026.29.1.2` | Automatic `latest.json` → `V.2026.29.1.3` |
| `V.2026.29.1.3` | Automatic `nextManifestUrl` → `stable.json` → `V.2026.29.1.4` |
| `V.2026.29.1.4` | Current stable |

No lower version is claimed as unattended-compatible. This deliberately stops `29.0.1`, a UI-labeled `29.0.3`, or a 26–28 client from jumping directly into an unverified installer path.

## Public GitHub release assets (real downloadable releases)

| Version/tag | Public asset | Classification |
|---|---|---|
| `25.0.1` | Webapp ZIP | UI package only |
| `25.0.2`–`25.0.3` | MSI | Legacy desktop |
| `26.0.6`–`26.0.9` | MSI | Legacy desktop |
| `26.1.0`–`26.1.5` | MSI | Legacy desktop |
| `26.2.0`–`26.2.2-modern-installer` | Setup EXE | Manual Modern Installer previews; tags carry the suffix |
| `28.0.2` | Setup EXE | Transitional desktop |
| `28.0.3`–`28.1.0` | MSI | Transitional desktop/regression era |
| `28.1.1` | MSI plus Webapp ZIP | Recovery generation |
| `28.1.2` | Webapp ZIP only | Not a native desktop/updater version |
| `29.0.0`–`29.0.2` | Setup EXE | Modern desktop; 29.0.2 introduced native restart coordination |
| `29.1.0`–`29.1.4` | Setup EXE | Modern desktop |

There is no public GitHub desktop release for `26.1.6`–`26.1.9`, `28.0.1`, or `29.0.3`.

## Source-only and misleading numbers

| Version | What actually exists | Consequence |
|---|---|---|
| `26.0.2`, `26.0.3`, `26.0.4` | Native source commits; no matching public release assets | Internal/source history only |
| `26.1.6`–`26.1.9` | Native source commits and updater tags/notes; no GitHub release assets | Do not promise downloadable automatic hops |
| `28.0.1` | Updater tag/note but no GitHub Release asset | Not a valid download target now |
| `28.1.2` | Public Web UI ZIP only | Native host remains the underlying desktop version |
| `29.0.3` | Source version bump only; no updater note, tag asset, or GitHub Release | Never use it as an installed Safe Main baseline |

## Native updater capability milestones

| Version/commit generation | Proven code change | Policy result |
|---|---|---|
| Through `26.1.9` | Update service accepted MSI and Web UI patch artifacts | Manual bootstrap to current EXE |
| `26.2.x` | Installer EXE acceptance and Modern Installer introduced | Still manual; no end-to-end current-route proof |
| `28.0.4` | Installer update lifecycle repair | Historical milestone, not current floor |
| `28.1.1` | PowerShell update worker replaced | Necessary but insufficient after field failures |
| `29.0.2` | Native progress/restart coordinator | Does not understand the Safe Main → stable manifest chain |
| `29.0.3` | Version/source baseline only | No released artifact |
| `29.1.2` | Tunnel disconnect preflight, maintenance lock, serialized update | Verified automatic floor |
| `29.1.3` | HTTPS-only chained-manifest resolver | Permanent Safe Main |
| `29.1.4` | Current routed SSH scan corrective release | Moving stable |

## Rules that prevent another mixed route

1. Compare and route on the native desktop file version, never the Web UI fallback label.
2. A version enters the automatic matrix only after a real artifact exists and the complete hop is tested.
3. `latest.json.minimumSupportedVersion` must equal `compatibility.json.automaticUpdateFloor`.
4. Every known version must match exactly one compatibility route; the source release gate enforces this.
5. Safe Main remains pinned. Only a client that has landed on Safe Main follows `stable.json`.
6. Full installers are never scheduled while a tunnel is connected; legacy/manual recovery begins by disconnecting all tunnels.
7. Verify raw manifests, release asset HTTP 200, byte size, and SHA256 after every publication.
