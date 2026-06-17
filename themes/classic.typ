// =============================================================================
//  classic.typ — the "Classic" theme: a traditional, restrained serif academic
//  CV (New Computer Modern), numbered sections, dot-leader ToC, running header.
//  Ports the look of Classic/ClassicFullCV-Dutykh.tex.
// =============================================================================

#import "common.typ": *
#import "../content/_meta.typ": *
#import "@preview/hydra:0.6.1": hydra
#import "highlights.typ": highlights-page

#let serif = "New Computer Modern"
#let sans = "Latin Modern Sans"

#let classic-cv(body) = {
  theme-mode.update("classic")
  set document(
    title: [Curriculum Vitæ — #cv-name], author: cv-name,
    keywords: cv-keywords, description: "Curriculum Vitæ of " + cv-name, date: auto,
  )

  set text(font: serif, size: 11pt, fill: ink, lang: "en", hyphenate: true)
  set par(justify: true, leading: 0.8em, spacing: 1.25em)
  show math.equation: set text(font: "New Computer Modern Math")

  // Links in the traditional blue of the original.
  show link: set text(fill: link-blue)
  set list(spacing: 0.95em)
  set enum(spacing: 0.95em)

  // Headings: sans family (sectsty \sffamily), numbered, black.
  set heading(numbering: "1.1.1")
  show heading: set text(font: sans)
  show heading.where(level: 1): it => block(above: 3em, below: 1.1em, breakable: false, sticky: true)[
    #set text(size: 1.5em, weight: "bold")
    #if it.numbering != none [#counter(heading).display(it.numbering)#h(0.6em)]#it.body
  ]
  show heading.where(level: 2): it => block(above: 3.4em, below: 0.95em, breakable: false, sticky: true)[
    #set text(size: 1.2em, weight: "bold")
    #if it.numbering != none [#counter(heading).display(it.numbering)#h(0.5em)]#it.body
  ]
  show heading.where(level: 3): it => block(above: 2em, below: 1.2em, breakable: false, sticky: true)[
    #set text(size: 1.05em, weight: "bold")
    #if it.numbering != none [#counter(heading).display(it.numbering)#h(0.5em)]#it.body
  ]

  set list(marker: ([▸], [#sym.bullet], [#sym.dot.c]), body-indent: 5pt)
  set enum(numbering: "1.")

  // ---- Cover page (title-page style, no header/footer) ----------------------
  set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.3cm, x: 2.3cm), header: none, footer: none, numbering: none)
  v(3.5cm)
  align(center)[
    #text(size: 2.6em, weight: "bold")[Curriculum vitæ]
    #v(0.5em)
    #line(length: 22%, stroke: 0.6pt + ink)
    #v(2.1cm)
    #text(size: 1.5em)[#smallcaps(cv-name-display)]
    #v(0.8em)
    #text(size: 1.15em)[
      #link("mailto:" + cv-email)[#cv-email] \
      #link(cv-homepage)[#cv-homepage]
    ]
    #v(0.8em)
    #text(size: 1.15em)[#cv-affiliation.join([\ ])]
  ]
  v(1fr)
  align(center, pad(x: 1.5em)[
    #strong[Keywords:] #cv-keywords.join(", ")
  ])
  v(2cm)

  // ---- Main matter: running header + page footer ----------------------------
  set page(
    header: context {
      set text(font: sans, size: 0.85em)
      grid(columns: (1fr, auto), align: (left + bottom, right + bottom),
        smallcaps[#hydra(1, display: (_, it) => it.body)],
        strong[#smallcaps[D. Dutykh]],
      )
      v(-0.6em)
      line(length: 100%, stroke: rule-thin + ink)
    },
    footer: context {
      set align(center)
      set text(font: sans, size: 0.85em)
      [#counter(page).display() #sym.slash #context counter(page).final().first()]
    },
    numbering: "1",
  )

  // Table of contents — entries are clickable links; colour the section
  // reference (number + title) like in-text links, keep dots & page numbers black.
  pagebreak()
  block(below: 0.8em)[#text(font: sans, size: 1.7em, weight: "bold")[Contents]]
  set outline(indent: 1.2em)
  show outline.entry: it => {
    let w = if it.level == 1 { "bold" } else { "regular" }
    block(above: 0.65em, link(
      it.element.location(),
      it.indented(
        text(fill: link-blue, weight: w, it.prefix()),   // section number → blue
        {
          set text(weight: w, fill: ink)                 // dots + page → black (default)
          text(fill: link-blue, it.body())               // section title → blue
          [ ]                                            // SpaceElem (matches default inner)
          box(width: 1fr, it.fill)                       // dot leaders, black
          [ ]                                            // SpaceElem
          it.page()                                      // page number, black
        },
      ),
    ))
  }
  outline(title: none)

  pagebreak()
  highlights-page()

  pagebreak()
  body
}
