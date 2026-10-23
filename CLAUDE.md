# CLAUDE.md

Guidance for Claude Code when working in `~/personal/website`. The umbrella
`~/personal/CLAUDE.md` (project index, cross-project rules) also applies.

## What this is

John Moustakas's professional website, replacing the 2019-era WordPress site
at https://moustakas.siena.edu/. One site, research-forward, with Teaching
and Service & Outreach as secondary pages.

- Generator: Hugo (extended, installed with `brew install hugo`), with a
  small custom theme living directly in `layouts/` and `assets/`. No
  third-party theme, by design: like the CV, the site should not read as
  "used a template" (al-folio, Hugo Blox, etc.).
- Hosting: GitHub Pages from a public repo, `moustakas/moustakas.github.io`
  (to be created), deployed by `.github/workflows/hugo.yml` on every push to
  `main`. A custom domain or a redirect from `moustakas.siena.edu` (pending
  with Siena IT) can be added later with a `static/CNAME` file plus a DNS
  change; no other site changes needed.

## Commands

```
make serve          # hugo server: local preview at http://localhost:1313, live reload
make build          # hugo --gc --minify into public/ (what the deploy workflow runs)
make publications   # copy the newest CV publications JSON to data/publications.json
```

Templates use the current Hugo API (`hugo.Data`, `site.Language.Locale`);
avoid deprecated forms like `.Site.Data` and `.Site.LanguageCode`. Likewise
in `hugo.toml`, use `locale`, not `languageCode`.

## Layout

- `hugo.toml` — site config, contact params, and the main menu.
- `content/` — one Markdown file per page. `research/` is organized in three
  themes (listed by `weight`): `observational-cosmology.md`, the section
  `galaxy-star-formation-and-assembly/` (subtheme pages), and
  `surveys-and-data-releases.md`. Old WordPress-era research URLs are kept working
  with `aliases:` in front matter.
- `layouts/shortcodes/papers.html` — `{{< papers "key" >}}` lists a curated
  group of papers from the page's `papers:` front matter (bibcodes, title
  prefixes for papers without one, or hand-written entries), looking up
  titles, authors, and links in `data/publications.json`, and marks
  first-author papers "Lead author." See the comment at its top for the
  front-matter format.
- `layouts/` — the theme: `_default/baseof.html` (shell), `index.html` (home,
  with the landing image), `single.html`, `list.html`, plus `group.html` and
  `publications.html`, selected by `layout:` front matter.
- `assets/css/main.css` — all styling, with light/dark color tokens on
  `:root`.
- `assets/images/hero.png` — the landing image (from the old site). Hugo
  resizes it to WebP at build time; don't pre-convert it.
- `layouts/shortcodes/img.html` — `{{< img src=... alt=... caption=... >}}`
  for figures in content pages; images live under `assets/images/` and are
  resized to WebP at build time. Use `light=true` for transparent figures with
  dark text (logos, plots) so they stay readable in dark mode. Shrink very
  large originals (more than a few MB) before adding them to the repo.
- `data/group.yaml` — Group page members (`current`, `former`).
- `data/publications.json` — Publications page data (see below). Without it,
  the page shows only the ADS link.
- `legacy/` — the WordPress XML export and downloaded media. **Gitignored**:
  the export holds account details and drafts; copy only what is used.

## Content rules

- The repo is public. Everything committed is published.
- Facts come from `../cv/cv_moustakas.tex`. Grant amounts and student names
  from the CV are not published without John's explicit OK; students go on
  the Group page only after they have agreed.
- The CV PDF itself contains grant amounts and student names, so don't link
  or copy it here without asking.
- Draft text carries an HTML `<!-- DRAFT ... -->` or `<!-- TODO ... -->`
  comment at the top or inline; remove it once John has signed off on a page.

## Publications data

The CV's `publications/parse_publications.py` does all the classification
and writes `<date>-publications.json` next to its `.tex` fragment, with the
same entries, so the CV and website lists never disagree. `make
publications` copies the newest one to `data/publications.json`, which is
committed here (the deploy workflow can't see the CV repo). The update
sequence after new papers appear is: `fetch_ads.py` and
`parse_publications.py` in `../cv`, then `make publications` here.

Shape, as read by `layouts/_default/publications.html`:

```json
{
  "date": "2026 October 13",
  "summary": [{"label": "Refereed Publications", "value": "447"}, ...],
  "sections": [
    {"key": "top", "heading": "Refereed Publications As First, Second, or Third Author",
     "entries": [{"number": 37, "title": "Siena Galaxy Atlas 2020",
                  "info": "<strong>J. Moustakas</strong>, D. Lang, A. Dey et al. 2023, ApJS, 269, 3",
                  "bibcode": "2023ApJS..269....3M", "doi": "...", "arxiv": "...", "citations": 42}]}
  ]
}
```

Section keys are `top`, `prep`, `other`, `conf`, `unref`; the `sections:`
front matter in `content/publications.md` picks which to show and in what
order (currently in-prep first), and the page builds its table of contents
from the same list. `title`,
`info`, and `heading` are HTML (converted from the CV's LaTeX by
`latex_to_html()` in `parse_publications.py`; fix rendering glitches there).
