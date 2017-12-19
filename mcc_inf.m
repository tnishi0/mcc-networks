function y = mcc_inf(phi)
% Computes the limit of n -> infinity in Eq. (15) of the paper.
%
% Reference:
%
%  T. Nishikawa, J. Sun, and A. E. Motter
%  Sensitive Dependence of Optimal Network Dynamics on Network Structure
%  Physical Review X 7, 041044 (2017)
%  DOI: 10.1103/PhysRevX.7.041044
%
% Copyright (c) 2017 Takashi Nishikawa

ell = floor(1./(1-phi));
y = (ell.^2 - sqrt(ell.^2 - phi.*ell.*(ell+1)))./(ell.*(ell+1));
