# ALTOVPN-WG V.2026.25.0.2 Release Notes

Release date: 2026-06-17

## Versioning

- App version: `V.2026.25.0.2`
- Assembly/file version: `2026.25.0.2`
- MSI product version: `226.25.2`
- Runtime: `win-x64`

## Highlights

- Settings is now a compact dialog instead of a long sidebar menu.
- Admin Mode is protected by a native passcode prompt and locks again when Settings closes.
- Auto Disconnect moved into Admin Mode.
- Admin Mode can set the maximum number of active tunnels.
- Private keys can be revealed or updated by explicitly selecting a profile.
- Active tunnel limit violations now show themed warnings in both WebView and tray panel flows.
- WG Manager actions are grouped in a dedicated dialog.
- About uses an in-app themed dialog with product details and copyright.

## Fixes

- Fixed tray profile rows requiring horizontal scrolling.
- Fixed tray panel actions closing the panel after button clicks.
- Fixed native-looking Windows popups appearing from tray tunnel-limit warnings.
- Fixed About details being compressed by global dashboard styles.

## Security Notes

- Private key reveal/update remains local to the desktop client.
- Private key update requires the profile to be disconnected.
- Protected Admin Mode actions still validate through native host prompts; web UI state alone is not trusted.
- The active tunnel limit is enforced in the native controller before tunnel connection starts.

## Build Artifact

Expected installer path:

```text
artifacts\altovpn-wg\installer\ALTOVPN-WG-V.2026.25.0.2-win-x64.msi
```
