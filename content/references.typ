#import "../themes/common.typ": *

#let _refname(name, mail, disp) = [#strong[#name] \ #xlink("mailto:" + mail)[#disp]]

#let reftable(..rows) = table(
  columns: (auto, 1fr),
  stroke: (x: none, y: 0.5pt + rule-grey),
  inset: (x: 8pt, y: 7pt),
  align: (left + horizon, left + horizon),
  table.header(strong[#sc[Name] and #sc[E-mail]], strong[#sc[Address]]),
  ..rows.pos(),
)

= Academic references

#reftable(
  _refname([Alexey #sc[Cheviakov]], "shevyakov@math.usask.ca", [shevyakov\@math.usask.ca]),
  [University of Saskatchewan \ Department of Mathematics and Statistics \ Room 227 McLean Hall, 106 Wiggins Road \ Saskatoon, SK, S7N 5E6 Canada],
  _refname([Francesco #sc[Fedele]], "fedele@gatech.edu", [fedele\@gatech.edu]),
  [Georgia Institute of Technology \ College of Engineering \ School of Civil Environmental Engineering \ Mason Building 3140A, Atlanta, USA],
  _refname([Taras #sc[Lakoba]], "tlakoba@uvm.edu", [tlakoba\@uvm.edu]),
  [Department of Mathematics and Statistics \ College of Engineering and Math. Sciences \ The University of Vermont \ Burlington, Vermont, USA],
  _refname([Andrei #sc[Ludu]], "Andrei.Ludu@erau.edu", [Andrei.Ludu\@erau.edu]),
  [Mathematics Department \ Daytona College of Arts & Sciences \ Embry-Riddle Aeronautical University \ Daytona Beach, Florida, USA],
  _refname([Dimitrios #sc[Mitsotakis]], "dmitsot@gmail.com", [dmitsot\@gmail.com]),
  [Victoria University of Wellington \ School of Mathematics and Statistics \ PO Box 600 Wellington 6140 \ New Zealand],
)

== Supplementary academic references

#reftable(
  _refname([Leonid #sc[Chubarov]], "chubarov@ict.nsc.ru", [chubarov\@ict.nsc.ru]),
  [Institute of Computational Technologies \ Siberian Branch of the \ Russian Academy of Sciences \ Novosibirsk, Russia],
  _refname([Didier #sc[Clamond]], "didierc@unice.fr", [didierc\@unice.fr]),
  [Laboratoire J.-A. Dieudonné \ Univ. Côte d'Azur, Parc Valrose \ 06108 Nice Cedex 02 France],
  _refname([Olivier #sc[Goubet]], "Olivier.Goubet@univ-lille.fr", [Olivier.Goubet\@univ-lille.fr]),
  [Laboratoire Paul Painlevé \ Université de Lille \ Faculté des Sciences \ 33 Cité Scientifique \ 59655 Villeneuve d'Ascq Cedex],
  _refname([Gayaz #sc[Khakimzyanov]], "khak@ict.nsc.ru", [khak\@ict.nsc.ru]),
  [Institute of Computational Technologies \ Siberian Branchof the \ Russian Academy of Sciences \ Novosibirsk, Russia],
  _refname([Nathan #sc[Mendes]], "nathan.mendes@pucpr.br", [Nathan.Mendes\@pucpr.br]),
  [Thermal Systems Laboratory \ Pontifical Catholic University of Paraná \ Rua Imaculada Conceição, \ 1155, CEP: 80215-901 \ Curitiba #endash Paraná, Brazil],
  _refname([Paul #sc[Milewski]], "P.A.Milewski@bath.ac.uk", [P.A.Milewski\@bath.ac.uk]),
  [Dept. of Mathematical Sciences \ Univ. of Bath \ Bath, BA2 7JX UK],
)
