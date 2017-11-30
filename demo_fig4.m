% Generates the plots for MCC networks in Fig. 4.
%
% Copyright (c) 2017 Takashi Nishikawa

clf
n = 50;
m1 = n-1;
m2 = n*(n-1)/2 - 1;
m = m1 : m2;
mc = n*(n-1)/2 - m;
phi = [2*m/(n*(n-1)), 1];
lambda2 = [n - k_nm(n,mc), n];
plot(phi, lambda2/n - phi, '-', 'Color', [255,165,0]/255)
hold on
phi = linspace(0,1,1000);
lambda2 = mcc_inf(phi)*n;
plot(phi, lambda2/n - phi, 'r-')
hold off
title('Fig. 4')
xlabel('phi')
ylabel('lambda2/n - phi')
ylim([-0.2 0.02])
legend('MCC (n = 50)', 'MCC (n = infinity)', 'Location', 'southeast')