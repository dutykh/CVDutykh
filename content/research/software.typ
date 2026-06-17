#import "../../themes/common.typ": *

#separator()

== Software development

#list([Public #raw("GitHub") repository, which contains most of the codes mentioned hereinbelow: #linebreak()
  #link("https://github.com/dutykh/")], [Responding to the need of a growing community of students and researchers who wants to get involved in the field of electrochemical storage systems, NEOLAB offers a new tool dedicated to a modeling domain where almost no open-source solutions exist. Physics-based models of batteries require extensive knowledge in thermodynamics, electro-chemistry, mathematics, material and computer sciences. Based on the idea that a minimum working example is the best way to learn gradually how to model a battery, NEOLAB provides a solution to simulate the behavior of the negative electrode of lead-acid batteries and a framework to investigate other primary and secondary technologies.

#list([#repo-link("https://github.com/dutykh/NEOLAB/")])

Useful reference:

#list([M. Cugnet, F. Gallois, A. Kirchev and #me. #emph[NEOLAB: A Scilab tool to simulate the Negative Electrode of Lead-Acid Batteries]. SoftwareX, #strong[22], 101394, 2023])])

#list([The following repository contains a Fourier-type pseudo-spectral solver for the Dysthe–Lo–Mei equation as described in Equations (2.6) – (2.9) in Lo & Mei (JFM, 1985) paper mentioned below. A very high order Runge–Kutta scheme is used for time integration with the adaptive time stepping. We employ also the integrating factor technique to slightly remove the stiffness of second order derivatives. The work of this code is illustrated on a simple evolution of the ground state to the low order underlying NLS equation.

#list([#repo-link("https://github.com/dutykh/DystheEq/")])

Useful references:

#list([E. Lo and C.C. Mei. #emph[A numerical study of water-wave modulation based on a higher-order nonlinear Schrödinger equation], J. Fluid Mech., #strong[150], 395–416, 1985], [F. Fedele and #me. #emph[Hamiltonian form and solitary waves of the spatial Dysthe equations]. JETP Letters, #strong[94]​(12), 921–925, 2011 #linebreak()
    #link("http://hal.archives-ouvertes.fr/hal-00633389/")], [F. Fedele and #me. #emph[Hamiltonian description and traveling waves of the spatial Dysthe equations], 2011 #linebreak()
  #link("http://hal.archives-ouvertes.fr/hal-00632862/")])])

#list([This Matlab code computes irrotational 2D periodic steady surface pure gravity waves of arbitrary length in arbitrary depth. The formulation is based on the so-called Babenko equation and pseudo-spectral discretization in the conformal domain. The resulting equation is solved using Petviashvili iteration method.

#list([#repo-link("https://github.com/dutykh/SSGW/")])

Useful reference:

#list([D. Clamond and #me. #emph[Accurate fast computation of steady two-dimensional surface gravity waves in arbitrary depth]. J. Fluid Mech., #strong[844], 491–518, 2018 #linebreak()
  #link("https://hal.archives-ouvertes.fr/hal-01465813/")])])

#list([This Matlab code solves the classical nonlinear sine-Gordon equation on graphs using a symplectic Euler scheme in time

#list([#repo-link("https://github.com/dutykh/sineGordonGraph/")])

Useful reference:

#list([#me and J.-G. Caputo. #emph[Discrete sine-Gordon dynamics on networks], Submitted, 2016 #linebreak()
  #link("https://hal.archives-ouvertes.fr/hal-01160840/")])])

#list([A simple Matlab code, which solves numerically 2D Navier–Stokes equations in vorticity formulation using a Fourier-type pseudo-spectral method

#list([#repo-link("https://github.com/dutykh/NavierStokes2D/")])])

#list([The present Matlab code is an implementation of the full Euler equations solver based on the method of conformal variables. The peculiarity here is that the solver works on general (but smooth) bottoms. The method is described in the reference given below. In a few words it is a Fourier-type pseudo-spectral solver. Standard Matlab time stepper is used to advance the solution in time. The solution is expected to be spectrally accurate

#list([#repo-link("https://github.com/dutykh/Euler_bottom/")])

Useful reference:

#list([C. Viotti, #me and F. Dias. #emph[The conformal-mapping method for surface gravity waves in the presence of variable bathymetry and mean current], Procedia IUTAM, #strong[11], 110–118, 2014 #linebreak()
    #link("http://hal.archives-ouvertes.fr/hal-00855780/")])])

#list([This function computes the steady irrotational surface solitary (classical and generalized) capillary-gravity wave solutions of the full Euler equations (homogeneous, incompressible and perfect fluids). The full Euler system is recast under the form of the Babenko equation using the conformal mapping technique. The wave is defined by its initial Froude and Bond numbers (Fr, Bo) and the result is about twelve digits accurate. The method works for all but the highest waves.

