% Generates the adjacency matrices of a UCM network and an MCC network.
%
% Copyright (c) 2017 Takashi Nishikawa

% UCM network
k = 4; ell = 5;
[A,n,m] = ucm_network(k,ell);
mc = n*(n-1)/2 - m;
subplot(121)
spy(complement(A))
title(sprintf('Adjacency matrix of UCM network\nwith k = %d, ell = %d (mc = %d, lambda2 = %d)', k, ell, mc, n-k))

% MCC network
m = m - 1;
mc = n*(n-1)/2 - m;
[A, k, ell] = mcc_network(n,m);
subplot(122)
spy(complement(A))
title(sprintf('Adjacency matrix of MCC network\nwith n = %d, mc = %d (k = %d, ell = %d, lambda2 = %d)', n, mc, k, ell, n-k))
