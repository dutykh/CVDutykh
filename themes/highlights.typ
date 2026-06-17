// =============================================================================
//  highlights.typ — the "Detailed Highlights" front-matter page (Classic &
//  Modern). All numbers are computed at compile time from the live data
//  (cv-stats / year-stats / counters), so they auto-update on every build.
// =============================================================================

#import "common.typ": *
#import "icons.typ": fa, fa-solid-font
#import "../content/_meta.typ": *

// Map publication-category state keys to short display labels (Posters excluded
// here — they are counted under Talks).
#let _pub-labels = (
  "pub:International peer-reviewed journals": "Journal articles",
  "pub:Conference proceedings": "Conference proceedings",
  "pub:Peer-reviewed conference proceedings": "Peer-reviewed proceedings",
  "pub:Book chapters": "Book chapters",
  "pub:General audience articles": "General-audience articles",
  "pub:Preprints under review": "Preprints under review",
  "pub:Research reports": "Research reports",
  "pub:Various writings": "Various writings",
  "pub:Books": "Books",
  "pub:Theses": "Theses",
  "pub:Book reviews": "Book reviews",
)

#let _sum-prefix(d, p) = d.pairs().filter(kv => kv.at(0).starts-with(p)).map(kv => kv.at(1)).sum(default: 0)

