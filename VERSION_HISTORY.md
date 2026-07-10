# ALTOVPN-WG version and updater history

Audited on 2026-07-10 from the public GitHub Releases API, update-repository tags/manifests, and native source history. “Source version” alone does not mean an installable client was released.

## Authoritative route now

| Native installed version | Route |
|---|---|
| Below `V.2026.28.1.1` | GitHub Release bridge is the final fallback |
| `V.2026.28.1.1`–`V.2026.29.1.6` | Existing helper applies app-only bridge `V.2026.29.1.7` without UAC |
| `V.2026.29.1.7` | Automatic `nextManifestUrl` → app-only stable `V.2026.29.1.8` |
| `V.2026.29.1.8` | Current desktop stable; helper remains `V.2026.29.1.6` |

The bridge avoids a manual reinstall for the verified native-worker generation. Very old clients remain on the explicit GitHub fallback rather than being forced through an unsafe scheduler.

## Public GitHub release assets (real downloadable releases)

| Version/tag | Public asset | Classification |
|---|---|---|
| `25.0.1` | `ALTOVPN-WG-webapp-V.2026.25.0.1-win-x64.zip` | UI package only |
| `25.0.2` | `ALTOVPN-WG-V.2026.25.0.2-win-x64.msi` | Legacy desktop |
| `25.0.3` | `ALTOVPN-WG-V.2026.25.0.3-win-x64.msi` | Legacy desktop |
| `26.0.6` | `ALTOVPN-WG-V.2026.26.0.6-win-x64.msi` | Legacy desktop |
| `26.0.7` | `ALTOVPN-WG-V.2026.26.0.7-win-x64.msi` | Legacy desktop |
| `26.0.8` | `ALTOVPN-WG-V.2026.26.0.8-win-x64.msi` | Legacy desktop |
| `26.0.9` | `ALTOVPN-WG-V.2026.26.0.9-win-x64.msi` | Legacy desktop |
| `26.1.0` | `ALTOVPN-WG-V.2026.26.1.0-win-x64.msi` | Legacy desktop |
| `26.1.1` | `ALTOVPN-WG-V.2026.26.1.1-win-x64.msi` | Legacy desktop |
| `26.1.2` | `ALTOVPN-WG-V.2026.26.1.2-win-x64.msi` | Legacy desktop |
| `26.1.3` | `ALTOVPN-WG-V.2026.26.1.3-win-x64.msi` | Legacy desktop |
| `26.1.4` | `ALTOVPN-WG-V.2026.26.1.4-win-x64.msi` | Legacy desktop |
| `26.1.5` | `ALTOVPN-WG-V.2026.26.1.5-win-x64.msi` | Legacy desktop |
| `26.2.0-modern-installer` | `ALTOVPN-WG-V.2026.26.2.0-win-x64-setup.exe` | Manual installer preview |
| `26.2.1-modern-installer` | `ALTOVPN-WG-V.2026.26.2.1-win-x64-setup.exe` | Manual installer preview |
| `26.2.2-modern-installer` | `ALTOVPN-WG-V.2026.26.2.2-win-x64-setup.exe` | Manual installer preview |
| `28.0.2` | `ALTOVPN-WG-V.2026.28.0.2-win-x64-setup.exe` | Transitional desktop |
| `28.0.3` | `ALTOVPN-WG-V.2026.28.0.3-win-x64.msi` | Transitional MSI regression |
| `28.0.4` | `ALTOVPN-WG-V.2026.28.0.4-win-x64.msi` | Transitional desktop |
| `28.1.0` | `ALTOVPN-WG-V.2026.28.1.0-win-x64.msi` | Transitional desktop |
| `28.1.1` | MSI and `ALTOVPN-WG-webapp-V.2026.28.1.1-win-x64.zip` | Recovery generation |
| `28.1.2` | `ALTOVPN-WG-webapp-V.2026.28.1.2-win-x64.zip` | Web UI only; no native desktop |
| `29.0.0` | `ALTOVPN-WG-V.2026.29.0.0-win-x64-setup.exe` | Modern desktop |
| `29.0.1` | `ALTOVPN-WG-V.2026.29.0.1-win-x64-setup.exe` | Compatibility recovery desktop |
| `29.0.2` | `ALTOVPN-WG-V.2026.29.0.2-win-x64-setup.exe` | Native restart coordinator |
| `29.1.0` | `ALTOVPN-WG-V.2026.29.1.0-win-x64-setup.exe` | Modern desktop |
| `29.1.1` | `ALTOVPN-WG-V.2026.29.1.1-win-x64-setup.exe` | Modern desktop |
| `29.1.2` | `ALTOVPN-WG-V.2026.29.1.2-win-x64-setup.exe` | Verified automatic floor |
| `29.1.3` | `ALTOVPN-WG-V.2026.29.1.3-win-x64-setup.exe` | Permanent Safe Main |
| `29.1.4` | `ALTOVPN-WG-V.2026.29.1.4-win-x64-setup.exe` | Previous stable |
| `29.1.5` | `ALTOVPN-WG-V.2026.29.1.5-win-x64-setup.exe` | In-place Safe Main bridge |
| `29.1.6` | `ALTOVPN-WG-V.2026.29.1.6-win-x64-setup.exe` | Current staged-update stable |
| `29.1.7` | `ALTOVPN-WG-V.2026.29.1.7-win-x64-app-update.exe` | App-only Safe Main; no helper payload |
| `29.1.8` | App-only primary plus full setup fallback | UAC-free Stable; helper pinned at 29.1.6 |

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
| `29.1.4` | Routed SSH scan corrective release | Previous stable |
| `29.1.5` | Universal in-place landing target with chained manifest support | Safe Main bridge |
| `29.1.6` | Stable completion with current feature set | Moving stable |
| `29.1.7` | App-only payload through existing LocalSystem helper | UAC-free Safe Main |
| `29.1.8` | App-only primary and full fallback; helper version decoupled | Current Stable |

## Rules that prevent another mixed route

1. Compare and route on the native desktop file version, never the Web UI fallback label.
2. A version enters the automatic matrix only after a real artifact exists and the complete hop is tested.
3. `latest.json.minimumSupportedVersion` must equal `compatibility.json.automaticUpdateFloor`.
4. Every known version must match exactly one compatibility route; the source release gate enforces this.
5. Safe Main remains pinned. Only a client that has landed on Safe Main follows `stable.json`.
6. Full installers are never scheduled while a tunnel is connected; legacy/manual recovery begins by disconnecting all tunnels.
7. Verify raw manifests, release asset HTTP 200, byte size, and SHA256 after every publication.
