% funkcija koja implementira funkciju desne strane u ODJ modela
% grabežljivac-plijen

function [DP] = grab_plijen_funkcija(t,p)

alpha1 = 2;
delta1 = 0.02;
alpha2 = 0.0002;
delta2 = 0.8;

DP = zeros(2,1);
DP(1,1) = alpha1*p(1,1)-delta1*p(1,1)*p(2,1);
DP(2,1) = alpha2*p(1,1)*p(2,1)-delta2*p(2,1);

end