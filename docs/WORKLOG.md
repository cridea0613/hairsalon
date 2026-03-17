# WORKLOG

## 2026-03-17

### Completed

- Promoted the real homepage to the repository root and converted `public/index.html` into a redirect entry.
- Standardized internal navigation so all subpages link back to the root homepage.
- Fixed footer copyright rendering and added root-level `robots.txt` and `sitemap.xml`.
- Added mobile navigation close behavior and static contact-form feedback in `assets/js/main.js`.
- Expanded the public site to include:
  - home
  - services
  - about
  - contact
  - privacy
  - terms
- Filled missing template sections on service, about, and contact pages.
- Added page-level JSON-LD metadata to key subpages.
- Added a root `404.html` page for static hosting fallback.
- Added favicon, Open Graph image assets, and `site.webmanifest`.
- Switched the contact form from static-only feedback to a mailto-based submission fallback for static hosting.
- Fixed the 404 page mobile navigation and aligned its social metadata with the rest of the site.
- Centralized visible contact settings in `assets/js/site-data.js` so email, phone, hours, and coverage can be updated in one place.
- Added `public/404.html` and `public/site.webmanifest` so the legacy `public/` entry path has the same minimum fallback set as the root site.
- Added `site.config.json` and `apply-site-config.ps1` to automate domain and contact-value replacement before deployment.
- Added `site.config.example.json` and stateful replacement logic so future config changes can be re-applied without manual cleanup.
- Added `validate-site.ps1` and `DEPLOYMENT_CHECKLIST.md` to reduce manual pre-deploy QA work.
- Added `prepare-deploy.ps1` to apply config and run validation in one step.
- Localized content images into `assets/images/*.webp` and replaced external hotlinks on the home, service, about, and contact pages.
- Added image performance attributes to content photos and extended `validate-site.ps1` to catch external image hotlinks, missing image files, and missing alt text.
- Verified the root and subpages on a local static server and captured desktop/mobile QA screenshots for the home, service, and contact pages.

### Current notes

- Canonical and Open Graph URLs are configured to the virtual placeholder domain `https://salon-public.example`.
- Contact form currently uses a mailto fallback to `smh085@naver.com`. A real backend or form service is still recommended for production tracking.
- `public/robots.txt` and `public/sitemap.xml` remain alongside the new root files for compatibility with the existing folder layout.

### Reasonable next steps

- Run `powershell -ExecutionPolicy Bypass -File .\apply-site-config.ps1` after updating `site.config.json`.
- Wire the inquiry form to the actual submission target.
- Run browser-based responsive QA and Lighthouse verification before deployment.
