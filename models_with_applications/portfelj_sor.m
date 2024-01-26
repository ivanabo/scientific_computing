function [omega_min_sor, omega_mp_sor, spr, omega, resx_sor, resy_sor] = portfelj_sor(C, m, mp)

n = max(size(C));
e = ones(n,1);
x0 = rand(n,1);
tol = 1e-8;

[spr, omega, omega_opt] = sor_konvergencija(C);


[x, br_iterx, resx_sor] = sor(C, m, x0, tol, omega_opt);

[y, br_itery, resy_sor] = sor(C, e, x0, tol, omega_opt);

x1 = e'*x;
m1 = m'*x;
y1 = e'*y;

omega_min_sor = y/y1;

omega_mp_sor = ( m1*y - x1*x + mp*(-x1*y+y1*x) ) / (y1*m1 - x1^2);

end