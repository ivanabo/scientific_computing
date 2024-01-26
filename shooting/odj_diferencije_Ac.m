% raèuna matricu A i vektor c za metodu konaènih diferencija

% q, g ... pokazivaèi na odgovarajuæe funkcije
% a, b ... rubovi segmenta
% alpha beta ... rubni uvjeti
% x ... vektor koji sadrži rubove podsegmenata x_i

% A ... matrica
% c ... vektor

function [A, c] = odj_diferencije_Ac(q, g, a, b, alpha, beta, x)

n = max(size(x));
c = zeros(n,1);
d = zeros(n,1);
h = (b-a)/(n+1);

for i = 1:n
    d(i,1) = 2/(h*h) + q(x(i));
    c(i,1) = g(x(i));
end

c(1,1) = c(1,1) + alpha/(h*h);
c(end,1) = c(end,1) + beta/(h*h);

sd = -ones(n-1,1)/(h*h);

A = diag(d) + diag(sd,1) + diag(sd,-1);

end