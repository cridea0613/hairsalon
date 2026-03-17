$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$configPath = Join-Path $root 'site.config.json'
$appliedConfigPath = Join-Path $root '.site-config.applied.json'

if (-not (Test-Path $configPath)) {
  throw "Missing config file: $configPath"
}

$config = Get-Content $configPath -Raw | ConvertFrom-Json

$requiredKeys = @(
  'brandName',
  'domain',
  'supportEmail',
  'supportPhone',
  'supportPhoneHref',
  'supportHours',
  'supportCoverage'
)

foreach ($key in $requiredKeys) {
  if (-not $config.$key) {
    throw "Missing required config value: $key"
  }
}

$defaultConfig = [pscustomobject]@{
  brandName = 'Salon Public'
  domain = 'https://hairsalon-market.example.com'
  supportEmail = 'hello@hairsalon-market.example.com'
  supportPhone = '+1 (202) 555-0148'
  supportPhoneHref = '+12025550148'
  supportHours = 'Monday to Friday, 9:00 AM to 6:00 PM'
  supportCoverage = 'Marketplace and public website builds across the U.S.'
}

$previousConfig = $defaultConfig

if (Test-Path $appliedConfigPath) {
  $previousConfig = Get-Content $appliedConfigPath -Raw | ConvertFrom-Json
}

$siteDataPath = Join-Path $root 'assets\js\site-data.js'
$siteDataContent = @"
window.SALON_PUBLIC_SITE = {
  brandName: '$($config.brandName)',
  supportEmail: '$($config.supportEmail)',
  supportPhone: '$($config.supportPhone)',
  supportPhoneHref: '$($config.supportPhoneHref)',
  supportHours: '$($config.supportHours)',
  supportCoverage: '$($config.supportCoverage)'
};
"@
[System.IO.File]::WriteAllText($siteDataPath, $siteDataContent, [System.Text.UTF8Encoding]::new($false))

$domain = $config.domain.TrimEnd('/')
$files = @(
  'index.html',
  '404.html',
  'pages\service.html',
  'pages\about.html',
  'pages\contact.html',
  'pages\privacy.html',
  'pages\terms.html',
  'robots.txt',
  'sitemap.xml',
  'public\index.html',
  'public\404.html',
  'public\robots.txt',
  'public\sitemap.xml',
  'site.webmanifest',
  'public\site.webmanifest'
)

foreach ($relativePath in $files) {
  $path = Join-Path $root $relativePath

  if (-not (Test-Path $path)) {
    continue
  }

  $content = Get-Content $path -Raw

  $replacements = @(
    @{ Old = $previousConfig.domain; New = $domain },
    @{ Old = 'https://hairsalon-market.example.com'; New = $domain },
    @{ Old = $previousConfig.supportEmail; New = $config.supportEmail },
    @{ Old = 'hello@hairsalon-market.example.com'; New = $config.supportEmail },
    @{ Old = $previousConfig.supportPhone; New = $config.supportPhone },
    @{ Old = '+1 (202) 555-0148'; New = $config.supportPhone },
    @{ Old = $previousConfig.supportPhoneHref; New = $config.supportPhoneHref },
    @{ Old = '+12025550148'; New = $config.supportPhoneHref },
    @{ Old = $previousConfig.supportHours; New = $config.supportHours },
    @{ Old = 'Monday to Friday, 9:00 AM to 6:00 PM'; New = $config.supportHours },
    @{ Old = $previousConfig.supportCoverage; New = $config.supportCoverage },
    @{ Old = 'Marketplace and public website builds across the U.S.'; New = $config.supportCoverage }
  )

  foreach ($replacement in $replacements) {
    if ($replacement.Old) {
      $content = $content.Replace([string]$replacement.Old, [string]$replacement.New)
    }
  }

  [System.IO.File]::WriteAllText($path, $content, [System.Text.UTF8Encoding]::new($false))
}

$appliedJson = $config | ConvertTo-Json -Depth 4
[System.IO.File]::WriteAllText($appliedConfigPath, $appliedJson, [System.Text.UTF8Encoding]::new($false))

Write-Host "Applied site.config.json to HTML, metadata, sitemap, robots, manifest, and site-data.js"
