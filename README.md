# Curriculum Vitæ of Dr. Denys Dutykh

This repository builds **three CV styles** for Dr. Denys Dutykh with the
[**Typst**](https://typst.app) typesetting system (Typst 0.15+).

| Style | Source | Compiled PDF | Look |
|-------|--------|--------------|------|
| **Classic** | `src/ClassicFullCV-Dutykh.typ` | `Classic/build/ClassicFullCV-Dutykh.pdf` | Traditional serif academic CV (New Computer Modern), numbered sections, dot-leader ToC |
| **Modern**  | `src/ModernFullCV-Dutykh.typ`  | `Modern/build/ModernFullCV-Dutykh.pdf`  | Contemporary sans-serif (Source Sans 3), navy accent system, section-opener icons, **auto-computed highlights** |
| **Short**   | `src/ShortCV-Dutykh.typ`       | `Short/build/ShortCV-Dutykh.pdf`        | Two-page résumé: icon contact grid, dated entries |

> The PDF output paths above are **fixed** — external tools fetch the CV via
> these GitHub raw URLs. Do not rename or move them. For convenience, `make`
> also mirrors all three PDFs into a single `out/` folder.

## Build

```sh
make            # build all three CVs into their build/ folders (default)
make modern     # build a single style (classic | modern | short)
make watch-modern   # live preview
make fonts      # download the required fonts into fonts/ (run once)
make clean      # remove the compiled PDFs
make help       # list all targets
```

The build uses `typst compile --font-path fonts --root . --pdf-standard a-2b`
(PDF/A-2b embeds fonts for long-term stability and ATS parsing).

## Layout

```
Makefile                 Typst build (outputs to the canonical build/ paths)
fonts/                   Source Sans 3 (variable) + Font Awesome 6 Free  (make fonts)
themes/                  common.typ, classic.typ, modern.typ, short.typ, highlights.typ, icons.typ
content/                 shared sections for Classic + Modern (personal, awards, …, research/)
  short/                 the Short CV's own condensed content
src/                     the three Typst entry files
Classic|Modern|Short/build/   compiled PDFs (canonical URL paths — for compatibility)
out/                     the same three PDFs gathered in one folder (convenience)
legacy/                  the previous LaTeX sources (archived; still buildable from legacy/)
```

## Architecture

- **One shared content source, two themes.** Classic and Modern render the *same*
  `content/` library through different `themes/`; the Short CV has its own content.
  Per-theme styling is selected by a `theme-mode` state read by the shared helpers
  in `themes/common.typ` (dated entries, reverse-numbered publication lists,
  small-caps tables, language flags, journal-venue highlighting, …).
- **Auto-computed “Detailed Highlights”.** The Modern and Classic CVs include a
  front-matter statistics page (publications by type, journal articles per year,
  collaborators, students, talks, software projects, …). Every number is derived
  from the live data at compile time via counters/state, so it **updates
  automatically** whenever an entry is added — nothing is hardcoded.
- **Fonts** are fetched into `fonts/` by `make fonts` and committed for
  reproducibility; New Computer Modern and Noto Color Emoji (language flags)
  come from the system.

## Author

**Dr. Denys Dutykh** — Mathematics Department, Khalifa University of Science and
Technology, Abu Dhabi, United Arab Emirates · <https://www.denys-dutykh.com/>
