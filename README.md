# Concept Formation in Computational Creativity

**A PhD dissertation by Giovanni Lion**
Doctor of Philosophy in Design — The Hong Kong Polytechnic University, 2025
Advisor: Prof. dr. dr. Johan F. Hoorn

📄 **[Read the PDF](pdf/Concept-Formation-in-Computational-Creativity.pdf)** · 🌐 **Web edition: `site/` (deployed via Cloudflare Pages / GitHub Pages)**

---

## Abstract

This thesis investigates the relationship between creativity and machines through the lens of
mediation theory. The research provides a thorough review of existing Theories of Concepts (TOCs)
and examines their influence on the evolution of rule-based and data-driven computational
approaches, in the context of creative practices. The research objective is to establish a
theoretical framework able to describe the two approaches and utilize it to identify and validate
critical factors of concept formation that affect the creative process, with particular focus on
the observed trend towards data-driven technologies.

An extension of mediation theory is proposed, distinguishing between two computational approaches
and their associated TOCs. The first two studies explore the practice of concept representation
using data-driven tools: a collaboration with a music composer to train a model in her unique
style, and an exploration of the reflective potential of dataset curation using generative
adversarial networks with a photographer. The third study investigates the relationship between
the critical factors identified, within the context of text-to-image generation using Stable
Diffusion. The findings highlight the significance of dataset curation, the emergence of language
as a powerful interface for concepts, and a possible shift in focus from product to process in
creative practices.

## Repository layout

```
.
├── pdf/                  Authoritative, examined thesis (final approved PDF)
├── thesis/               LaTeX source (Dissertate template, XeLaTeX + Biber)
│   ├── dissertation.tex      Master file (as submitted)
│   ├── _web.tex              Build driver for the web edition (adds abstract + appendices)
│   ├── Dissertate.cls        Document class
│   ├── references-biblatex.bib
│   ├── chapters/             introduction, ch2–7, conclusion, appendices A–B
│   ├── frontmatter/  endmatter/  figures/  media/
│   ├── scripts/build         PDF build script
│   └── web/                  HTML-site theme + build script
│       ├── styles.css
│       ├── banner.html
│       └── build-site.sh
├── site/                 Pre-built browsable HTML edition (what Pages serves)
└── .github/workflows/    CI: rebuild the web edition and deploy to GitHub Pages
```

## Building the PDF

Requires a TeX distribution with **XeLaTeX** and **Biber** (e.g. TeX Live or MiKTeX).

```sh
cd thesis
xelatex dissertation
biber dissertation
xelatex dissertation
xelatex dissertation
```

(`scripts/build` runs the classic `bibtex` variant.)

## Building the web edition

Requires **[pandoc](https://pandoc.org) ≥ 3.0**. The site is rendered straight from the LaTeX
source — chapters, figures, citations (resolved against `references-biblatex.bib`) and a generated
bibliography — into a multi-page, navigable static site.

```sh
bash thesis/web/build-site.sh    # writes to ./site
```

## Deployment

The `site/` directory is committed pre-built, so any static host serves it as-is.

- **Cloudflare Pages** — connect this repo; set **Build command:** *(none)* and **Build output
  directory:** `site`. (If you prefer Cloudflare to build, set the build command to
  `bash thesis/web/build-site.sh` on an image that has pandoc installed.)
- **GitHub Pages** — the workflow in `.github/workflows/build-site.yml` rebuilds `site/` from
  source on every push and deploys it automatically.

## Notes on the source

- `thesis/dissertation.tex` is preserved as submitted. The web edition is built from `_web.tex`,
  which mirrors it but enables the abstract heading and `\include`s appendices A & B (cross-referenced
  throughout but not wired into the original master). The **PDF in `pdf/` is the authoritative,
  examined version of record.**
- Two source fixes were applied for clean tooling: an empty citation key in `chapter7.tex`
  (`{Agostinelli2023, ,...}`) and a colon in chapter 5's `\label` (illegal in filenames/URLs).

## Copyright

© 2025 Giovanni Lion. All rights reserved. The dissertation text and figures are the author's
academic work; please cite rather than redistribute. The build scripts and theme (`thesis/web/`,
`.github/`) may be reused freely.
