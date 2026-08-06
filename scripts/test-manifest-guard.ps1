[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repositoryRoot = Split-Path -Parent $PSScriptRoot
$validator = Join-Path $PSScriptRoot 'validate-manifests.ps1'

function New-TestRepository {
    $path = Join-Path ([IO.Path]::GetTempPath()) ("altovpn-manifest-guard-test-" + [guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $path | Out-Null
    foreach ($file in @('latest.json', 'stable.json', 'beta.json', 'dev.json', 'withdrawn-versions.json', 'manifest-guard-policy.json')) {
        Copy-Item -LiteralPath (Join-Path $repositoryRoot $file) -Destination $path
    }
    return $path
}

function Assert-Rejected([string]$Name, [scriptblock]$Mutation, [string]$ExpectedMessage) {
    $testRoot = New-TestRepository
    try {
        & $Mutation $testRoot
        try {
            & $validator -RepositoryRoot $testRoot
            throw "Test '$Name' expected validation to fail"
        }
        catch {
            if ($_.Exception.Message -notlike "*$ExpectedMessage*") {
                throw "Test '$Name' failed for the wrong reason: $($_.Exception.Message)"
            }
        }
        Write-Host "PASS: $Name"
    }
    finally {
        Remove-Item -LiteralPath $testRoot -Recurse -Force
    }
}

& $validator -RepositoryRoot $repositoryRoot
Write-Host 'PASS: current manifests'

Assert-Rejected 'withdrawn version on stable' {
    param($root)
    $path = Join-Path $root 'stable.json'
    $manifest = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    $manifest.latestVersion = 'V.2026.32.0.1'
    $manifest.fileVersion = '2026.32.0.1'
    $manifest.source.tag = 'v2026.32.0.1'
    $manifest.artifact.fileName = 'ALTOVPN-WG-V.2026.32.0.1-win-x64-app-update.exe'
    $manifest.artifact.downloadUrl = 'https://github.com/altoglobal-gif/ALTOVPN-WG-UPDATES/releases/download/v2026.32.0.1/ALTOVPN-WG-V.2026.32.0.1-win-x64-app-update.exe'
    $manifest | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $path -Encoding UTF8
} 'selects withdrawn version V.2026.32.0.1'

Assert-Rejected 'helper change without smoke attestation' {
    param($root)
    $path = Join-Path $root 'stable.json'
    $manifest = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    $manifest.updatePolicy.touchesHelper = $true
    $manifest | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $path -Encoding UTF8
} 'required file is missing'

$baseTestRoot = New-TestRepository
try {
    & git -C $baseTestRoot init --quiet
    & git -C $baseTestRoot config user.name 'Manifest Guard Test'
    & git -C $baseTestRoot config user.email 'manifest-guard-test@example.invalid'
    & git -C $baseTestRoot add .
    & git -C $baseTestRoot commit --quiet -m baseline
    $stablePath = Join-Path $baseTestRoot 'stable.json'
    $stable = Get-Content -LiteralPath $stablePath -Raw | ConvertFrom-Json
    $stable.updatePolicy.helperVersion = 'V.2026.31.0.5'
    $stable | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $stablePath -Encoding UTF8
    try {
        & $validator -RepositoryRoot $baseTestRoot -BaseRef HEAD
        throw "Test 'helper version change against base' expected validation to fail"
    }
    catch {
        if ($_.Exception.Message -notlike '*required file is missing*') {
            throw "Test 'helper version change against base' failed for the wrong reason: $($_.Exception.Message)"
        }
    }
    Write-Host 'PASS: helper version change against base requires smoke attestation'
}
finally {
    Remove-Item -LiteralPath $baseTestRoot -Recurse -Force
}

Assert-Rejected 'safe-main pin drift' {
    param($root)
    $path = Join-Path $root 'latest.json'
    $manifest = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    $manifest.latestVersion = 'V.2026.29.1.8'
    $manifest.fileVersion = '2026.29.1.8'
    $manifest.source.tag = 'v2026.29.1.8'
    $manifest.artifact.fileName = 'ALTOVPN-WG-V.2026.29.1.8-win-x64-app-update.exe'
    $manifest.artifact.downloadUrl = 'https://github.com/altoglobal-gif/ALTOVPN-WG-UPDATES/releases/download/v2026.29.1.8/ALTOVPN-WG-V.2026.29.1.8-win-x64-app-update.exe'
    $manifest | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $path -Encoding UTF8
} 'safe-main must remain pinned'

Write-Host 'All manifest guard tests passed.'
