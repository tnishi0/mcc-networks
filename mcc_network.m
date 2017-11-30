function [A, k, ell] = mcc_network(n,m)
% Constructs an MCC network for given n and m.
%
%   [A, k] = MCC_NETWORK(n,m) constructs the unique network used for
%   the computation of the bound for a given number of nodes (n) and a
%   given number of links (m). It returns the associated adjacency matrix A
%   and the maximum size k of the cliques that was constructed in the
%   complement graph (which is also the maximum connected component size in
%   the complement).
%
% Copyright (c) 2017 Takashi Nishikawa

ell = nan;
m_min = n - 1;
m_max = n*(n-1)/2;

% The case of a complete graph.
if m == m_max
    A = ones(n) - eye(n);
    k = 1;
    return
end

if m < m_min || m > m_max
    error( ...
        'The number of links must be in [n-1, n*(n-1)/2] = [%d,%d]', ...
        m_min, m_max)
end

% The number of links in the complement graph.
mc = n*(n-1)/2 - m;

% The size of cliques to be constructed in the complement graph.
k = k_nm(n,mc);
ell = floor(n/k);

% Build the complement graph.
Ac = build_network(n,k,mc);

% Take the complement.
A = 1 - eye(n) - Ac;


function A = build_network(n,k,mc)
% Build a network consisting of k-cliques (+ residual links), where mc is
% the number of links.  (This will actually be the complement of what we
% want.)
A = zeros(n);

% Form as many isolated k-cliques as possible.
i = 1;
while i + k - 1 <= n && mc >= k*(k-1)/2
    A(i:i+k-1,i:i+k-1) = 1 - eye(k);
    i = i + k;
    mc = mc - k*(k-1)/2;
end

% Size of subgraph to fill in
nr = n - i + 1;

% Put the remainig mc links in randomly. [** Note - 1/3/2012 **] This
% prevents the algorithm from being deterministic and creates some
% ambiguity in the computed bound.  Try to fix this problem later.
if mc > 0
    
    % Compute the minimum size of isolated cliques that can be formed using
    % the remaining nr nodes and mc links (without any leftover links).
    k2 = k_nm(nr,mc);
    
    % Generate the subgraph for the remaining part Ar (with nr nodes).
    if mc < k2*(k2 - 1)/2
        % In this case, there is only a single, partial cliques, and it
        % must be possible to form a complete clique of size nr-1 with some
        % leftover links. Form one, and the way in which the remaining
        % links are placed will **NOT** affect the Laplacian spectrum (or
        % any graph invariants for that matter) since all choices will lead
        % to graphs that are isomorphic to each other. So place them
        % ARBITRARILY.
        mc = mc - (k2-1)*(k2-2)/2;
        v = [ones(mc,1); zeros(k2-mc-1,1)];
        A(i:i+k2-1,i:i+k2-1) = [
            1 - eye(k2-1), v
            v', 0];
    else
        % Otherwise, recursively apply the algorithm.
        A(i:i+nr-1,i:i+nr-1) = build_network(nr,k2,mc);
    end
    
end