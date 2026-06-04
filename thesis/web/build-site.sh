#!/usr/bin/env bash
# Build the browsable HTML edition of the thesis from the LaTeX source.
# Requires: pandoc >= 3.x. Run from the repository root or anywhere.
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"   # thesis/web
THESIS="$(dirname "$HERE")"             # thesis
REPO="$(dirname "$THESIS")"             # repo root
OUT="$REPO/site"

rm -rf "$OUT"
cd "$THESIS"

pandoc _web.tex \
  --citeproc \
  --bibliography=references-biblatex.bib \
  --metadata reference-section-title="References" \
  --metadata link-citations=true \
  --metadata link-bibliography=true \
  --toc --toc-depth=2 \
  --number-sections \
  --split-level=1 \
  --css=styles.css \
  --include-in-header=web/head.html \
  --include-before-body=web/banner.html \
  --metadata title="Concept Formation in Computational Creativity" \
  --metadata author="Giovanni Lion" \
  -t chunkedhtml \
  -o "$OUT"

# Ship the theme and the authoritative PDF alongside the site.
cp "$HERE/styles.css" "$OUT/styles.css"
cp "$REPO/pdf/Concept-Formation-in-Computational-Creativity.pdf" "$OUT/thesis.pdf"

echo "Site built at: $OUT"
