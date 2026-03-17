$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host 'Applying site configuration...' -ForegroundColor Cyan
powershell -ExecutionPolicy Bypass -File (Join-Path $root 'apply-site-config.ps1')

Write-Host 'Running validation...' -ForegroundColor Cyan
powershell -ExecutionPolicy Bypass -File (Join-Path $root 'validate-site.ps1')

Write-Host 'Deployment preparation completed.' -ForegroundColor Green
