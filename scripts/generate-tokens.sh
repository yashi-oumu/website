#!/usr/bin/env bash
# Regenerates assets/css/tokens.css from the design system in ../designsystem.
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
design_system="$(cd "$root/.." && pwd)/designsystem"
out="$root/assets/css/tokens.css"

if [ ! -f "$design_system/design-system.json" ]; then
  echo "design system not found at $design_system" >&2
  exit 1
fi

{
  echo "/* Design tokens - generated from ../designsystem (yashi-oumu themes)."
  echo "   Regenerate with: ./scripts/generate-tokens.sh */"
  echo ":root {"
  echo "  color-scheme: dark;"
  echo "}"
  echo ""
  (cd "$design_system" && npx tsx generate.ts css dark yashi-oumu)
  echo ""
  echo "@media (prefers-color-scheme: light) {"
  (cd "$design_system" && npx tsx generate.ts css light yashi-oumu-light | sed 's/^/  /')
  echo ""
  echo "  :root {"
  echo "    color-scheme: light;"
  echo "  }"
  echo "}"
} >"$out"

echo "wrote $out"