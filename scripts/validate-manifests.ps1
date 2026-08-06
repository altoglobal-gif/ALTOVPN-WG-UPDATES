[CmdletBinding()]
param(
    [string]$RepositoryRoot,
    [string]$BaseRef,
    [switch]$Online
)

$ErrorActionPreference = "Stop"
if ([string]::IsNullOrWhiteSpace($RepositoryRoot)) {
    $RepositoryRoot = Split-Path -Parent $PSScriptRoot
}
$versionPattern = '^V\.\d{4}\.\d{2}\.\d+\.\d+$'
$shaPattern = '^[A-Fa-f0-9]{64}$'
$sourceRepository = 'altoglobal-gif/ALTOVPN-WG-UPDATES'
$sourceCodeRepository = 'altoglobal-gif/ALTOVPN-WG'

function Fail([string]$Message) {
    throw "Manifest guard: $Message"
}

function Read-JsonFile([string]$Path) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        Fail "required file is missing: $Path"
    }

    try {
        return Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json
    }
    catch {
        Fail "invalid JSON in $Path ($($_.Exception.Message))"
    }
}

function Require-Property($Object, [string]$Name, [string]$Context) {
    if ($null -eq $Object -or -not ($Object.PSObject.Properties.Name -contains $Name)) {
        Fail "$Context is missing '$Name'"
    }
    return $Object.$Name
}

function Require-NonEmptyString($Object, [string]$Name, [string]$Context) {
    $value = Require-Property $Object $Name $Context
    if ($value -isnot [string] -or [string]::IsNullOrWhiteSpace($value)) {
        Fail "$Context.$Name must be a non-empty string"
    }
    return $value
}

function Require-IsoTimestamp([string]$Value, [string]$Context) {
    $parsed = [DateTimeOffset]::MinValue
    if (-not [DateTimeOffset]::TryParse(
        $Value,
        [Globalization.CultureInfo]::InvariantCulture,
        [Globalization.DateTimeStyles]::RoundtripKind,
        [ref]$parsed)) {
        Fail "$Context must be an ISO-8601 timestamp with an offset"
    }
}

function Get-ArtifactVersion([string]$FileName, [string]$Context) {
    $match = [regex]::Match($FileName, 'V\.(\d{4}\.\d{2}\.\d+\.\d+)')
    if (-not $match.Success) {
        Fail "$Context.fileName does not contain a release version"
    }
    return $match.Groups[1].Value
}

function Invoke-GitHubApi([string]$ApiPath) {
    $headers = @{
        Accept = 'application/vnd.github+json'
        'X-GitHub-Api-Version' = '2022-11-28'
        'User-Agent' = 'ALTOVPN-WG-manifest-guard'
    }
    if (-not [string]::IsNullOrWhiteSpace($env:GITHUB_TOKEN)) {
        $headers.Authorization = "Bearer $env:GITHUB_TOKEN"
    }
    return Invoke-RestMethod -Uri "https://api.github.com/$ApiPath" -Headers $headers
}

function Test-RemoteArtifact(
    $Artifact,
    [string]$Tag,
    [string]$Context,
    [bool]$ProductionChannel
) {
    $release = Invoke-GitHubApi "repos/$sourceRepository/releases/tags/$Tag"
    if ($release.draft) {
        Fail "$Context selects draft release $Tag"
    }
    if ($ProductionChannel -and $release.prerelease) {
        Fail "$Context selects prerelease $Tag for a production channel"
    }

    $fileName = [string]$Artifact.fileName
    $asset = @($release.assets | Where-Object { $_.name -eq $fileName })
    if ($asset.Count -ne 1) {
        Fail "$Context expected exactly one uploaded asset named $fileName on $Tag"
    }
    $asset = $asset[0]
    if ($asset.state -ne 'uploaded') {
        Fail "$Context asset $fileName is not in uploaded state"
    }
    if ([int64]$asset.size -ne [int64]$Artifact.sizeBytes) {
        Fail "$Context size does not match GitHub asset metadata"
    }
    $expectedDigest = "sha256:$(([string]$Artifact.sha256).ToLowerInvariant())"
    if ([string]::IsNullOrWhiteSpace([string]$asset.digest) -or $asset.digest -ne $expectedDigest) {
        Fail "$Context SHA256 does not match GitHub asset metadata"
    }
}

