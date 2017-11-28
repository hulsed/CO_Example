This repository consists of a few examples of common multidisciplinary design optimization frameworks. It requires MATLAB's fmincon function.

The folder "Problem 1" contains collaborative optimization code for a simple example problem proposed in [1] (page 397). The basic statement of the problem is:

min 	(z1c-0.5)^2 + (z2c-0.5)^2
s.t. 	g1=1.0 - z1c<=0
		g2=1.0 - z2c<=0
		z1nc=(b1-2.4) + (bc-2.0) - 0.4*z2c
		z1c=(b1-2.4) + (bc-2.0) - 0.5*z2c
		z2nc=(b2-3.0) + (bc-2.0) - 0.6*z1c
		z2c=(b2-3.0) + (bc-2.0) - 0.7*z1c
wrt		b1, b2, bc 

In this problem the z1nc and z1c equality constraints are considered to be in subsystem 1, while z2nc and z2c equality constraints are considered to be in subsystem 2. While this problem could be solved using a simpler approach, it is used to show how collaborative optimization works.

The folder "Problem 2" contains three different approaches to solving a propane combustion problem. This problem is a part of the MDO test suite [2] [3] and is also described here [4] and here [5]. The three approaches shown are multidiscipline-feasible (MDF), individual discipline-feasible (IDF), and collaborative optimization (CO). In short, 
* in MDF, equalities are considered to be a part of the objective function, reducing the space of the problem
* in IDF, equalities are given directly to the optimizer
* in CO, disciplines are passed targets for system-level variables which are optimized by the subsystems given the subsystem constraints at each iteration
These are described in depth in [6] and elsewhere.


[1] Yi, Sang-Il, Jung-Kyu Shin, and G. J. Park. "Comparison of MDO methods with mathematical examples." Structural and Multidisciplinary Optimization 35.5 (2008): 391-402.
[2] Padula, Sharon L., Natalia Alexandrov, and Lawrence L. Green. "MDO test suite at NASA Langley Research Center." AIAA paper 96 (1996): 4028.
[3] Kodiyalam, Srinivas. "Evaluation of Methods for Multidisciplinary Design Optimization (MDO). Phase 1." (1998).
[4] https://www.aere.iastate.edu/bloebaum/ii-b-3-combustion-of-propane/
[5] http://www.eng.buffalo.edu/Research/MODEL/test_problem_5.html
[6] Martins, Joaquim RRA, and Andrew B. Lambe. "Multidisciplinary design optimization: a survey of architectures." AIAA journal (2013).