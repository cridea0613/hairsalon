# Salon Public

Static public website for a salon marketplace concept. The project is built with plain HTML, CSS, and vanilla JavaScript for fast loading, simple hosting, and strong SEO basics.

## Stack

- HTML5
- CSS3
- Vanilla JavaScript
- Optional PowerShell scripts for config replacement and validation

## Project Structure

```text
/
  index.html
  404.html
  robots.txt
  sitemap.xml
  site.webmanifest
  assets/
    css/
    js/
    icons/
    images/
  pages/
    service.html
    about.html
    contact.html
    privacy.html
    terms.html
  public/
  docs/
```

## Key Files

- `site.config.json`: active site settings used for domain and contact replacement
- `site.config.example.json`: example config template
- `apply-site-config.ps1`: applies config values to HTML, sitemap, robots, manifest, and site data
- `validate-site.ps1`: checks required files, broken links, metadata presence, and image rules
- `prepare-deploy.ps1`: runs config apply + validation in one step

## Local Preview

You can preview the site with a simple local static server:

```powershell
python -m http.server 8123
```

Then open:

```text
http://127.0.0.1:8123/
```

## Configuration

Update `site.config.json` before deployment:

```json
{
  "brandName": "Salon Public",
  "domain": "https://your-domain.com",
  "supportEmail": "hello@your-domain.com",
  "supportPhone": "010-0000-0000",
  "supportPhoneHref": "+821000000000",
  "supportHours": "Monday to Friday, 10:00 AM to 6:00 PM KST",
  "supportCoverage": "Salon marketplace and public website builds in Korea and remote projects."
}
```

## Deployment Workflow

1. Update `site.config.json`
2. Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\prepare-deploy.ps1
```

3. Confirm validation passes
4. Deploy these paths:

- `index.html`
- `404.html`
- `robots.txt`
- `sitemap.xml`
- `site.webmanifest`
- `assets/`
- `pages/`

See also: `DEPLOYMENT_CHECKLIST.md`

## Current Behavior

- Public pages are static and hosting-friendly
- Contact form currently uses a `mailto:` fallback
- Content images are localized in `assets/images/` as WebP
- SEO metadata, Open Graph tags, JSON-LD, sitemap, and robots are included

## Hosting Notes

- PHP is not required for the current project
- This repository is ready for static hosting such as Cloudflare Pages
- Optional PHP includes can be added later, but no PHP runtime is needed now

## QA

The repository includes:

- local validation with `validate-site.ps1`
- local deployment prep with `prepare-deploy.ps1`
- optional QA artifacts such as local Lighthouse reports and screenshots, which are excluded from Git

## Next Recommended Step

Replace the `mailto:` contact flow with a real form backend or service if you need reliable inquiry delivery and tracking.
