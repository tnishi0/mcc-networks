function [A,n,m] = ucm_network(k,ell)
% Constructs the UCM network for given k and ell.
%
% Reference:
%
%  T. Nishikawa, J. Sun, and A. E. Motter
%  Sensitive Dependence of Optimal Network Dynamics on Network Structure
%  Physical Review X 7, 041044 (2017)
%  DOI: 10.1103/PhysRevX.7.041044
%
% Copyright (c) 2017 Takashi Nishikawa

n = k*ell;
m = k^2*ell*(ell-1)/2;
A = mcc_network(n,m);
