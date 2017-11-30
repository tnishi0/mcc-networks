function Ac = complement(A)
% Computes the adjacency matrix Ac of the complement of the network whose
% adjacency matrix is A.
%
% Copyright (c) 2017 Takashi Nishikawa

Ac = 1 - eye(size(A)) - A;