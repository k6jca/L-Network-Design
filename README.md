# L-Network-Design
Tools for the Design of L-Networks that can transform any complex impedance to any other complex impedance, as long as the real component of both impedances are positive.

The EXCEL file, "L-Network Design Spreadsheet 26Sept22.xlsx", will give all possible L-Networks (either series-parallel and/or parallel-series configurations) that transform a given complex load impedance (Zload = Rload + jXload) to a complex input impedance (Zin = Rin + jXin).  
Note that Zin is the impedance looking into the input port of an L-Network that is terminated with Zload.  It is not the source impedance.

The MATLAB script, "L_Network_Equation_Derivation_k6jca_V1.m", uses MATLAB's Symbolic Math Toolbox to derive the equations for an L-Network's shunt-component's susceptance (B) and its series-component's reactance (X).

Notes:
1.  The L-Network is assumed to be lossless.
2.  Rin and Rload cannot be negative.