function Test-Artifact(
    $Artifact,
    [string]$Context,
    [string]$ExpectedVersion,
    [string]$ExpectedTag,
    [bool]$ProductionChannel,
    [switch]$AllowIndependentVersion
) {
    foreach ($field in @('type', 'component', 'platform', 'fileName', 'downloadUrl', 'sha256')) {
        [void](Require-NonEmptyString $Artifact $field $Context)
    }
    [void](Require-Property $Artifact 'sizeBytes' $Context)

    if ($Artifact.sha256 -notmatch $shaPattern) {
        Fail "$Context.sha256 must contain exactly 64 hexadecimal characters"
    }
    if ([int64]$Artifact.sizeBytes -le 0) {
        Fail "$Context.sizeBytes must be greater than zero"
    }
    if ($Artifact.downloadUrl -notmatch '^https://github\.com/') {
        Fail "$Context.downloadUrl must use HTTPS on github.com"
    }

    $artifactVersion = Get-ArtifactVersion $Artifact.fileName $Context
    $artifactTag = "v$artifactVersion"
    if (-not $AllowIndependentVersion -and $artifactVersion -ne $ExpectedVersion.TrimStart('V.')) {
        Fail "$Context.fileName version does not match manifest version $ExpectedVersion"
    }
    if (-not $AllowIndependentVersion -and $ExpectedTag -ne $artifactTag) {
        Fail "$Context source tag $ExpectedTag does not match artifact version"
    }

    $escapedName = [uri]::EscapeDataString([string]$Artifact.fileName)
    $expectedUrl = "https://github.com/$sourceRepository/releases/download/$artifactTag/$escapedName"
    if ($Artifact.downloadUrl -ne $expectedUrl) {
        Fail "$Context.downloadUrl must match its tag and fileName exactly"
    }

    if ($Online) {
        Test-RemoteArtifact $Artifact $artifactTag $Context $ProductionChannel
    }
}

$policy = Read-JsonFile (Join-Path $RepositoryRoot 'manifest-guard-policy.json')
if ([int]$policy.schemaVersion -ne 1) {
    Fail 'manifest-guard-policy.json schemaVersion must be 1'
}
$withdrawnPolicy = Read-JsonFile (Join-Path $RepositoryRoot 'withdrawn-versions.json')
if ([int]$withdrawnPolicy.schemaVersion -ne 1) {
    Fail 'withdrawn-versions.json schemaVersion must be 1'
}

$withdrawn = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)
foreach ($entry in @($withdrawnPolicy.withdrawnVersions)) {
    $version = Require-NonEmptyString $entry 'version' 'withdrawnVersions entry'
    if ($version -notmatch $versionPattern) {
        Fail "withdrawn version has invalid format: $version"
    }
    [void](Require-NonEmptyString $entry 'reason' "withdrawn version $version")
    Require-IsoTimestamp (Require-NonEmptyString $entry 'withdrawnAt' "withdrawn version $version") "withdrawn version $version.withdrawnAt"
    [void](Require-NonEmptyString $entry 'releaseUrl' "withdrawn version $version")
    [void]$withdrawn.Add($version)
}

$manifestChannels = [ordered]@{
    'latest.json' = 'safe-main'
    'stable.json' = 'stable'
    'beta.json' = 'beta'
    'dev.json' = 'dev'
}
$manifests = @{}

foreach ($manifestName in $manifestChannels.Keys) {
    $context = $manifestName
    $manifest = Read-JsonFile (Join-Path $RepositoryRoot $manifestName)
    $manifests[$manifestName] = $manifest

    foreach ($field in @('latestVersion', 'fileVersion', 'minimumSupportedVersion', 'publishedAt', 'releaseNotesUrl', 'manifestUrl')) {
        [void](Require-NonEmptyString $manifest $field $context)
    }
    [void](Require-Property $manifest 'artifact' $context)
    [void](Require-Property $manifest 'updatePolicy' $context)
    [void](Require-Property $manifest 'source' $context)

    if ([int]$manifest.schemaVersion -ne 1) { Fail "$context.schemaVersion must be 1" }
    if ($manifest.appId -ne 'ALTOVPN-WG') { Fail "$context.appId must be ALTOVPN-WG" }
    if ($manifest.channel -ne $manifestChannels[$manifestName]) { Fail "$context.channel must be $($manifestChannels[$manifestName])" }
    if ($manifest.latestVersion -notmatch $versionPattern) { Fail "$context.latestVersion has invalid format" }
    if ($manifest.minimumSupportedVersion -notmatch $versionPattern) { Fail "$context.minimumSupportedVersion has invalid format" }
    if ($manifest.fileVersion -ne $manifest.latestVersion.Substring(2)) { Fail "$context.fileVersion must match latestVersion" }
    if ($withdrawn.Contains([string]$manifest.latestVersion)) { Fail "$context selects withdrawn version $($manifest.latestVersion)" }
    Require-IsoTimestamp $manifest.publishedAt "$context.publishedAt"
    if ($manifest.releaseNotesUrl -notmatch '^https://github\.com/') { Fail "$context.releaseNotesUrl must use HTTPS on github.com" }
    if ($manifest.manifestUrl -notmatch '^https://api\.github\.com/') { Fail "$context.manifestUrl must use HTTPS on api.github.com" }
    if (@($manifest.changeSummary).Count -lt 1) { Fail "$context.changeSummary must contain at least one item" }

    if ($manifest.source.repository -ne $sourceRepository) { Fail "$context.source.repository must be $sourceRepository" }
    $expectedTag = "v$($manifest.fileVersion)"
    if ($manifest.source.tag -ne $expectedTag) { Fail "$context.source.tag must be $expectedTag" }

    foreach ($field in @('requiresAdmin', 'installMode', 'touchesHelper', 'helperVersion', 'restartRequired')) {
        [void](Require-Property $manifest.updatePolicy $field "$context.updatePolicy")
    }
    if ($manifest.updatePolicy.helperVersion -notmatch $versionPattern) { Fail "$context.updatePolicy.helperVersion has invalid format" }
    if ($manifest.updatePolicy.touchesHelper -isnot [bool]) { Fail "$context.updatePolicy.touchesHelper must be boolean" }

    $isProduction = $manifest.channel -in @('safe-main', 'stable')
    Test-Artifact $manifest.artifact "$context.artifact" $manifest.latestVersion $manifest.source.tag $isProduction
    if ($manifest.PSObject.Properties.Name -contains 'fallbackArtifact') {
        Test-Artifact $manifest.fallbackArtifact "$context.fallbackArtifact" $manifest.latestVersion $manifest.source.tag $isProduction -AllowIndependentVersion
    }
}

