# Changelog

## V.2026.32.0.1 Main / Stable - 2026-08-06

- Bundles signed WireGuard runtime binaries, the WebView2 Evergreen bootstrapper, and pinned WGCF `2.2.32`.
- Adds protected Cloudflare WARP profile creation in Windows Client Mode.
- Advances Windows App and Helper together to `V.2026.32.0.1`.
- Quiet unified updates compare Helper versions and choose full reinstall when the packaged Helper is newer or cannot be verified.
- Active WireGuard tunnels continue to block Helper-changing maintenance.
- Windows tests pass `56/56`; hosted builds, bridge parity, release/version gates, Web UI build, and npm audit pass.
- Published directly to Stable at the owner’s direction. The local UAC installed-update smoke was declined; no successful installed App/Helper transition is claimed.
- Ubuntu `V.2026.32.0.1` remains unpublished pending native Ubuntu 22.04/24.04 acceptance.

## Ubuntu V.2026.31.0.1 source milestone - 2026-07-30

- Ubuntu Client/Site release-candidate source merged to the application repository through [PR #1](https://github.com/altoglobal-gif/ALTOVPN-WG/pull/1).
- WSL2 Ubuntu 24.04.1 validation passed the Web UI build, helper/GUI/install/update smoke paths, and 48 Ubuntu tests.
- No Ubuntu artifact or updater manifest is published from this repository yet.
- Publication remains blocked pending native Ubuntu 22.04 and 24.04 Client/Site acceptance.

## V.2026.31.0.4 Main / Stable - 2026-07-30

### Unified single-file release

- Published one `*-app-update.exe` full-payload installer for both fresh installation and supported in-app update.
- Fresh machines receive App, Helper `V.2026.29.2.2`, and the pinned official WireGuard runtime.
- Existing installations enter App Repair mode and preserve the installed Helper.
- Retained the established `desktop-client` contract so already released clients accept the unified file; ordinary Full Setup names remain blocked.
- Stable users now resolve to `V.2026.31.0.4`.

### Validation

- Final release build verified the embedded Helper and WireGuard payload required by new machines.
- Windows host tests passed `51/51`.
- GitHub Release contains exactly one asset.
- Raw `stable.json` and the artifact returned HTTP 200; downloaded size was `178979747` bytes and SHA256 was `54C6FA1E2C8DEF3BFBBBE27BF21B1983F72FD5902FAFE9286CBFB55593FB4BE7`.
- Existing-install smoke testing completed with exit code `0`, preserved the running `V.2026.29.2.2` Helper, and changed none of the nine checked profile/channel files.

## V.2026.31.0.3 Beta - 2026-07-30

### Changed and fixed

- Hardened every Windows desktop surface against clipping during Main Window resize.
- Added bounded horizontal or vertical scrolling where content cannot fit safely.
- Kept profile, connection, activity, configuration, scanner, Settings, changelog, menus, overlays, and active-tunnel actions reachable.
- Preserved wide and tall layouts without stretching controls beyond their intended reading width.

### Release policy

- Beta points to the `V.2026.31.0.3` app-only artifact.
- This explicitly approved single-file release exposes only the app-update EXE and requires the existing `V.2026.29.2.2` Helper.
- Stable remains on `V.2026.31.0.0`.

## V.2026.31.0.2 Beta - 2026-07-30

### Changed and fixed

- Made Settings responsive to the available Main Window width with two- and three-column layouts.
- Removed the internal Settings scrollbar at the supported `920x680` minimum window size.
- Added compact short-window spacing and a focused protected-controls layout while Admin Mode is unlocked.

### Release policy

- Beta points to the `V.2026.31.0.2` app-only artifact.
- Helper remains `V.2026.29.2.2`; Full Setup is the manual fallback.
- Stable remains on `V.2026.31.0.0`.

## V.2026.31.0.1 Beta - 2026-07-30

### Changed and fixed

- Replaced predecessor namespace and package identities with standalone ALTOVPN-WG identities.
- Preserved the executable, AppData, Helper service, pipe, startup registry, single-instance, and update endpoint contracts.
- Made installer payload creation fail closed and validate file count, size, and SHA256 for every embedded entry.
- Verified the app-only update against an installed `V.2026.29.2.3` layout.

### Release policy

- Beta points to the `V.2026.31.0.1` app-only artifact.
- Helper remains `V.2026.29.2.2`; Full Setup is the manual fallback.
- Stable remains on `V.2026.31.0.0` pending Beta approval.

## V.2026.31.0.0 Main / Stable - 2026-07-30

### Changed and fixed

- Published the standalone ALTOVPN-WG safe app-update and Windows maintenance release directly to Stable.
- Restricted automatic updates to app-only EXEs or web patches and blocked Full Setup fallback after a missing app-update asset.
- Added explicit Repair App, Reinstall Full, Reinstall Only Helper, and Uninstall maintenance modes.
- Kept Helper `V.2026.29.2.2` unchanged and online for app-only repair.
- Preserved profiles and keys and blocked Helper/full/uninstall maintenance while a tunnel is active.

### Release policy

- Stable points to the `V.2026.31.0.0` app-only artifact.
- Full Setup is the manual maintenance and recovery fallback.
- This release bypasses Beta by explicit release approval.

## V.2026.29.2.2 Beta - 2026-07-16

### Added and changed

- Published the React 19 Main window refactor and responsive `920 x 680` safety floor to the opt-in Beta channel.
- Made CIDR compatibility visible for every selected profile and added a prominent Connect block plus gateway NAT plan when local and VPN destination networks overlap.
- Refreshed local CIDRs after adapter/address changes, immediately before Connect, and across active gatewayless adapters while excluding WireGuard/Wintun and link-local interfaces.
- Persisted Auto Disconnect deadlines in the helper with one protected extension and normal-exit fallback for older helper installations.

### Security and release policy

- Hardened helper schedule storage ACLs, monotonic deadlines, active-tunnel cancellation/policy rejection, and installed `ALTOVPN-WG.exe` caller validation.
- Bumped both App and Helper to `V.2026.29.2.2`; Beta uses the Full Setup artifact because this release changes the helper.
- Full Setup includes the pinned signed WireGuard MSI; App Update is published as a release asset but is not the Beta manifest target.
- Promoted to Stable on 2026-07-21 using the exact verified Full Setup artifact bytes.

## V.2026.29.2.1 Main / Stable - 2026-07-16

### Major

- Promoted the assisted Portal enrollment workflow and full Main/Tray UX refresh to the production target.
- Elevated VPN Destination Networks so users can identify the routed Site IP/CIDR immediately.
- Exposed Stable/Beta channel selection directly in Settings > Software Update.
- Published byte-identical App Update and Full Setup Modern Installer EXEs across Dev, Beta, and Stable.
- Added official pinned WireGuard for Windows to Full Setup for clean-machine installation; App Update remains App-only.

### Adoption policy

- Retained the verified Safe Main bridge and chained every compatible automatic client to Stable `V.2026.29.2.1`.
- Routed legacy clients to the current Full Setup bootstrap.
- Kept Helper unchanged at `V.2026.29.1.6`.
- Recorded the existing limitation that server metadata cannot add a hard runtime lock to old installed clients.

## V.2026.29.2.0 Dev - 2026-07-16

### Major

- Added assisted client-only enrollment for WireGuard Portal configs that omit `PrivateKey`.
- Generates one unique key pair per config, inserts the PrivateKey only into the managed local config, and exposes only the PublicKey for Portal registration.
- Persists a visible `Waiting for Portal` state and blocks Connect until the user selects `Portal Updated`.
- Makes Drag/Drop validation failures visible instead of silently returning to the dashboard.
- Adds protected Stable/Beta channel selection and context-aware installer maintenance.
- Prevents app-only updates from replacing the installed full maintenance setup.

### Release policy

- Dev prerelease only; Beta and Stable remain at `V.2026.29.1.8` pending observation.
- Helper remains unchanged at `V.2026.29.1.6`.
- Promotion must reuse these exact artifacts and SHA256 values without rebuilding.
- Artifacts are currently unsigned, and Full Setup still requires official WireGuard to be installed separately.

## V.2026.29.1.8 - 2026-07-10

- Completed the UAC-free app-only Bridge → Stable path.
- Kept the unchanged helper at `V.2026.29.1.6`; primary payload contains no helper files.
- Published full setup only as the final fallback.

## V.2026.29.1.7 - 2026-07-10

- Added app-only Safe Main scheduled by the existing LocalSystem helper without UAC.
- Stopped coupling helper version bumps to ordinary desktop releases.
- Added manifest/release-gate declarations that forbid helper replacement in app-only artifacts.

## V.2026.29.1.6 - 2026-07-10

- Completed the automatic in-place Bridge → Stable route.
- Preserved all routed SSH scan, OS detection, MAC/OUI, Tray Panel, and CIDR List functionality.
- Kept profile/key preservation, active-tunnel refusal, native worker restart coordination, and dual SHA256 verification.

## V.2026.29.1.5 - 2026-07-10

- Added an in-place Safe Main bridge for native `V.2026.28.1.1` through `V.2026.29.1.4`.
- Made GitHub Release installation the final fallback only for clients below the verified native-worker floor.
- Added automatic second-stage checking from the bridge to `V.2026.29.1.6` stable.

## Channel policy correction - 2026-07-10

- Raised the verified unattended floor from `V.2026.28.1.1` to `V.2026.29.1.2` after field failures from mixed native/Web UI generations.
- Classified `V.2026.29.0.3` as source-only and `V.2026.28.1.2` as Web UI-only.
- Routed every native version below `V.2026.29.1.2` to the documented one-time manual Safe Main recovery instead of an unverified direct jump.
- Added a complete public-asset and native-capability inventory plus an exhaustive compatibility route gate.

## V.2026.29.1.4 - 2026-07-10

### Corrective Patch

- Fixed Trust & Scan stopping after inventory instead of rescanning through the SSH device.
- Added automatic Linux, MikroTik RouterOS, and Windows OpenSSH command selection.
- Merged remote neighbor/ARP MAC addresses and IEEE OUI Manufacturer values into the client list.
- Added Scan again through SSH with one-time credentials and repeated host-key confirmation.
- Capped SSH pivot rescans at 256 native-validated IPv4 targets.
- Passed 29 automated tests plus host/installer/JavaScript validation.
- Modern Installer EXE only; no MSI and no Git LFS.

## V.2026.29.1.3 - 2026-07-10

### Safe Main

- Added permanent legacy-to-Safe-Main-to-stable staged update routing.
- Added TCP 22/80/443 discovery so ICMP-blocked routed devices can still be found.
- Added one-time host-key-confirmed Linux and MikroTik SSH inventory without credential storage.
- Expanded the scanner client list and added service/reachability columns.
- Rebalanced the Tray Panel, themed its profile scrollbar, and added a CIDR List with SSH actions.
- Added Modern Installer tunnel preflight and legacy-flow relaunch behavior.
- Passed 24 automated tests and release builds with zero errors/warnings.
- Modern Installer EXE only; no MSI and no Git LFS.

## V.2026.29.1.2 - 2026-07-10

### Corrective Patch

- Restored the Main Window profile list after an undefined Web UI state reference stopped rendering profile buttons in `V.2026.29.1.1`.
- Preserved existing `profiles.json`, managed `.conf` files, and WireGuard keys; no profile migration or regeneration is performed.
- Added mandatory disconnect preflight before a full installer update downloads or schedules.
- Blocked Connect, manual reconnect, permanent-connect recovery, and automatic reconnect throughout update maintenance.
- Serialized repeated update clicks to prevent overlapping downloads and helper scheduling.
- Corrected install-error wording and embedded the repaired UI in both main and Modern Installer payloads.
- Passed 21 automated tests and Release packaging QA.
- Modern Installer EXE only; no MSI and no new Git LFS.

## V.2026.29.1.1 - 2026-07-10

### Corrective Patch

- Replaced the lightly modified legacy Tray surface with the promised VPN-first design: connection header card, semantic status badge, blue segmented navigation, CIDR-aware profile cards, stronger primary action, and modern quick actions.
- Reworked the crowded Main profile toolbar into segmented view tabs, primary actions, and a compact secondary tool row.
- Added protected Admin Mode policy to block a profile from connecting when an active tunnel already uses the same normalized IPv4 or IPv6 destination CIDR.
- Added persistent policy state and a conflict message containing the active profile and exact CIDR.
- Restored direct Update Available / Download for `V.2026.29.0.1` by keeping the automatic floor at `V.2026.28.1.1`.
- Fixed tunnel operations timing out in the client at 20 seconds before the helper's 30-second command budget completed.
- Passed 20 automated tests plus host/helper/installer, XAML, bridge, JavaScript, CSS, and payload QA.
- Modern Installer EXE only; no MSI and no Git LFS.

## V.2026.29.1.0 - 2026-07-10

### Major

- Added Network VPN Scanner with selected routed-CIDR enforcement, live progress, cancellation, reverse DNS, latency, neighbor-table MAC availability, and CSV/JSON export.
- Added IEEE-first OUI vendor database refresh with a seven-day cache and bundled offline fallback; discovered addresses are never submitted to IEEE.
- Added `/24` normal limits, Admin-only larger ranges up to 4,096 addresses, and mandatory default-route blocking.
- Moved Profile Config into a dedicated Basic/Advanced popup.
- Refined Tray Panel around VPN status, selected profile, Connect/Disconnect, and Quick Connect.
- Reworked the Main Window connection status into a compact modern VPN summary.
- Promoted `V.2026.29.0.2` to the permanent Safe Landing floor; older clients install it first and check again for this Major.
- Published Modern Installer EXE only; no MSI and no Git LFS.

## V.2026.29.0.2 - 2026-07-10

### Added

- Added live update stages, percentage, transferred bytes, and progress bars.

### Changed

- Redesigned Settings as a control center instead of a grid of equal action buttons.

### Fixed

- Removed PowerShell from Restart App update coordination.
- Isolated recovery build output to avoid antivirus-locked stale files.

## V.2026.29.0.1 - 2026-07-10

### Fixed

- Restored the latest Settings/Admin UI in the packaged Modern Installer.
- Preserved Lock Now, Unlimited tunnels, session policy, and profile credentials.
- Corrected V.2026.28.1.1 updater compatibility with the `installer-exe` artifact contract.

### Changed

- Added explicit update compatibility routes and a release-gate check.

## V.2026.29.0.0 - 2026-07-10

### Added

- Added VPN Destination Networks with readable CIDR chips and route-mode warnings.
- Restored the Modern Installer `.exe` as the Windows updater artifact.
- Added the Network VPN Scanner roadmap.

### Changed

- Refined Main Window, Tray Panel, and What's New UX.
- Replaced full-state traffic pushes with compact telemetry updates.
- Consolidated WireGuard health polling and moved DNS diagnostics off PowerShell.

### Fixed

- Corrected the updater artifact type to `installer-exe` for V.2026.28.1.1 compatibility.
- Prevented overlapping timer callbacks and repeated unchanged rendering.
- Improved installer file replacement while the old client closes.

### Removed

- Removed MSI from the primary updater path.

## V.2026.28.1.2 - 2026-07-10

### Added

- Added categorized changelog cards to Update Details: Added, Changed, Fixed, and Removed.
- Added per-category counts and automatic hiding for empty categories.

### Changed

- Update Details now separates release changes from technical artifact/status details.

## V.2026.28.1.1 - 2026-07-10

### Critical Recovery

- Replaced the PowerShell update worker with a self-contained native helper worker.
- Published a web UI recovery patch so `V.2026.28.0.4` clients can receive a Download Full Installer path without invoking blocked PowerShell.
- Full MSI includes the major Settings/Admin Mode redesign and update-on-exit behavior.

## V.2026.28.1.0 - 2026-07-10

### Major Update

- Reworked Software Update, Settings, and Admin Mode for clearer status, grouping, and explicit save actions.
- Scheduled updates now install on full Exit as well as Restart App.
- Exit dialogs clearly distinguish install-and-reopen from install-without-reopening behavior.

### Release

- Published the Windows x64 MSI with MSI ProductVersion `226.28.10`.

## V.2026.28.0.4 - 2026-07-10

### Fixed

- Prevented silent MSI updates from stopping or replacing the helper while the old desktop client is still running.
- Made Restart App wait for installer completion before reopening ALTOVPN-WG.
- Added MSI-side client shutdown for compatibility with older MSI-only updaters.
- Added a final active-tunnel safety check immediately before installer startup.

### Release

- Published the Windows x64 MSI bridge update with MSI ProductVersion `226.28.4`.

## V.2026.28.0.3 - 2026-07-09

### Changed

- Published the latest desktop client as an MSI bridge release so older in-app updaters that only support MSI artifacts can still update to the current client.
- The installed client still includes the modern installer updater compatibility fix from `V.2026.28.0.2`.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.28.0.3-win-x64.msi` installer.

## V.2026.28.0.2 - 2026-07-09

### Fixed

- Fixed silent in-app modern installer updates by closing the running desktop client before replacing installed files.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.28.0.2-win-x64-setup.exe` installer.

## V.2026.28.0.1 - 2026-07-08

### Changed

- Removed the pilot network scanner feature from the desktop client.
- Added an Unlimited option for Max Active Tunnels while keeping the admin passcode confirmation on save.
- Published the Modern Installer `.exe` as the update artifact for this release.

### Fixed

- Added update fallback metadata and client fallback handling so a GitHub 404 on the primary artifact can use the latest full `.exe` installer URL instead.
- Unlimited Max Active Tunnels no longer blocks additional tunnel connections.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.28.0.1-win-x64-setup.exe` installer.

## V.2026.26.2.0 - 2026-06-27

### Added

- Added a custom .NET/WPF modern setup experience for ALTOVPN-WG.
- Published a manual `.exe` setup package that is not WiX MSI and not MSIX.
- The setup package installs the app payload, registers `AltoVpnWgHelper`, creates shortcuts, and registers an uninstall entry.

### Compatibility

- The in-app update channel remains on MSI artifacts until deployed clients have installer-exe updater support.

## V.2026.26.1.9 - 2026-06-27

### Changed

- Refreshed the MSI setup wizard visuals with a modern app-installer style while keeping the package as MSI/WiX.
- Replaced the dark full-panel wizard art with a branded left rail and light content card for reliable readability.
- Updated installer typography to Segoe UI project styles.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.9-win-x64.msi` installer.

## V.2026.26.1.8 - 2026-06-27

### Fixed

- Fixed installer readability on Welcome, Interrupted, Error, and other WixUI dialogs by replacing the dark content panel with a light panel.
- Normalized MSI text controls to project text styles so titles and descriptions remain readable across installer states.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.8-win-x64.msi` installer.

## V.2026.26.1.7 - 2026-06-27

### Fixed

- Prevented MSI/full desktop update installation from starting while any VPN tunnel is connected.
- Kept active VPN sessions and the helper service online by pausing before helper/MSI installation when connected profiles exist.
- Allowed non-helper web UI patch updates to remain eligible while connected.
- Left the update available after a protected-session pause so users can install later during a maintenance window.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.7-win-x64.msi` installer.

## V.2026.26.1.6 - 2026-06-27

### Fixed

- Aligned MSI build parameters with host and helper binary versions so published artifacts do not report stale app versions.
- Patched installer dialog text styles across dark-background dialogs to avoid black text on black backgrounds.
- Added helper response timeouts to prevent privileged operations from hanging indefinitely after a pipe connection succeeds.
- Cleared stale update availability state when update checks fail.
- Re-enabled the Connect/Disconnect action after native bridge command timeouts.

### Changed

- Reduced connect/disconnect wait time and moved manager status refresh to the background after tunnel toggles.
- Update install scheduling now starts `msiexec` immediately and returns the installer PID/log path after SHA256 verification.

### Release

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.6-win-x64.msi` installer.

## V.2026.26.1.5 - 2026-06-24

### Fixed

- Prevented normal Tray Panel connect and Quick Connect results from opening the tunnel-limit warning panel.
- Increased WebView bridge timeouts for connect/disconnect and WireGuard manager start actions.
- Updated successful connect and disconnect actions to leave a clear final status message.
- Reduced unnecessary reconnect churn by treating network address changes as a health refresh instead of immediately reconnecting every active tunnel.

### Changed

- Made `Cancel` the default option on the destructive Kill VPN confirmation dialog.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.5-win-x64.msi` installer.

## V.2026.26.1.4 - 2026-06-24

### Fixed

- Synced Tray Panel profile selection back to the main app state so selected-profile actions no longer drift from the web UI.
- Clarified the Quick Connect tile by showing the target profile name and disabling it when no Quick Connect profile is configured.
- Disabled selected-profile Diagnose and Health actions when no profile is selected.
- Added confirmation before Kill VPN runs from either the Tray Panel or WebView UI.
- Prevented the Tray Panel from auto-hiding immediately while native dialogs or prompts are opening.
- Increased native bridge timeouts for long-running update install, reconnect, diagnostics, export, and WireGuard manager actions.
- Locked additional profile actions while config editing is active to avoid mixed edit/action state.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.4-win-x64.msi` installer.

## V.2026.26.1.3 - 2026-06-24

### Fixed

- Clarified Tray Panel connection state by tying the header status to the selected profile instead of the global active-tunnel count.
- Made connected profiles visually obvious in the Tray Panel profile list with a stronger row highlight, green border, larger status dot, and `CONNECTED` badge.
- Fixed Tray Panel refresh causing profile selection to jump during live state updates.
- Fixed Tray Panel Reconnect being available for disconnected profiles; reconnect is now limited to already-connected profiles and no longer starts an extra tunnel.
- Replaced the low-value bottom `Public Key` quick tile with `Diagnose / Health` for selected-profile diagnostics.
- Kept the tray icon on the ALTOVPN-WG icon by falling back to the executable icon if the runtime asset path cannot be resolved.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.3-win-x64.msi` installer.

## V.2026.26.1.2 - 2026-06-24

### Fixed

- Fixed the Windows tray icon falling back to the default application icon when the external icon asset cannot be resolved at runtime; the app now falls back to the embedded executable icon before using a system fallback.
- Clarified Tray Panel actions with more explicit labels and tooltips for opening the app, connecting the selected profile, Quick Connect, emergency Kill VPN, public-key copy, and window show/hide behavior.
- Improved Tray Panel selected-profile status copy so disconnected profiles clearly point users to the Connect selected action.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.2-win-x64.msi` installer.

## V.2026.26.1.1 - 2026-06-23

### Fixed

- Fixed update installation false failures by allowing the desktop client to wait longer for helper MSI SHA256 verification.
- Kept helper-side update validation synchronous so `Installer scheduled` is only returned after path and hash checks pass.
- Reduced machine-freeze risk by running DNS and route diagnostics only during manual Diagnose or forced health refresh instead of every health poll.
- Reduced reconnect churn by limiting automatic reconnect to inactive tunnels and network-change recovery; stale/no-handshake states now warn without restarting the tunnel.
- Switched the helper pipe ACL package from preview to stable `System.IO.Pipes.AccessControl` `5.0.0`.

### Changed

- Published the compact Tray Settings and Connection Detail UI cleanup in the update channel.
- Preserved the intentional admin passcode workflow.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.1-win-x64.msi` installer.

## V.2026.26.1.0 - 2026-06-23

### Major

- Promoted this release to the `2026.26.1.x` major line for production VPN client improvements.
- Added functional Tray Settings actions for auto-disconnect modes, selected-profile diagnose/reconnect, diagnostics export, update check, and app restart.
- Added exit confirmation when quitting ALTOVPN-WG from the tray.
- Added WireGuard import validation and preview before saving imported `.conf` profiles.
- Added redacted diagnostic bundle export for support/debug workflows.
- Added DNS, route, tunnel mode, latest handshake, runtime endpoint, latency, and auto reconnect health details.
- Added tray notifications for connect/disconnect, reconnect, update restart required, and VPN health warnings.
- Added user-friendly error mapping for common WireGuard/helper/config/update failures.

### Security

- Diagnostic bundle export redacts private and preshared keys before writing reports.
- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.1.0-win-x64.msi` installer.

## V.2026.26.0.9 - 2026-06-23

### Fixed

- Removed the duplicate Check Update button from the Changelog modal.
- Fixed Open Release Notes in the WebView2 client by routing the action through the native host and default browser.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.0.9-win-x64.msi` installer.

## V.2026.26.0.8 - 2026-06-23

### Changed

- Published a migration MSI that keeps the displayed app version as `V.2026.26.0.8` while using MSI `ProductVersion` `226.26.8`.
- This migration build allows machines with earlier `2026.26.0.x` MSI product-version registrations to remove the old package before installing the new package.

### Fixed

- Restored visible update status in the ALTOVPN-WG WebView2 client header.
- Restored the Changelog view in Settings with release-note links.
- Added an explicit Install Update action so Check Update can show availability before installation.
- GitHub manifest fallback reads decoded contents correctly when curl.exe is used.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.0.8-win-x64.msi` installer.

## V.2026.26.0.7 - 2026-06-23

### Added

- Restored visible update status in the ALTOVPN-WG WebView2 client header.
- Restored the Changelog view in Settings with release-note links.
- Added an explicit Install Update action so Check Update can show availability before installation.

### Fixed

- Check Update no longer silently downloads and schedules installation before showing update state.
- Update metadata remains visible after a download completes or installation is deferred.
- GitHub manifest fallback reads decoded contents correctly when curl.exe is used.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.0.7-win-x64.msi` installer.

## V.2026.26.0.6 - 2026-06-23

### Added

- Published the Windows x64 MSI for the drag-and-drop WireGuard profile import release.
- Added release metadata for `ALTOVPN-WG-V.2026.26.0.6-win-x64.msi`.

### Fixed

- Drag-and-drop imported profile names now keep the original `.conf` filename without a GUID hash suffix.
- Included cumulative V.2026.26.0.x stability and installer fixes from the Windows WebView2 client.

### Security

- Update metadata points to the SHA256-verified `ALTOVPN-WG-V.2026.26.0.6-win-x64.msi` installer.

## V.2026.25.0.3 - 2026-06-17

### Fixed

- Published the duplicate-key and generated-profile cleanup fixes from the Windows WebView2 client.
- Preserved imported WireGuard configs that already contain their own `PrivateKey`.
- Fixed bridge responses for commands that do not include a `profileId`.

### Security

- Update metadata now points to the SHA256-verified `ALTOVPN-WG-V.2026.25.0.3-win-x64.msi` installer.
- Client-side key generation now retries duplicate private/public key pairs and rejects duplicate private keys on save.

## V.2026.25.0.2 - 2026-06-17

### Added

- Published the full ALTOVPN-WG desktop client installer update for tray panel, Settings, Admin Mode, and tunnel-limit controls.
- Added release metadata for `ALTOVPN-WG-V.2026.25.0.2-win-x64.msi`.

### Changed

- Switched this release artifact from `webapp-patch` to full `msi` because native Windows host and tray code changed.

### Security

- Installer download is SHA256 verified before privileged helper installation.

## V.2026.25.0.1 - 2026-06-17

### Added

- Added the first ALTOVPN-WG webapp binary patch channel.
- Published `ALTOVPN-WG-webapp-V.2026.25.0.1-win-x64.zip` as a `webapp-patch` artifact.

### Changed

- Update artifacts for web UI changes no longer require a full MSI installer.

### Security

- Patch artifacts are SHA256 verified before and during privileged application.
- Patch contents are constrained to `packages/web-ui/**`.
