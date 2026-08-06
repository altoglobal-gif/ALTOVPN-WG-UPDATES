# Dev → Beta → Stable

- `dev` branch + `dev.json`: all new work starts here.
- `beta` branch + `beta.json`: opt-in Beta users receive an approved Dev artifact.
- `main` branch + `latest.json`/`stable.json`: production Stable.

Promotion reuses the exact same release asset, size, and SHA256. Never rebuild between Dev, Beta, and Stable.

An explicitly approved direct-to-Stable release may update `main`/`stable.json` without changing Beta. Record that exception in the release notes and keep Beta on its previously published version.

Desktop and helper versions are independent. App-only updates use the existing LocalSystem helper without UAC and contain no helper files. Full setup is allowed only for a genuine helper change or the final missing/unusable helper fallback.

## Windows artifact contract

- Publish one Full Setup EXE for interactive install and maintenance. When ALTOVPN-WG is already installed it provides **Repair App**, **Reinstall Full**, **Reinstall Only Helper**, and **Uninstall**.
- Publish a matching `*-app-update.exe` for the in-app updater. It contains desktop files only and is installed by the existing LocalSystem helper.
- `artifact` (or `appUpdateArtifact`) must be the app-only EXE or a web patch. Full Setup belongs in `fallbackArtifact` for manual recovery and must never be selected automatically after a download failure.
- For releases that change the Helper, first deliver the desktop app-only artifact through the app. The new Full Setup remains the explicit maintenance path for replacing the Helper until a dedicated helper-update contract is released and verified.
- Build both Windows artifacts with:
  `powershell -ExecutionPolicy Bypass -File .\scripts\build-modern-installer.ps1 -Version <version> -HelperVersion <version> -BuildAppUpdateCompanion`

An explicitly approved unified single-file promotion may publish one full-payload
installer through the established `*-app-update.exe` / `desktop-client` contract
so already released clients can accept it. The installer must perform a full App
+ Helper + WireGuard install when the Helper is absent, but quiet update on an
existing installation must enter App Repair mode and leave the installed Helper
unchanged. The manifest omits `fallbackArtifact`, keeps `touchesHelper: false`
for the update path, and names the required Helper version.