#list([#repo-link("https://github.com/dutykh/BabenkoCG/")])

Useful reference:

#list([#me, D. Clamond and A. Durán. #emph[Efficient computation of capillary-gravity generalized solitary waves], Wave Motion, #strong[65], 1–16, 2016 #linebreak()
  #link("https://hal.archives-ouvertes.fr/hal-01218989/")])])

#list([Fourier-type pseudo-spectral solver of the full Euler equations with the free surface on a fluid layer of infinite depth. The time-dependent fluid domain is transformed into a strip using the conformal mapping technique. Time discretization is done using the embedded Cash-Karp method of the order 5(4). The time integration is improved using the integrating factor technique (i.e. exact integration of linear terms). The solver is initialized to simulate the celebrated Peregrine breather evolution in the full Euler.

#list([#repo-link("https://github.com/dutykh/ConformalEulerDeepWater/")])])

#list([#raw("SerreGravityWave.m"): This Matlab script is a pseudo-spectral solver for the Serre-Green-Naghdi equations which model the propagation of long gravity waves. Here, for the sake of simplicity, we restrict our attention to the case of the flat bottom. The numerical scheme is described in the following publication:

#list([#me, D. Clamond, P. Milewski and D. Mitsotakis.
    #emph[Finite volume and pseudo-spectral schemes for the fully
    nonlinear 1D Serre equations], European Journal of Applied 
    Mathematics, #strong[24]​(5), 761–787, 2013 #linebreak()
    #link("http://hal.archives-ouvertes.fr/hal-00587994/")], [#repo-link("https://github.com/dutykh/SerreGravityWave/")])])

#list([#raw("sG\_solver.epd"): This script allows to solve numerically the sine-Gordon equation in a $Y$–junction geometry using the Finite Element Method (FEM). The scheme is of 2#up[nd] order in space and time. The implixit-explicit time stepping method is of the Crank–Nicolson type and it possesses excellent energy conservation properties.

#list([#repo-link("https://github.com/dutykh/sineGordon_FreeFem/")])])

#list([Participation in the #link("http://www.prace-ri.eu/")[PRACE] DECI-9 project “#emph[High-end computational modelling of wave energy converters]” (1#up[st] November 2012 - 31 December 2013). The final report is available at:

#list([Ch. Lalanne, A. Rafiee, #me, M. Lysaght, F. Dias. #emph[Enabling the UCD-SPH code on the Xeon Phi], 2014 #linebreak()
  #link("http://hal.archives-ouvertes.fr/hal-00927227/")])])

#list([#raw("SolitaryWave.m"): this script computes in ultra-fast way and potentially to the arbitrary accuracy the solitary waves to the full free-surface Euler equations. The method is based on the conformal map technique and the Petviashvili iteration. Some more technical details and numerical results can be found in the following papers:

#list([D. Clamond and #me. #emph[Fast accurate computation of the fully nonlinear solitary surface gravity waves]. Computers & Fluids, #strong[84], 35–38, 2013 #linebreak()
  #link("http://hal.archives-ouvertes.fr/hal-00759812/")], [#me and D. Clamond. #emph[Efficient computation of steady solitary gravity waves]. Wave Motion, #strong[51], 86–99, 2014 #linebreak()
  #link("http://hal.archives-ouvertes.fr/hal-00786077/")], [#repo-link("https://github.com/dutykh/BabenkoSolitaryWave/")])

#link("www.mathworks.com/matlabcentral/fileexchange/39189-solitary-water-wave/")])

#list([#raw("OkadaSol.m"): this script computes co-seismic displacements according to the classical Okada solution. For more details you can have a look at the original Okada (1985) paper or this freely available my publication:

#list([#me, F. Dias, #emph[Water waves generated by a moving bottom]. In Book:"Tsunami and Nonlinear Waves", Kundu, A. (Editor), Springer Verlag 2007, Approx. 325 p., 170 illus., Hardcover, ISBN: 978-3-540-71255-8 #linebreak()
    #link("http://hal.archives-ouvertes.fr/hal-00115875/")], [#repo-link("https://github.com/dutykh/Okada/")])

#link("http://www.mathworks.com/matlabcentral/fileexchange/39819")])

#list([#strong[VOLNA]: a finite volume code on triangular unstructured meshes for the simulation of the generation, propagation and runup of tsunami waves. Developed in collaboration with Raphaël #sc[Poncet] and Frédéric #sc[Dias]. Currently this code is maintained by Irish Centre for High-End Computing (#link("http://www.ichec.ie/")[ICHEC]) and School of Mathematical Sciences, University College Dublin. The code is described and validation tests are given in this article:

