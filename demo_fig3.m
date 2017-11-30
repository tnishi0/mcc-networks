% Generates the plot for MCC networks in Fig. 3.
%
% Copyright (c) 2017 Takashi Nishikawa

clf
n = 20;
m1 = round(0.65*n*(n-1)/2);
m2 = n*(n-1)/2 - 1;
m = m1 : m2;
mc = n*(n-1)/2 - m;
phi = [2*m/(n*(n-1)), 1];
lambda2 = [n - k_nm(n,mc), n];
plot(phi, lambda2, '.-', 'Color', [255,165,0]/255)
title('Fig. 3')
xlabel('phi')
ylabel('lambda2')
xlim([0.65 1])
ylim([10 20])
