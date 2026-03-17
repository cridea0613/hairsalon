# Deployment Checklist

## 1. Update site settings

- Edit `site.config.json`
- Set the final:
  - `domain`
  - `supportEmail`
  - `supportPhone`
  - `supportPhoneHref`
  - `supportHours`
  - `supportCoverage`

## 2. Apply the config

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\apply-site-config.ps1
```

Or run the combined command:

```powershell
powershell -ExecutionPolicy Bypass -File .\prepare-deploy.ps1
```

## 3. Validate the site

Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\validate-site.ps1
```

## 4. Manual browser QA

- Check desktop and mobile navigation
- Check the contact form mailto flow
- Check footer links
- Check favicon and social preview assets
- Check `404.html`

## 5. Deploy

- Upload root files and folders:
  - `index.html`
  - `404.html`
  - `robots.txt`
  - `sitemap.xml`
  - `site.webmanifest`
  - `assets/`
  - `pages/`

## 6. Post-deploy verification

- Open the live homepage
- Open each page in `pages/`
- Confirm `robots.txt` and `sitemap.xml`
- Confirm canonical URLs point to the final domain
