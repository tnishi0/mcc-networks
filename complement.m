function Ac = complement(A)
% Computes the adjacency matrix Ac of the complement of the network whose
% adjacency matrix is A.

Ac = 1 - eye(size(A)) - A;