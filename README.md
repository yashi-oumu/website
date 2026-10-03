# security.yashi.oumu — coming soon

Static holding page for the Yashi-Oumu security site. No build step: plain HTML, CSS and
JavaScript, deployed straight to GitHub Pages.

## Structure

```
index.html            landing page (logo + "coming soon")
404.html              GitHub Pages fallback
assets/css/tokens.css generated design tokens (do not edit by hand)
assets/css/main.css   page styles, built on the tokens
assets/js/main.js     reveal stagger + current year
assets/img/           logo variants copied from ../designsystem/assets/logos
scripts/              token generation helper
```

## Design system

Colors, type scale, spacing, radii, shadows and transitions come from
`../designsystem/design-system.json` via the `yashi-oumu` (dark) and `yashi-oumu-light`
themes. After changing the design system, regenerate the tokens:

```sh
./scripts/generate-tokens.sh
```

The script requires the sibling `designsystem` checkout, so it is a local-only task; the
generated `tokens.css` is committed so CI stays self-contained.

## Local preview

```sh
python3 -m http.server 8000
# http://localhost:8000
```

## Deploy

`.github/workflows/deploy.yml` publishes the repository root to GitHub Pages on every push
to `main`. Enable it once: **Settings → Pages → Build and deployment → Source → GitHub
Actions**. Site will be served from `https://yashi-oumu.github.io/website/`.

All asset references are relative, so the site works from any Pages base path or from a
domain served out of the repo root.