// --- chart helpers (native drawing, no packages) -----------------------------
#let _hbar(label, value, maxv, accent) = grid(
  columns: (4.6cm, 1fr, auto), column-gutter: 0.7em,
  align: (right + horizon, left + horizon, left + horizon),
  text(size: 0.92em)[#label],
  box(width: 100%, height: 0.78em)[
    #box(width: calc.max(value / maxv, 0.001) * 100%, height: 100%, fill: accent, radius: 1.5pt)
  ],
  text(weight: "bold", size: 0.92em)[#value],
)

#let _vbars(data, accent, peak, height: 3.2cm) = {
  let maxv = calc.max(..data.map(d => d.at(1)), 1)
  grid(
    columns: (1fr,) * data.len(), align: bottom + center, column-gutter: 2.2pt,
    ..data.map(d => {
      let isk = d.at(0) == peak
      stack(
        dir: ttb, spacing: 2pt,
        text(size: 0.52em, fill: if isk { accent } else { muted })[#d.at(1)],
        box(width: 72%, height: calc.max(d.at(1) / maxv, 0.0) * height,
            fill: if isk { accent } else { accent.transparentize(35%) }, radius: (top: 1.5pt)),
        text(size: 0.55em, fill: muted)[#d.at(0).slice(2)],
      )
    }),
  )
}

// A small "label …… value" row used in the service grid.
#let _kv(label, value) = grid(columns: (1fr, auto), text(size: 0.92em)[#label], strong[#value])

// --- the page ----------------------------------------------------------------
#let highlights-page() = context {
  let modern = theme-mode.get() == "modern"
  let accent = navy
  let stats = cv-stats.final()
  let years = year-stats.final()
  let get(k) = stats.at(k, default: 0)

  let journals = get("pub:International peer-reviewed journals")
  let books = get("pub:Books")
  let pubtot = pub-counter.final().first()
  let collab = collab-counter.final().first()
  let talks-total = _sum-prefix(stats, "talks-") + get("pub:Posters")
  let students-total = _sum-prefix(stats, "stu-")
  let patents = get("patents")

  // ---- title -------------------------------------------------------------
  if modern {
    block(above: 0pt, below: 0.9em)[
      #grid(columns: (auto, 1fr), align: horizon, column-gutter: 0.55em,
        text(size: 1.9em, fill: navy)[#fa("\u{f080}")],
        text(size: 1.9em, weight: 800, fill: navy)[Detailed Highlights],
      )
      #v(2pt)
      #line(length: 100%, stroke: rule-accent + navy)
    ]
  } else {
    block(below: 0.8em)[
      #align(center)[#text(size: 1.8em, weight: "bold")[Detailed Highlights]]
      #align(center)[#line(length: 22%, stroke: 0.6pt + ink)]
    ]
  }

  // ---- headline stat cards ----------------------------------------------
  let cards = (
    ([Publications], pubtot), ([Journal articles], journals), ([Books], books),
    ([Collaborators], collab), ([Talks delivered], talks-total),
    ([Students supervised], students-total), ([Patents], patents),
    ([h-index], cv-hindex),
  )
  let _card(label, value) = {
    let body = align(center)[
      #text(size: 1.7em, weight: 800, fill: navy)[#value] \
      #text(size: 0.72em, fill: muted, weight: "semibold")[#upper(label)]
    ]
    if modern { box(fill: chip-bg, radius: 5pt, inset: (x: 6pt, y: 8pt), width: 100%, body) } else { body }
  }
  grid(columns: (1fr,) * 4, column-gutter: 0.7em, row-gutter: 0.7em,
    ..cards.map(c => _card(c.at(0), c.at(1))))

  v(1.0em)

  // ---- publications by type (left) + per-year chart (right) -------------
  let pubrows = _pub-labels.pairs()
    .map(kv => (kv.at(1), get(kv.at(0))))
    .filter(r => r.at(1) > 0)
    .sorted(key: r => -r.at(1))
  let pubmax = calc.max(..pubrows.map(r => r.at(1)), 1)

  let yr = years.pairs().map(kv => (kv.at(0), kv.at(1))).sorted(key: kv => kv.at(0))
  let peak = if yr.len() > 0 { yr.sorted(key: kv => -kv.at(1)).first().at(0) } else { "" }
  let yspan = if yr.len() > 0 { yr.first().at(0) + "–" + yr.last().at(0) } else { "" }
  let yavg = if yr.len() > 0 { calc.round(yr.map(kv => kv.at(1)).sum() / yr.len(), digits: 1) } else { 0 }

  grid(columns: (1.05fr, 1fr), column-gutter: 1.4em, align: top,
    [
      #text(weight: "bold", fill: navy, size: 1.05em)[Publications by type]
      #v(0.5em)
      #stack(dir: ttb, spacing: 0.5em, ..pubrows.map(r => _hbar(r.at(0), r.at(1), pubmax, accent)))
    ],
    [
      #text(weight: "bold", fill: navy, size: 1.05em)[Journal articles per year]
      #v(0.7em)
      #_vbars(yr, accent, peak)
      #v(0.5em)
      #text(size: 0.8em, fill: muted)[Active #yspan #h(0.6em)·#h(0.6em) peak #peak (#years.at(peak, default: 0)) #h(0.6em)·#h(0.6em) avg #yavg/yr]
    ],
  )

  v(1.1em)

  // ---- service & mentoring grid -----------------------------------------
  text(weight: "bold", fill: navy, size: 1.05em)[Mentoring \& academic service]
  v(0.5em)
  let col-students = (
    [#strong[Students supervised] (#students-total)],
    _kv([Post-doctoral fellows], get("stu-postdoc")),
    _kv([PhD students], get("stu-phd")),
    _kv([Master 2 students], get("stu-m2")),
    _kv([Senior research projects], get("stu-senior")),
    _kv([Work-study students], get("stu-ws")),
    _kv([Master 1 students], get("stu-m1")),
    _kv([Other students], get("stu-other")),
    _kv([Habilitation committees], get("cmte-hab")),
    _kv([PhD committees], get("cmte-phd")),
  )
  let col-talks = (
    [#strong[Talks delivered] (#talks-total)],
    _kv([International conferences], get("talks-intl")),
    _kv([Workshops], get("talks-workshops")),
    _kv([National conferences], get("talks-national")),
    _kv([Summer schools], get("talks-summer")),
    _kv([Seminars], get("talks-seminars")),
    _kv([Short courses], get("talks-courses")),
    _kv([Posters], get("pub:Posters")),
    _kv([General-audience lectures], get("talks-general")),
  )
  let col-service = (
    [#strong[Editorial \& service]],
    _kv([Journals refereed for], get("ref-journals")),
    _kv([Conferences refereed for], get("ref-conf")),
    _kv([Editorial boards], get("editorial")),
    _kv([Special issues edited], get("special-issues")),
    _kv([Meetings organized], get("meetings")),
    _kv([Software projects], get("software")),
    _kv([Research visits abroad], get("visits")),
    _kv([Grant-call panels], get("ref-calls")),
  )
  grid(columns: (1fr, 1fr, 1fr), column-gutter: 1.4em,
    stack(dir: ttb, spacing: 0.55em, ..col-students),
    stack(dir: ttb, spacing: 0.55em, ..col-talks),
    stack(dir: ttb, spacing: 0.55em, ..col-service),
  )
}