#list([#me, R. Poncet, F. Dias. #emph[The VOLNA code for the numerical modelling of tsunami waves: generation, propagation and inundation]. European Journal of Mechanics B/Fluids, #strong[30]​(6), 598–615, 2011 #linebreak()
  #link("http://hal.archives-ouvertes.fr/hal-00454591/")])])

#separator()

=== Water waves, fluid dynamics & nonlinear systems

#list(
  [#strong[1DWaveTank] — a numerical wave tank for long-wave models (dispersive and non-dispersive) built on the finite-volume method, designed to test various models and schemes #linebreak()
  #repo-link("https://github.com/dutykh/1DWaveTank/")],
  [#strong[FlowReconstruct] — potential-flow reconstruction from Dirichlet data with periodic boundary conditions #linebreak()
  #repo-link("https://github.com/dutykh/FlowReconstruct/")],
  [#strong[Babenko-EHD] — an electro-hydrodynamic version of the Babenko equation — manuscript and accompanying codes, shared for reproducibility #linebreak()
  #repo-link("https://github.com/dutykh/Babenko-EHD/")],
  [#strong[SerreCyl] — supplementary materials for our manuscript on long-wave weakly-dispersive models for blood flows #linebreak()
  #repo-link("https://github.com/dutykh/SerreCyl/")],
  [#strong[TsunamiTutorial] — companion repository to our tsunami modelling paper in #emph[Geosciences] #linebreak()
  #repo-link("https://github.com/dutykh/TsunamiTutorial/")],
  [#strong[LorenzUPOs] — computation of unstable periodic orbits (UPOs) for the Lorenz system #linebreak()
  #repo-link("https://github.com/dutykh/LorenzUPOs/")],
  [#strong[markov-etat] — scripts accompanying our work with L. Vuillon on the Markov–Frobenius uniqueness conjecture #linebreak()
  #repo-link("https://github.com/dutykh/markov-etat/")],
)

#separator()

=== Black-hole physics & quasi-normal modes

#list(
  [#strong[qnm-analyser] — an online tool to chase quasi-normal modes in gravitational physics #linebreak()
  #repo-link("https://github.com/dutykh/qnm-analyser/")],
  [#strong[qm-qnms] — spectral method for eigenvalue problems — codes behind our manuscript “Spectral Method for Eigenvalue Problems” #linebreak()
  #repo-link("https://github.com/dutykh/qm-qnms/")],
  [#strong[ASafeGravity] — codes and materials for our papers on quasi-normal modes of black holes in asymptotically-safe gravity #linebreak()
  #repo-link("https://github.com/dutykh/ASafeGravity/")],
  [#strong[KS-quantum] — data and codes for quasi-normal modes of the Kazakov–Solodukhin quantum-corrected black hole #linebreak()
  #repo-link("https://github.com/dutykh/KS-quantum/")],
  [#strong[massless-SdS] — quasi-normal modes of massless (scalar, electromagnetic, gravitational) perturbations of the non-extreme Schwarzschild–de Sitter metric #linebreak()
  #repo-link("https://github.com/dutykh/massless-SdS/")],
  [#strong[massive-scalar] — massive scalar perturbations of the Schwarzschild solution #linebreak()
  #repo-link("https://github.com/dutykh/massive-scalar/")],
  [#strong[GaussBonnet] — analysis of Schwarzschild–Tangherlini and Gauss–Bonnet black holes #linebreak()
  #repo-link("https://github.com/dutykh/GaussBonnet/")],
  [#strong[noncommschwarzschild] — quasi-normal modes of a non-commutative model for Schwarzschild black holes #linebreak()
  #repo-link("https://github.com/dutykh/noncommschwarzschild/")],
  [#strong[dirtybh] — quasi-normal modes of noncommutative dirty black holes #linebreak()
  #repo-link("https://github.com/dutykh/dirtybh/")],
  [#strong[morristhorne] — quasi-normal modes of Morris–Thorne wormholes #linebreak()
  #repo-link("https://github.com/dutykh/morristhorne/")],
  [#strong[EllisBronnikov] — quasi-normal modes of Ellis–Bronnikov wormholes via the spectral method #linebreak()
  #repo-link("https://github.com/dutykh/EllisBronnikov/")],
  [#strong[ncwh] — quasi-normal modes of noncommutative wormholes #linebreak()
  #repo-link("https://github.com/dutykh/ncwh/")],
  [#strong[LeeWick] — quasi-normal modes of Lee–Wick black holes #linebreak()
  #repo-link("https://github.com/dutykh/LeeWick/")],
)
