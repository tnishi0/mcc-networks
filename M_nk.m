function M = M_nk(n,k)
% Computes the value of the function M(n,k), as defined in the following paper:
%
%  T. Nishikawa, J. Sun, and A. E. Motter
%  Sensitive Dependence of Optimal Network Dynamics on Network Structure
%  Physical Review X 7, 041044 (2017)
%  DOI: 10.1103/PhysRevX.7.041044
%
% Copyright (c) 2017 Takashi Nishikawa

if ~isscalar(n)
    error('n must be a scalar')
end

M = nan(size(k));
ix = ( 1 <= k & k <= n );
k = k(ix);
ell = floor(n./k);
nr = n - k.*ell;
M(ix) = ell.*k.*(k-1)/2 + nr.*(nr-1)/2;
