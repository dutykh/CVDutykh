// =============================================================================
//  short.typ — the "Short" 2-page résumé theme (Source Sans 3, icon grid).
//  Ports Short/style_short.sty + Short/ShortCV-Dutykh.tex.
// =============================================================================

#import "common.typ": *
#import "icons.typ": *
#import "../content/_meta.typ": cv-keywords

#let label-grey = rgb(78, 78, 78) // colour of icons + small-caps labels in the grid

// --- Section / subsection headings ------------------------------------------
// Section:    Title ———————————————————————  (rule runs to the right margin)
// Subsection: ——————————————————————— Title   (rule runs from the left margin)
#let _hrule = line(length: 100%, stroke: 0.8pt + navy)

// --- Two-column dated entry (ports \twocolumnsentry) -------------------------
#let dated(lhs, rhs) = block(
  width: 100%,
  below: 3.7mm,
  grid(
    columns: (1fr, auto),
    column-gutter: 7mm,
    align: (left + top, right + top),
    lhs,
    text(style: "italic", fill: ink)[#rhs],
  ),
)

// --- Contact-grid cards ------------------------------------------------------
// A lightly-tinted, rounded card holding an icon | small-caps label | value(s).
#let _card-wrap(body) = block(
  fill: card-bg,
  radius: 4pt,
  inset: (x: 2.4mm, y: 1.2mm),
  stroke: 0.5pt + rgb(223, 233, 243),
  body,
)

#let card(icon, label, value) = _card-wrap(table(
  columns: 3,
  stroke: none,
  align: (center + horizon, left + horizon, left + horizon),
  inset: (x: 1.6mm, y: 1.0mm),
  text(fill: label-grey, size: 1.05em)[#icon],
  sc(text(fill: label-grey)[#label]),
  value,
))

// Multi-row card (the biographical block): each row has its own icon.
#let card-rows(rows) = _card-wrap(table(
  columns: 3,
  stroke: none,
  align: (center + horizon, left + horizon, left + horizon),
  inset: (x: 1.6mm, y: 0.9mm),
  ..rows
    .map(r => (
      text(fill: label-grey, size: 1.05em)[#r.at(0)],
      sc(text(fill: label-grey)[#r.at(1)]),
      r.at(2),
    ))
    .flatten(),
))

// Lay cards out across the full width, pushed apart like \hfill.
#let card-row(..cards) = {
  let cs = cards.pos()
  let cols = ()
  let cells = ()
  for (i, c) in cs.enumerate() {
    if i > 0 { cols.push(1fr); cells.push([]) }
    cols.push(auto)
    cells.push(c)
  }
  grid(columns: cols, align: top, ..cells)
}

// --- Remark callout (ports the `remark` theorem environment) -----------------
#let _remark-counter = counter("remark")
#let remark(body) = {
  _remark-counter.step()
  block(
    inset: (left: 3mm),
    stroke: (left: 1.2pt + navy),
  )[
    #context strong[Remark #_remark-counter.display()]
    #h(0.4em)
    #text(style: "italic")[#body]
  ]
}

// --- Template ----------------------------------------------------------------
#let short-cv(body) = {
  set document(title: "Denys Dutykh — Curriculum Vitæ", author: "Denys Dutykh", keywords: cv-keywords)
  set page(paper: "a4", margin: 2cm, numbering: none)
  set text(font: "Source Sans 3", size: 10.5pt, fill: ink, lang: "en")
  set par(justify: false, leading: 0.70em)

  // ▶ for first-level lists, • for the nested one.
  set list(marker: (tri, text(fill: navy)[#sym.bullet]), indent: 2pt, body-indent: 6pt, spacing: 0.68em)

  show link: set text(fill: navy)

  show heading.where(level: 1): it => block(above: 0.48cm, below: 0.28cm, breakable: false)[
    #set text(fill: navy, weight: "bold", size: 1.42em)
    #grid(columns: (auto, 1fr), align: horizon + left, column-gutter: 0.18cm, it.body, _hrule)
  ]
  show heading.where(level: 2): it => block(above: 0.42cm, below: 0.26cm, breakable: false)[
    #set text(fill: navy, weight: "bold", size: 1.18em)
    #grid(columns: (1fr, auto), align: horizon + right, column-gutter: 0.18cm,
      _hrule,
      box(baseline: 0.12em, rect(width: 4pt, height: 0.78em, fill: navy, radius: 0.5pt)) + h(0.4em) + it.body,
    )
  ]

  // Name header (ports the centred \Huge primaryColor header environment).
  align(center)[
    #text(size: 2.5em, weight: "bold", fill: navy)[Dr. Denys Dutykh]
    #v(0.15em)
    #text(size: 0.98em, fill: muted, weight: "semibold", tracking: 0.08em)[Applied Mathematician · Khalifa University]
  ]
  v(4mm)

  body
}
