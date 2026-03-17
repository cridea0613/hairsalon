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

## Resume Notes

Use this section to continue development in the next session without re-discovering the current state.

### Current Status

- Public site pages are implemented:
  - home
  - services
  - about
  - contact
  - privacy
  - terms
- Root deployment files are in place:
  - `index.html`
  - `404.html`
  - `robots.txt`
  - `sitemap.xml`
  - `site.webmanifest`
- Content images were localized into `assets/images/*.webp`
- External image hotlinks were removed from public pages
- Image performance attributes were added:
  - LCP image uses `fetchpriority="high"`
  - non-critical images use `loading="lazy"` and `decoding="async"`
- Validation script now checks:
  - required files
  - broken links
  - configured domain references
  - missing image files
  - external image hotlinks
  - missing `alt` text
- Local QA completed:
  - static server response check
  - desktop/mobile screenshot check
  - Lighthouse check on home and contact pages

### Latest QA Result

- Home page Lighthouse:
  - Performance `99`
  - Accessibility `100`
  - Best Practices `100`
  - SEO `100`
- Contact page Lighthouse:
  - Performance `100`
  - Accessibility `100`
  - Best Practices `100`
  - SEO `100`

### Important Current Constraints

- Real production domain is not available yet
- `site.config.json` still uses the placeholder domain
- Contact form still uses `mailto:` fallback
- PHP is not required for the current implementation

### First Tasks To Resume With

1. Replace the placeholder `domain` in `site.config.json` when the real domain is ready
2. Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\prepare-deploy.ps1
```

3. Replace the contact form `mailto:` flow with a real form backend or service
4. If deploying on Cloudflare, prefer `Pages` first unless backend logic grows significantly

### Useful Files For The Next Session

- `README.md`
- `docs/WORKLOG.md`
- `site.config.json`
- `apply-site-config.ps1`
- `validate-site.ps1`
- `prepare-deploy.ps1`
- `DEPLOYMENT_CHECKLIST.md`
