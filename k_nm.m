function k = k_nm(n,m)
% Computes the number k_{n,m} for a given n and m.
%
% Reference:
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

if isscalar(m)
    k = 2:n;
    M = M_nk(n,k);
    k = min(k(m <= M));
else
    k = nan(size(m));
    ix = find( 0 <= m & m <= n*(n-1)/2 );
    for i = 1:length(ix)
        k(ix(i)) = k_nm(n,m(ix(i)));
    end
end

