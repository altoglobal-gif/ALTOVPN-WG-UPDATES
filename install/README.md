# ALTOVPN-WG bootstrap installers

These scripts download a channel manifest, select only the native installer for
their operating system, and verify the package before starting installation.

Ubuntu Stable:

```bash
curl -fsSL https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/main/install/ubuntu.sh | bash
```

Windows Stable (PowerShell):

```powershell
irm https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/main/install/windows.ps1 | iex
```

Dev preview uses the Dev manifest deliberately:

```bash
ALTOVPN_CHANNEL=dev curl -fsSL https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/dev/install/ubuntu.sh | bash
```

```powershell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/dev/install/windows.ps1))) -Channel dev
```

Ubuntu verifies the manifest's pinned Ed25519 signature, package size, and
SHA256. Windows verifies the Full Setup EXE size and SHA256. Both require an
interactive administrator authorization for the final operating-system install.
Disconnect WireGuard tunnels before upgrading either platform.
