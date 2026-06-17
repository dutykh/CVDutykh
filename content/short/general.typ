#import "../../themes/short.typ": *
#import "../../themes/icons.typ": *

= Personal Information

#card-row(
  card(fa-envelope, "emails", [
    #xlink("mailto:denys.dutykh@ku.ac.ae")[Professional] \
    #xlink("mailto:denys.dutykh@gmail.com")[Personal 1] \
    #xlink("mailto:denys.dutykh@crans.org")[Personal 2]
  ]),
  card(fa-location, "addresses", [
    #xlink("https://maps.app.goo.gl/aRM7Ted9wmdFCCub8")[Professional] \
    #xlink("https://maps.app.goo.gl/wZGbn2CkNChRHVhP7")[Personal 1] \
    #xlink("https://maps.app.goo.gl/8pBoSGJYpfhvSU8W8")[Personal 2]
  ]),
  card(fa-phone, "phones", [
    #xlink("tel:+97123124542")[Tel] \
    #xlink("tel:+971545509167")[Mobile 1] \
    #xlink("tel:+33652277253")[Mobile 2]
  ]),
)

#v(5mm)

#card-row(
  card(fa-link, "websites", [
    #xlink("https://denys-dutykh.com")[Home page] \
    #xlink("https://github.com/dutykh")[Public repos] \
    #xlink("https://researchgate.net/profile/Denys-Dutykh")[Research Gate] \
    #xlink("https://scholar.google.com/citations?user=cvOVca4AAAAJ")[Google Scholar] \
    ResearcherID R-8861-2019 \
    #xlink("https://orcid.org/0000-0001-5247-2788")[ORCID]
  ]),
  card-rows((
    (fa-cake, "birth date", [17/08/1982]),
    (fa-hospital, "birth place", [Pologui, Ukraine]),
    (fa-idcard, "citizenships", [French, Ukrainian]),
    (fa-car, "driving licence", [Category B (France, UAE)]),
    (fa-child, "family status", [married, two children]),
  )),
)
