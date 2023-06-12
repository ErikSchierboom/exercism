# This file is inspired by https://github.com/exercism/configlet/blob/main/scripts/fetch-configlet.ps1.
# It is only used in the cobol track, and a copy of it is placed in every exercise folder.
# If you change something, make sure to upgrade all scripts in all exercises!

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$requestOpts = @{
    Headers           = If ($env:GITHUB_TOKEN) { @{ Authorization = "Bearer ${env:GITHUB_TOKEN}" } } Else { @{ } }
    MaximumRetryCount = 3
    RetryIntervalSec  = 1
}

$arch = If ([Environment]::Is64BitOperatingSystem) { "amd64" } Else { "x86" }
$fileName = "cobol-check-windows-$arch.exe"

Function Get-DownloadUrl {
    $latestUrl = "https://api.github.com/repos/0xE282B0/cobol-check/releases/latest"
    Invoke-RestMethod -Uri $latestUrl -PreserveAuthorizationOnRedirect @requestOpts
    | Select-Object -ExpandProperty assets
    | Where-Object { $_.browser_download_url -match $FileName }
    | Select-Object -ExpandProperty browser_download_url
}

$downloadUrl = Get-DownloadUrl
$outputFile = Join-Path -Path $PSScriptRoot -ChildPath "cobolcheck.exe"
Invoke-WebRequest -Uri $downloadUrl -OutFile $outputFile @requestOpts