% sistem masa s elasticnim oprugama; vjezbe 2, slide 37

m = [2,5,3,6];
M = diag(m);
k = [10,9,8,7,6,5,5,5];
K = zeros(4,4);
K(1,2) = -k(2);
K(1,3) = -k(6);
K(2,3) = -k(3);
K(2,4) = -k(8);
K(3,4) = -k(4);
K = K + triu(K)';
K(1,1) = k(1)+k(2)+k(6);
K(2,2) = k(2)+k(3)+k(8);
K(3,3) = k(3)+k(4)+k(6)+k(7);
K(4,4) = k(4)+k(5)+k(8);

A = M^(1/2)\K/M^(1/2);

tol = 1e-8;
maxit = 4;

I = eye(4,4);
u0 = ones(4,1);
u = u0 / norm(u0);
rq = u'*A*u;
k = 1;
res(k) = norm(A*u-rq*u);
x_os = 1:4;
A = A-4*I;

figure(1)
while(1)

    x = minres(A, u, tol, maxit);
    u = x / norm(x);
    rq = u'*A*u;
    
    plot(x_os, u, '-xm');
    axis([0.5 4.5 -1 1]);
    title(sprintf('Aproksimacija svojstvenog vektora: iteracija br. %d', k));
    xlabel('Indeks komponente');
    ylabel('Komponenta');
    grid on;
    pause(0.5);

	k = k+1;
    res(k) = norm(A*u-rq*u);
    
	if res(k) < 1e-8
		break;
	end
    
end

figure(2)
semilogy(1:k, res(1:k), '-or');
grid on;
xlabel('Iteracija');
ylabel('Norma reziduala');
title('Graf normi reziduala');

u