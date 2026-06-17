// =============================================================================
//  common.typ — shared design tokens and helpers for all three CV themes.
//  Classic and Modern share one content/ library and consume these helpers;
//  per-theme look is selected by `theme-mode` + each template's show/set rules.
// =============================================================================

// --- Brand palette -----------------------------------------------------------
#let navy = rgb(0, 79, 144) // primaryColor of the Short CV — the unifying brand
#let navy-dark = rgb(0, 54, 99)
#let link-blue = rgb(0, 0, 191) // oneblue of Classic/Modern (#0000BF)
#let ink = rgb(20, 20, 20)
#let muted = rgb(110, 110, 110)
#let rule-grey = rgb(150, 150, 150)
#let chip-bg = rgb(232, 240, 248)
#let zebra = rgb(244, 248, 252)
#let card-bg = rgb(247, 250, 253)

// --- Shared layout tokens (tune once, applies across themes) -----------------
#let rule-thin = 0.5pt
#let rule-accent = 1.3pt
#let entry-gap = 1.15em // gap below a dated/list entry
#let pub-gap = 0.9em // gap below a publication entry
#let kv-row-gap = 0.85em // row gutter in label/value tables

// Which theme is rendering (set by each template). Helpers branch on this.
#let theme-mode = state("cv-theme", "classic")

// Document-wide tallies (used by the Modern cover's quick-stats strip).
#let pub-counter = counter("cv-pubs")
#let collab-counter = counter("cv-collabs")

// --- Dynamic statistics (for the Detailed Highlights page) -------------------
// Counts accumulate as the body renders; the Highlights page reads .final().
#let cv-stats = state("cv-stats", (:))
#let year-stats = state("cv-years", (:))
#let stat-add(key, n) = cv-stats.update(d => { d.insert(key, d.at(key, default: 0) + n); d })
#let year-add(y, n) = year-stats.update(d => { d.insert(str(y), d.at(str(y), default: 0) + n); d })

// Counting wrappers: record the item count, then render normally.
#let clist(key, ..items) = { stat-add(key, items.pos().len()); list(..items.pos()) }
#let cenum(key, ..items) = { stat-add(key, items.pos().len()); enum(..items.pos()) }
// A software-project repository link that also tallies one "software" project.
#let repo-link(url) = { stat-add("software", 1); link(url) }

// Journal/venue name highlight (theme-aware). Modern: navy semibold; Classic: subtle.
#let venue(body) = context {
  if theme-mode.get() == "modern" {
    text(fill: navy, weight: "semibold")[#body]
  } else {
    text(fill: navy-dark)[#body]
  }
}

// --- Inline text helpers -----------------------------------------------------

#let sc(body) = smallcaps(body)
#let up(body) = super(typographic: true, body) // ports \up{..}/\textsuperscript{..}
#let me = strong[D. Dutykh] // the CV owner, highlighted in author lists
#let No = [N#super(typographic: false)[o]] // the № abbreviation as used in source
#let endash = sym.dash.en
#let emdash = sym.dash.em
#let nbsp = sym.space.nobreak

// A hyperlink; colour is decided by each theme's `show link` rule.
#let xlink(url, body) = link(url, body)

// A hyperlink with a trailing external-link icon (theme injects the icon).
#let xlink-ext(url, body, icon: none) = link(url)[#body#if icon != none [#h(0.12em)#text(size: 0.66em, baseline: -0.18em, icon)]]

// Bullets.
#let tri = text(fill: navy, size: 0.8em)[▶]
#let dotb = sym.bullet

// Emoji country flag (Noto Color Emoji), e.g. flag("UA") -> 🇺🇦
#let flag(cc) = {
  let base = 0x1F1E6
  let a = str.to-unicode("A")
  text(font: "Noto Color Emoji", size: 0.95em)[#cc.clusters().map(c => str.from-unicode(base + str.to-unicode(c) - a)).join()]
}

// --- Block helpers -----------------------------------------------------------

// Two-column dated entry (ports \twocolumnsentry): body left, italic date right.
#let dated(body, date) = block(width: 100%, below: entry-gap, breakable: true, grid(
  columns: (1fr, auto),
  column-gutter: 8mm,
  align: (left + top, right + top),
  body,
  text(style: "italic")[#date],
))

// Wider date column variant (ports \twocolumnsentrywide) — kept for parity.
#let dated-wide(body, date) = dated(body, date)