$safeMain = $manifests[[string]$policy.safeMain.manifest]
if ($null -eq $safeMain) { Fail 'safe-main policy references an unknown manifest' }
if ($safeMain.channel -ne $policy.safeMain.channel) { Fail 'safe-main channel invariant changed' }
if ($safeMain.latestVersion -ne $policy.safeMain.pinnedVersion) { Fail "safe-main must remain pinned to $($policy.safeMain.pinnedVersion)" }
if ($safeMain.nextManifestUrl -ne $policy.safeMain.nextManifestUrl) { Fail 'safe-main nextManifestUrl invariant changed' }
if ($safeMain.updatePolicy.touchesHelper) { Fail 'safe-main must never touch the Helper' }

$stable = $manifests['stable.json']
$helperChanged = [bool]$stable.updatePolicy.touchesHelper -or ([string]$stable.artifact.component -match 'helper')
if (-not [string]::IsNullOrWhiteSpace($BaseRef)) {
    $baseJson = & git -C $RepositoryRoot show "${BaseRef}:stable.json" 2>$null
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace(($baseJson | Out-String))) {
        Fail "cannot read stable.json from base ref $BaseRef"
    }
    $baseStable = ($baseJson | Out-String) | ConvertFrom-Json
    if ($baseStable.updatePolicy.helperVersion -ne $stable.updatePolicy.helperVersion) {
        $helperChanged = $true
    }
}

if ($helperChanged) {
    $attestationDir = [string]$policy.productionSmoke.attestationDirectory
    $attestationPath = Join-Path $RepositoryRoot "$attestationDir/$($stable.fileVersion).production-smoke.json"
    $attestation = Read-JsonFile $attestationPath
    $attestationContext = "production smoke attestation for $($stable.latestVersion)"

    if ([int]$attestation.schemaVersion -ne 1) { Fail "$attestationContext schemaVersion must be 1" }
    if ($attestation.releaseVersion -ne $stable.latestVersion) { Fail "$attestationContext releaseVersion does not match stable" }
    if ($attestation.artifactSha256 -ne $stable.artifact.sha256) { Fail "$attestationContext artifactSha256 does not match stable" }
    if ($attestation.sourceRepository -ne $sourceCodeRepository) { Fail "$attestationContext sourceRepository must be $sourceCodeRepository" }
    if ($attestation.sourceCommit -notmatch '^[a-f0-9]{40}$') { Fail "$attestationContext sourceCommit must be a full lowercase Git commit SHA" }
    Require-IsoTimestamp (Require-NonEmptyString $attestation 'testedAt' $attestationContext) "$attestationContext.testedAt"

    foreach ($check in @($policy.productionSmoke.requiredChecks)) {
        if (-not ($attestation.results.PSObject.Properties.Name -contains $check) -or $attestation.results.$check -ne $true) {
            Fail "$attestationContext requires results.$check=true"
        }
    }
    if ($attestation.approval.approved -ne $true) { Fail "$attestationContext requires approval.approved=true" }
    [void](Require-NonEmptyString $attestation.approval 'approvedBy' "$attestationContext.approval")
    Require-IsoTimestamp (Require-NonEmptyString $attestation.approval 'approvedAt' "$attestationContext.approval") "$attestationContext.approval.approvedAt"
    [void](Require-NonEmptyString $attestation.approval 'reference' "$attestationContext.approval")

    if ($Online) {
        [void](Invoke-GitHubApi "repos/$sourceCodeRepository/commits/$($attestation.sourceCommit)")
    }
}

Write-Host "Manifest guard passed for $($manifestChannels.Count) channels."
