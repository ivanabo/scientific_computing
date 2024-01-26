function [omega_min_pcg, omega_mp_pcg, relres_x_pcg, relres_y_pcg] = portfelj_pcg(C, m, mp)

n = max(size(C));
e = ones(n,1);
x0 = rand(n,1);
tol = 1e-8;

[x, flag, relres_x, iterx, resvec_x] = pcg(C,m,tol,[],[],[],x0);

[y, flag, relres_y, itery, resvec_y] = pcg(C,e,tol,[],[],[],x0);

relres_x_pcg = resvec_x / norm(m);
relres_y_pcg = resvec_y / norm(e);

x1 = e'*x;
m1 = m'*x;
y1 = e'*y;

omega_min_pcg = y/y1;

omega_mp_pcg = ( m1*y - x1*x + mp*(-x1*y+y1*x) ) / (y1*m1 - x1^2);

end