// Counted dated entry — records +1 under `key` (e.g. research visits).
#let dated-counted(key, body, date) = { stat-add(key, 1); dated(body, date) }

// Right-aligned small-caps label / left value table (ports tabular{rl}).
// Arguments are (label, value) pairs; a bare length inserts a vertical gap.
#let kv-table(..rows) = {
  let cells = ()
  for r in rows.pos() {
    if type(r) == length {
      cells.push(v(r))
      cells.push([])
    } else {
      cells.push(sc(text(r.at(0))))
      cells.push(r.at(1))
    }
  }
  block(grid(
    columns: (auto, 1fr),
    column-gutter: 1.0em,
    row-gutter: kv-row-gap,
    align: (right + top, left + top),
    ..cells,
  ))
}

// Year divider inside a publication list (ports \listpart{-- YYYY --}).
#let yd(y) = (cv-kind: "year", y: y)

#let _year-divider(y) = context {
  if theme-mode.get() == "modern" {
    align(center, box(
      fill: chip-bg,
      inset: (x: 9pt, y: 3pt),
      radius: 3pt,
      text(weight: "bold", fill: navy, size: 1.0em)[#emdash #y #emdash],
    ))
  } else {
    align(center, text(size: 1.1em, weight: "bold")[#endash #y #endash])
  }
}

// Reverse-numbered publication list (ports etaremune). `items` mixes entry
// content with yd(year) dividers; numbering descends, continuous across years.
// Number style for the reverse index — muted in Modern, traditional navy in Classic.
#let _pub-number(n) = context {
  if theme-mode.get() == "modern" {
    text(fill: muted, weight: "regular", size: 0.92em)[#n.]
  } else {
    text(fill: navy, weight: "bold")[#n.]
  }
}

// Reverse-numbered publication list (ports etaremune). `items` mixes entry
// content with yd(year) dividers; numbering descends, continuous across years.
#let pub-list(items, category: none, track-years: false) = {
  let total = items.filter(it => not (type(it) == dictionary and it.at("cv-kind", default: none) == "year")).len()
  if category != none { stat-add("pub:" + category, total) }
  // Publication total (excludes Posters, which live under Talks) — fully dynamic.
  if category != none and category != "Posters" { pub-counter.update(n => n + total) }
  let idx = total
  let cur-year = none
  set par(justify: true, hanging-indent: 0pt)
  for it in items {
    if type(it) == dictionary and it.at("cv-kind", default: none) == "year" {
      cur-year = it.y
      block(above: 0.9em, below: 0.7em, width: 100%, _year-divider(it.y))
    } else {
      if track-years and cur-year != none { year-add(cur-year, 1) }
      let n = idx
      idx -= 1
      block(below: pub-gap, grid(
        columns: (auto, 1fr),
        column-gutter: 7pt,
        align: (right + top, left + top),
        _pub-number(n), it,
      ))
    }
  }
}

// Flow content across N balanced columns (for long short-item lists / rosters).
#let multicol(n, body, gutter: 1.1em) = columns(n, gutter: gutter, body)

// Foreign-language list. rows: (language, flag-code, level).
// Flags shown only in Modern (matches the source).
#let lang-list(rows) = context {
  let show-flags = theme-mode.get() == "modern"
  let cells = ()
  for r in rows {
    cells.push(sc(text(r.at(0))))
    if show-flags { cells.push(align(horizon, flag(r.at(1)))) }
    cells.push(r.at(2))
  }
  if show-flags {
    block(grid(
      columns: (auto, auto, 1fr),
      column-gutter: 1.0em, row-gutter: kv-row-gap,
      align: (right + horizon, center + horizon, left + horizon),
      ..cells,
    ))
  } else {
    block(grid(
      columns: (auto, 1fr),
      column-gutter: 1.0em, row-gutter: kv-row-gap,
      align: (right + top, left + top),
      ..cells,
    ))
  }
}

// Section separator: a subtle vertical gap. (The dotted rule was dropped —
// strong section/subsection headings already delimit blocks; A-4.)
#let separator() = v(0.9em, weak: true)

// Remark callout (ports the `remark` theorem environment). Counter-numbered.
#let _remark-counter = counter("cv-remark")
#let remark(body) = {
  _remark-counter.step()
  block(inset: (left: 3mm), stroke: (left: 1.2pt + navy))[
    #context strong[Remark #_remark-counter.display()]
    #h(0.4em)
    #text(style: "italic")[#body]
  ]
}
