[CmdletBinding()]
param(
    [Parameter()]
    [string]$ProjectRoot
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($ProjectRoot)) {
    $ProjectRoot = Split-Path -Parent $PSScriptRoot
}

$requiredFiles = @(
    'README.md',
    'data\scripts\flood_survival.hsc',
    'design\balance.csv',
    'design\sapien-checklist.md'
)

$missing = foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path $ProjectRoot $relativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        $relativePath
    }
}

if ($missing) {
    throw "Missing required project files: $($missing -join ', ')"
}

$scriptPath = Join-Path $ProjectRoot 'data\scripts\flood_survival.hsc'
$scriptText = Get-Content -LiteralPath $scriptPath -Raw

foreach ($waveNumber in 1..5) {
    $reference = 'fs_wave_{0:d2}' -f $waveNumber
    if ($scriptText -notmatch [regex]::Escape($reference)) {
        throw "HaloScript is missing the required reference: $reference"
    }
}

$openCount = ([regex]::Matches($scriptText, '\(')).Count
$closeCount = ([regex]::Matches($scriptText, '\)')).Count
if ($openCount -ne $closeCount) {
    throw "Unbalanced parentheses in HaloScript: $openCount open, $closeCount closed"
}

$balancePath = Join-Path $ProjectRoot 'design\balance.csv'
$waves = Import-Csv -LiteralPath $balancePath
if ($waves.Count -ne 5) {
    throw "Expected 5 balance rows; found $($waves.Count)"
}

Write-Host 'Flood Survival source validation passed.' -ForegroundColor Green
Write-Host "Project: $ProjectRoot"
Write-Host 'Waves: 5'
Write-Host "HaloScript parentheses: $openCount pairs"
