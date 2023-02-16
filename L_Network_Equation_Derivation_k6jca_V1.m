% *****
% L_Network_Equation_Derivation_k6jca_V1
%
% Symbolic Math derivation of L network equations when 
% Zin (looking into the L-Network) is defined to be a
% complex impedance rather than an impedance that is 
% resistive only, with no reactance.
%
% Inspired by the MATLAB solution by Dick Benson, W1QG.
% See "RF Impedance Matching Application" at:
% https://www.mathworks.com/matlabcentral/profile/authors/6564033
%
% k6jca
% *****

clear; close; clc;

% Define the symbols in the equations.  Note:
% B is the susceptance of the L-Network shunt component.
% X is the reactance of the L-Network series component.
% Rld and Xld are the resistance and reactance of the load.
syms B X Rin Xin Rld Xld real

% *****
% Derive the Series-Parallel L-Network Equations
%
% Start by defining the equation for Zin given the
% Series-Parallel L-Network teminated with Zld = Rld+jXld:
fprintf('\nSeries-Parallel L-Network:\n')
Zin = 1i*X + 1/(1i*B + 1/(Rld + 1i*Xld))

% Next, solve the equation for B and X, given Zin = Rin + jXin
S_SP = solve(Zin==Rin+1i*Xin,[B,X],'ReturnConditions',true);

% Then, use 'simplify()' to simplify the resulting equations
series_par_B  = simplify(S_SP.B,'Steps',50);
series_par_X  = simplify(S_SP.X,'Steps',50);

% Finally, print the Series-Parallel X, B equation-pairs
fprintf('\nFirst Series-Parallel X, B pair:\n')
series_par_X1 = series_par_X(1,1)
series_par_B1 = series_par_B(1,1)
fprintf('\nSecond Series-Parallel X, B pair:\n')
series_par_X2 = series_par_X(2,1)
series_par_B2 = series_par_B(2,1)

% *****
% Derive the Parallel-Series L-Network Equations
%
% Start by defining the equation for Zin given the
% Parallel-Series L-Network teminated with Zld = Rld+jXld:
fprintf('\n\n\nParallel-Series L-Network:\n')
Zin = 1/(1i*B + 1/(Rld + 1i*Xld + 1i*X))

% Next, solve the equation for B and X, given Zin = Rin + jXin
S_PS = solve(Zin==Rin+1i*Xin,[B,X],'ReturnConditions',true);

% Then, use 'simplify()' to simplify the resulting equations
par_series_B  = simplify(S_PS.B,'Steps',50);
par_series_X  = simplify(S_PS.X,'Steps',50);

% Finally, print the Parallel-Series B, X equation-pairs
fprintf('\nFirst Parallel-Series B, X pair:\n')
par_series_B1 = par_series_B(1,1)
par_series_X1 = par_series_X(1,1)
fprintf('\nSecond Parallel-Series B, X pair:\n')
par_series_B2 = par_series_B(2,1)
par_series_X2 = par_series_X(2,1)

