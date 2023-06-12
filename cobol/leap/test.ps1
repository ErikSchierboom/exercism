$slug=Split-Path $PSScriptRoot -Leaf

if (![System.IO.File]::Exists("$PSScriptRoot\bin\cobolcheck.exe")){
  Write-Output "Cobolcheck not found. Trying to fetch it."
  & "$PSScriptRoot\bin\fetch-cobolcheck.ps1"
}

Write-Output "Run cobolcheck."
Set-Location $PSScriptRoot

Invoke-Expression "bin\cobolcheck.exe -p $slug"
Invoke-Expression "cobc -xj test.cob"

if ($Lastexitcode -ne 0) {
  exit $Lastexitcode
}
