// =============================================================================
//  modern.typ — the "Modern" showcase theme: contemporary sans-serif design
//  (Source Sans 3), navy accent system, section openers with icons, keyword
//  pills, quick-stats cover strip, colored ToC, running-header band, flags.
// =============================================================================

#import "common.typ": *
#import "icons.typ": *
#import "../content/_meta.typ": *
#import "@preview/hydra:0.6.1": hydra
#import "highlights.typ": highlights-page

// One FA6 icon per top-level section, in document order.
#let section-icons = (
  fa-user, fa-trophy, fa-certificate, fa-rocket, fa-briefcase, fa-graduation,
  fa-gears, fa-flask, fa-chalkboard, fa-clipboard, fa-heart, fa-address-book,
)

#let _pill(body) = box(
  fill: chip-bg, inset: (x: 7pt, y: 3pt), radius: 4pt, outset: (y: 2pt),
  text(size: 0.85em, fill: navy-dark)[#body],
)

#let _stat(value, label) = align(center)[
  #text(size: 1.9em, weight: 800, fill: navy)[#value] \
  #text(size: 0.78em, fill: muted, weight: "semibold")[#upper(label)]
]

// A single faint sine curve (decorative wave motif for the cover).
#let _wave(w, amp, periods, phase, paint, sw: 1pt) = {
  let n = 90
  let pt = i => (w * (i / n), amp * calc.sin(phase + periods * 2 * calc.pi * (i / n)))
  curve(stroke: (paint: paint, thickness: sw, cap: "round"),
    curve.move(pt(0)), ..range(1, n + 1).map(i => curve.line(pt(i))))
}

// A few overlapping waves — references the free-surface / water-wave theme.
#let _wave-motif(w) = box(width: w, height: 3.4cm, {
  place(center + horizon, _wave(w, 0.60cm, 2.2, 0.0, navy.transparentize(82%), sw: 1.6pt))
  place(center + horizon, dy: 0.45cm, _wave(w, 0.42cm, 3.1, 1.1, navy.transparentize(88%), sw: 1.1pt))
  place(center + horizon, dy: -0.5cm, _wave(w, 0.48cm, 1.7, 2.2, navy.transparentize(90%), sw: 1.1pt))
})

#let modern-cv(body) = {
  theme-mode.update("modern")
  set document(
    title: [Curriculum Vitæ — #cv-name], author: cv-name,
    keywords: cv-keywords, description: "Curriculum Vitæ of " + cv-name, date: auto,
  )

  set text(font: "Source Sans 3", size: 11pt, fill: ink, lang: "en", hyphenate: true)
  set par(justify: true, leading: 0.85em, spacing: 1.3em)
  show math.equation: set text(font: "New Computer Modern Math")

  show link: set text(fill: navy)

  set list(marker: (tri, text(fill: navy)[#sym.bullet], [#sym.dot.c]), body-indent: 6pt, spacing: 0.95em)
  set enum(numbering: n => text(fill: navy, weight: "bold")[#n.], spacing: 0.95em)

  // Headings ------------------------------------------------------------------
  set heading(numbering: "1.1.1")
  show heading: set text(font: "Source Sans 3")
  show heading.where(level: 1): it => context {
    let n = counter(heading).get().first()
    let icon = section-icons.at(n - 1, default: fa-flask)
    block(above: 3em, below: 1.15em, breakable: false, sticky: true, width: 100%)[
      #grid(
        columns: (auto, auto, 1fr),
        align: horizon, column-gutter: 0.55em,
        text(size: 2.0em, weight: 800, fill: navy)[#n],
        text(size: 1.35em, fill: navy)[#icon],
        text(size: 1.5em, weight: "bold", fill: navy)[#it.body],
      )
      #v(2pt)
      #line(length: 100%, stroke: 1.3pt + navy)
    ]
  }
  show heading.where(level: 2): it => block(above: 3.4em, below: 0.95em, breakable: false, sticky: true)[
    #set text(size: 1.18em, weight: "bold", fill: navy)
    #box(width: 4pt, height: 0.9em, fill: navy, outset: (y: 1pt))#h(0.5em)#counter(heading).display()#h(0.45em)#it.body
  ]
  show heading.where(level: 3): it => block(above: 2em, below: 1.2em, breakable: false, sticky: true)[
    #set text(size: 1.04em, weight: "semibold", fill: navy-dark)
    #counter(heading).display()#h(0.45em)#it.body
  ]

  // ---- Cover hero (no header/footer) ----------------------------------------
  set page(paper: "a4", margin: (top: 2.3cm, bottom: 2.2cm, x: 2.2cm), header: none, footer: none, numbering: none)
  // Faint wave motif centred in the page, behind the flow (fills the void).
  place(center + horizon, dy: 0.6cm, _wave-motif(16.6cm))
  v(1.9cm)
  block[
    #text(size: 3.3em, weight: 800, fill: navy)[#cv-name-display]
    #v(-0.2em)
    #line(length: 38%, stroke: 2.5pt + navy)
    #v(0.34em)
    #text(size: 1.3em, fill: muted, weight: "semibold", tracking: 0.15em)[#upper[Curriculum Vitæ]]
    #v(0.55em)
    #text(size: 1.06em, fill: navy-dark)[#cv-tagline.join("  ·  ")]
  ]
  v(1.0em)
  grid(columns: (1fr), row-gutter: 0.5em,
    text(size: 1.1em)[#fa-envelope #h(0.5em) #link("mailto:" + cv-email)[#cv-email] #h(1.5em) #fa-link #h(0.5em) #link(cv-homepage)[#cv-homepage]],
    text(size: 1.05em, fill: ink)[#cv-affiliation.join(" · ")],
  )
  v(1fr)
  // Quick-stats strip (explicit facts + exact counts of listed entries).
  context grid(columns: (1fr,) * 4, column-gutter: 1em,
    _stat(cv-hindex, "h-index"),
    _stat(cv-erdos, [Erdős #No]),
    _stat(pub-counter.final().first(), "Publications"),
    _stat(collab-counter.final().first(), "Collaborators"),
  )
  v(0.9cm)
  line(length: 100%, stroke: 0.6pt + rule-grey)
  v(0.5em)
  text(size: 0.92em, fill: muted)[#strong(text(fill: navy-dark)[Keywords ])#h(0.3em)#cv-keywords.map(k => _pill(k)).join(h(4pt))]

  // ---- Main matter ----------------------------------------------------------
  set page(
    header: context {
      set text(font: "Source Sans 3", size: 0.85em, fill: navy-dark)
      grid(columns: (1fr, auto), align: (left + bottom, right + bottom),
        smallcaps[#hydra(1, display: (_, it) => it.body)],
        strong[D. Dutykh],
      )
      v(-0.55em)
      line(length: 100%, stroke: rule-accent + navy)
    },
    footer: context {
      set align(center)
      set text(font: "Source Sans 3", size: 0.85em, fill: navy-dark)
      [#counter(page).display() #sym.slash #counter(page).final().first()]
    },
    numbering: "1",
  )

  pagebreak()
  block(below: 0.7em)[#text(size: 1.9em, weight: 800, fill: navy)[Contents]]
  show outline: set text(fill: navy-dark)
  show outline.entry.where(level: 1): set text(weight: "bold", fill: navy)
  set outline(indent: 1.2em)
  outline(title: none)

  pagebreak()
  highlights-page()

  pagebreak()
  body
}
