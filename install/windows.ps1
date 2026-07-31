# Usage: irm https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/main/install/windows.ps1 | iex
[CmdletBinding()]
param(
    [ValidateSet("stable", "beta", "dev")]
    [string]$Channel = "stable"
)

$ErrorActionPreference = "Stop"
$manifestUrl = if ($Channel -eq "dev") {
    "https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/dev/dev.json"
}
elseif ($Channel -eq "beta") {
    "https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/beta/beta.json"
}
else {
    "https://raw.githubusercontent.com/altoglobal-gif/ALTOVPN-WG-UPDATES/main/stable.json"
}

function Assert-TrustedReleaseUrl([string]$Value) {
    $uri = [Uri]$Value
    if ($uri.Scheme -ne "https" -or $uri.UserInfo -or $uri.Host -notin @(
        "github.com", "objects.githubusercontent.com", "release-assets.githubusercontent.com")) {
        throw "Installer URL is not a trusted GitHub release host."
    }
    return $uri
}

$manifest = Invoke-RestMethod -Uri $manifestUrl -Headers @{ "User-Agent" = "ALTOVPN-WG bootstrap" }
$artifact = $manifest.fallbackArtifact
if (-not $artifact) { throw "This channel does not publish a Windows Full Setup artifact." }
if ([string]$artifact.platform -ne "win-x64" -or [string]$artifact.type -notin @("installer-exe", "desktop-installer")) {
    throw "The bootstrap refused a non-Windows installer artifact."
}
if (-not ([string]$artifact.fileName).EndsWith("-setup.exe", [StringComparison]::OrdinalIgnoreCase)) {
    throw "The bootstrap requires a Full Setup EXE for first installation."
}
if ([string]$artifact.sha256 -notmatch "^[A-Fa-f0-9]{64}$" -or [long]$artifact.sizeBytes -le 0) {
    throw "Installer hash or size is invalid."
}
$url = Assert-TrustedReleaseUrl ([string]$artifact.downloadUrl)
$target = Join-Path $env:TEMP ([string]$artifact.fileName)

try {
    Invoke-WebRequest -Uri $url -OutFile $target -Headers @{ "User-Agent" = "ALTOVPN-WG bootstrap" }
    if ((Get-Item -LiteralPath $target).Length -ne [long]$artifact.sizeBytes) {
        throw "Installer size verification failed."
    }
    $actualHash = (Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash
    if ($actualHash -ne ([string]$artifact.sha256).ToUpperInvariant()) {
        throw "Installer SHA256 verification failed."
    }
    Start-Process -FilePath $target -Wait
}
finally {
    Remove-Item -LiteralPath $target -Force -ErrorAction SilentlyContinue
}
