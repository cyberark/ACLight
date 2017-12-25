# Usage: "Import-Module .\ACLight.psm1"

Get-ChildItem (Join-Path $PSScriptRoot *.ps1) | % { . $_.FullName}
