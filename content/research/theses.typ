#import "../../themes/common.typ": *

#separator()

== Theses

=== Habilitation thesis

#strong[Habilitation à Diriger des Recherches] in Applied Mathematics#linebreak()

#table(columns: 2, stroke: none, align: (right + top, left + top), inset: (x: 5pt, y: 2.5pt), [#sc[Title:]], [“#emph[Mathematical modeling in the Environment]”], [#sc[Advisor:]], [Didier #sc[Bresch] (DR CNRS, University of Savoie)], [#sc[Manuscript:]], [#link("http://tel.archives-ouvertes.fr/tel-00542937/")])

#linebreak()
#strong[Habilitation was defended on 3rd December 2010 at the University of Savoie after a review by]:

#list([Benoît #sc[Desjardins] (Associated Professor, ENS Ulm),], [Florian #sc[De Vuyst] (Professor, ENS de Cachan),], [Christian #sc[Kharif] (Professor, École Centrale de Marseille),], [Paul #sc[Milewski] (Professor, University of Wisconsin, Madison)])

#strong[Committee composition]:#linebreak()

#table(columns: 3, stroke: none, align: (right + top, left + top, left + top), inset: (x: 5pt, y: 2.5pt), [Didier #sc[Bresch]], [DR CNRS, Univ. Savoie], [Examinator], [Thierry #sc[Colin]], [Professor, Univ. Bordeaux], [President], [Benoît #sc[Desjardins]], [Associated Professor, ENS Ulm], [Referee], [Florian #sc[De Vuyst]], [Professor, ENS de Cachan], [Referee], [Frédéric #sc[Dias]], [Professor, Univ. College Dublin], [Examinator], [Christian #sc[Kharif]], [Professor, Centrale Marseille], [Referee], [David #sc[Lannes]], [DR CNRS, ENS Ulm], [Examinator], [Paul #sc[Milewski]], [Professor, Univ. Wisconsin], [Referee])

#linebreak()
#strong[Abstract.] The present manuscript is devoted to the mathematical modelling of several environmental problems ranging from water waves to powder-snow avalanches. This Habilitation is organized globally in three parts. The first part is essentially introductive and also contains a complete description of my scientific activities.

Scientific works dealing with water waves are regrouped in Part II. The spectrum of covered topics is large. We start by proposing in Chapter 3 a generalized Lagrangian for the water wave problem. This generalization allows for easy and flexible derivation of approximate models in shallow, deep and intermediate waters. Some questions of viscous wave damping are also investigated in the same chapter. Chapter 4 is entirely devoted to various aspects of tsunami wave modelling. We investigate the complete range of physical processes from generation through energy transformations and propagation up to the run-up onto coasts. The next Chapter 5 is devoted specifically to the numerical simulation and mathematical modelling of the inundation phenomena. This question is studied using various approaches: Nonlinear Shallow Water Equations (NSWE) solved analytically and numerically, Boussinesq-type systems, and two-fluid Navier-Stokes equations.

In Part III, we investigate two important questions belonging to the field of multi-fluid flows. Chapter 6 is essentially devoted to the formal justification of the single-velocity two-phase model proposed earlier for aerated flow modelling. Several numerical results are presented as well. Moreover, similar analytical computations performed in a simpler barotropic setting are provided in Appendix A. These results could apply, for example, to the simulation of violent wave breaking.

Finally, in Chapter 7, we propose a novel model for powder-snow avalanche flows. This system is derived from classical bi-fluid Navier-Stokes equations and has several nice properties. Numerical simulations of the avalanche interaction with obstacles are also presented.

#strong[Keywords]: free surface flows, variational methods, finite volumes, dispersive waves, runup, two-phase flows, snow avalanches

#separator()

=== PhD thesis

#strong[PhD degree from École Normale Supérieure de Cachan in Applied Mathematics]

#table(columns: 2, stroke: none, align: (right + top, left + top), inset: (x: 5pt, y: 2.5pt), [#sc[Title]:], [“#emph[Mathematical modeling of tsunami waves]”], [#sc[Advisor]:], [Frédéric #sc[Dias] (Professor, ENS de Cachan)], [#sc[Manuscript:]], [#link("http://tel.archives-ouvertes.fr/tel-00194763/")])

#strong[Dissertation defended on 3rd December 2007 at École Normale Supérieure de Cachan after a review by]:

#list([Jean-Claude #sc[Saut] (Professor, University Paris-Sud, Orsay),], [Didier #sc[Bresch] (DR CNRS, University of Savoie),])

#strong[Committee composition]:

#table(columns: 3, stroke: none, align: (right + top, left + top, left + top), inset: (x: 5pt, y: 2.5pt), [Jean-Michel #sc[Ghidaglia]], [Professor, ENS de Cachan], [Examinator], [Jean-Claude #sc[Saut]], [Professor, Paris-Sud], [Referee & President], [Didier #sc[Bresch]], [DR CNRS, University of Savoie], [Referee], [Costas #sc[Synolakis]], [Professor, USC], [Examinator], [Vassilios #sc[Dougalis]], [Professor, University of Athens], [Examinator], [Daniel #sc[Bouche]], [HDR, CEA/DAM IdF], [Invited member], [Frédéric #sc[Dias]], [Professor, ENS de Cachan], [Advisor])

USC = University of Southern California

#strong[Abstract.] This thesis is devoted to tsunami wave modelling. The life of tsunami waves can be conditionally divided into three parts: generation, propagation and inundation (or run-up). In the first part of the manuscript, we consider the generation process of such extreme waves. We examine various existing approaches to its modelling. Then, we propose a few alternatives. The main conclusion is that the seismology/hydrodynamics coupling is poorly understood at the present time.

The second chapter essentially deals with Boussinesq equations, which are often used to model tsunami propagation and sometimes even run-up. More precisely, we discuss the importance, nature and inclusion of dissipative effects in long-wave models.

In the third chapter, we slightly change the subject and turn to two-phase flows. The main purpose of this chapter is to propose an operational and simple set of equations in order to model wave impacts on coastal structures. Another important application includes wave sloshing in liquified natural gas carriers. Then, we discuss the numerical discretization of governing equations in the finite volume framework on unstructured meshes.

Finally, this thesis deals with a topic which should be present in any textbook on hydrodynamics, but it is not. We mean visco-potential flows. We propose a novel and sufficiently simple approach for weakly viscous flow modelling. We succeeded in keeping the simplicity of the classical potential flow formulation with the addition of viscous effects. In the case of finite depth, we derive a correction term due to the presence of the bottom boundary layer. This term is nonlocal in time. Hence, the bottom boundary layer introduces a memory effect to the governing equations.

#strong[Keywords]: Water waves, tsunami generation, Boussinesq equations, two-phase flows, visco-potential flows, finite volumes
