// Font Awesome 6 Free icon helpers.
// Fonts are loaded via `--font-path fonts` (see Makefile). Solid and Regular are
// distinct families in Typst; Brands is its own family.

#let fa-solid-font = "Font Awesome 6 Free Solid"
#let fa-regular-font = "Font Awesome 6 Free"
#let fa-brands-font = "Font Awesome 6 Brands"

// Render a solid glyph by codepoint.
#let fa(cp, font: fa-solid-font) = text(font: font)[#cp]

// --- Named solid icons used across the CVs -----------------------------------
#let fa-envelope = fa("\u{f0e0}")
#let fa-location = fa("\u{f3c5}") // map-marker (location-dot)
#let fa-phone = fa("\u{f095}")
#let fa-link = fa("\u{f0c1}")
#let fa-cake = fa("\u{f1fd}") // birthday-cake (cake-candles)
#let fa-hospital = fa("\u{f0f8}")
#let fa-idcard = fa("\u{f2c2}")
#let fa-car = fa("\u{f1b9}")
#let fa-child = fa("\u{f1ae}")
#let fa-external = fa("\u{f08e}") // external-link (up-right-from-square)

// Extra icons handy for the Modern theme's section openers.
#let fa-user = fa("\u{f007}")
#let fa-trophy = fa("\u{f091}")
#let fa-lightbulb = fa("\u{f0eb}")
#let fa-briefcase = fa("\u{f0b1}")
#let fa-graduation = fa("\u{f19d}")
#let fa-gears = fa("\u{f085}")
#let fa-flask = fa("\u{f0c3}")
#let fa-chalkboard = fa("\u{f51c}") // chalkboard-user (teaching)
#let fa-clipboard = fa("\u{f0ae}") // tasks/list-check
#let fa-heart = fa("\u{f004}")
#let fa-address-book = fa("\u{f2b9}")
#let fa-certificate = fa("\u{f0a3}")
#let fa-rocket = fa("\u{f135}")

// Brand icons (optional, for links).
#let fa-github = fa("\u{f09b}", font: fa-brands-font)
#let fa-orcid = fa("\u{f8d2}", font: fa-brands-font)
#let fa-researchgate = fa("\u{f4f5}", font: fa-brands-font)
#let fa-google = fa("\u{f1a0}", font: fa-brands-font)
