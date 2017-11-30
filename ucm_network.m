function [A,n,m] = ucm_network(k,ell)
% Constructs the UCM network for given k and ell.
%
% Copyright (c) 2017 Takashi Nishikawa

n = k*ell;
m = k^2*ell*(ell-1)/2;
A = mcc_network(n,m);