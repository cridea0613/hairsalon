$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

$requiredFiles = @(
  'index.html',
  '404.html',
  'robots.txt',
  'sitemap.xml',
  'site.webmanifest',
  'assets\css\styles.css',
  'assets\js\main.js',
  'assets\js\site-data.js',
  'assets\icons\favicon.svg',
  'assets\images\og-cover.svg',
  'pages\service.html',
  'pages\about.html',
  'pages\contact.html',
  'pages\privacy.html',
  'pages\terms.html'
)

$htmlFiles = @(
  'index.html',
  '404.html',
  'pages\service.html',
  'pages\about.html',
  'pages\contact.html',
  'pages\privacy.html',
  'pages\terms.html'
)

$errors = New-Object System.Collections.Generic.List[string]
$warnings = New-Object System.Collections.Generic.List[string]

foreach ($relativePath in $requiredFiles) {
  $path = Join-Path $root $relativePath
  if (-not (Test-Path $path)) {
    $errors.Add("Missing required file: $relativePath")
  }
}

$configPath = Join-Path $root 'site.config.json'
$config = Get-Content $configPath -Raw | ConvertFrom-Json
$domain = $config.domain.TrimEnd('/')

foreach ($relativePath in $htmlFiles) {
  $path = Join-Path $root $relativePath
  if (-not (Test-Path $path)) {
    continue
  }

  $content = Get-Content $path -Raw

  if ($content -notmatch '<h1') {
    $errors.Add("Missing H1: $relativePath")
  }

  if ($relativePath -ne '404.html' -and $content -notmatch [regex]::Escape($domain)) {
    $warnings.Add("Configured domain not found in metadata: $relativePath")
  }

  foreach ($match in [regex]::Matches($content, 'href="([^"]+)"')) {
    $href = $match.Groups[1].Value

    if ($href.StartsWith('http') -or $href.StartsWith('mailto:') -or $href.StartsWith('tel:') -or $href.StartsWith('#')) {
      continue
    }

    $resolved = Join-Path (Split-Path $path -Parent) $href
    $normalized = [System.IO.Path]::GetFullPath($resolved)

    if (-not (Test-Path $normalized)) {
      $errors.Add("Broken link in $relativePath -> $href")
    }
  }

  foreach ($match in [regex]::Matches($content, '<img\b[^>]*src="([^"]+)"[^>]*>')) {
    $tag = $match.Value
    $src = $match.Groups[1].Value

    if ($src.StartsWith('http://') -or $src.StartsWith('https://')) {
      $errors.Add("External image hotlink in $relativePath -> $src")
      continue
    }

    $resolved = Join-Path (Split-Path $path -Parent) $src
    $normalized = [System.IO.Path]::GetFullPath($resolved)

    if (-not (Test-Path $normalized)) {
      $errors.Add("Missing image file in $relativePath -> $src")
    }

    if ($tag -notmatch '\balt="[^"]+"') {
      $errors.Add("Image missing alt text in $relativePath -> $src")
    }

    if ($tag -notmatch '\bwidth="[^"]+"' -or $tag -notmatch '\bheight="[^"]+"') {
      $warnings.Add("Image missing width/height in $relativePath -> $src")
    }

    if ($src -like '*.jpg' -or $src -like '*.jpeg' -or $src -like '*.png') {
      $warnings.Add("Consider WebP image format in $relativePath -> $src")
    }
  }
}

$sitemapPath = Join-Path $root 'sitemap.xml'
if (Test-Path $sitemapPath) {
  $sitemap = Get-Content $sitemapPath -Raw
  foreach ($expected in @(
    "$domain/",
    "$domain/pages/service.html",
    "$domain/pages/about.html",
    "$domain/pages/contact.html",
    "$domain/pages/privacy.html",
    "$domain/pages/terms.html"
  )) {
    if ($sitemap -notmatch [regex]::Escape($expected)) {
      $errors.Add("Missing sitemap URL: $expected")
    }
  }
}

if ($errors.Count -gt 0) {
  Write-Host 'Validation failed:' -ForegroundColor Red
  $errors | ForEach-Object { Write-Host " - $_" -ForegroundColor Red }

  if ($warnings.Count -gt 0) {
    Write-Host 'Warnings:' -ForegroundColor Yellow
    $warnings | ForEach-Object { Write-Host " - $_" -ForegroundColor Yellow }
  }

  exit 1
}

Write-Host 'Validation passed.' -ForegroundColor Green

if ($warnings.Count -gt 0) {
  Write-Host 'Warnings:' -ForegroundColor Yellow
  $warnings | ForEach-Object { Write-Host " - $_" -ForegroundColor Yellow }
}
