function y = mcc_inf(phi)
% Computes the limit of n -> infinity in Eq. (15) of the paper.

ell = floor(1./(1-phi));
y = (ell.^2 - sqrt(ell.^2 - phi.*ell.*(ell+1)))./(ell.*(ell+1));
