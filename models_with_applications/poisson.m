
% matrica sustava
h = 0.05;
A = gallery('poisson',19);
A = (1/h)^2 * A;

% vektor desne strane
b = zeros(361,1);
b(181) = 10000;



x = zeros(19,1);
for i = 1:19
    x(i) = i*h;
end
y = x;

tol = 1e-8;
u0 = zeros(361,1);
maxit = 361;

% rješavanje sustava metodom konjugiranih gradijenata sa
% prekondicioniranjem (nekompletna faktorizacija Choleskog)
M = cholinc(A,'0');
[u_pcg, flag_pcg, relres_pcg, iter_pcg, resvec_pcg] = pcg(A,b,tol,maxit,M,M',u0);

% rješavanje sustava metodom konjugiranih gradijenata bez
% prekondicioniranja
[u_cg, flag_cg, relres_cg, iter_cg, resvec_cg] = pcg(A,b,tol,maxit,[],[],u0);

uvjetovanost_A = cond(full(A))
uvjetovanost_MA = cond(full(M'\A/M))
iter_pcg
iter_cg

relres_pcg = resvec_pcg / norm(b);
relres_cg = resvec_cg / norm(b);

x_os_cg = zeros(iter_cg+1,1);
for i = 1:iter_cg+1
    x_os_cg(i) = i-1;
end

x_os_pcg = zeros(iter_pcg+1,1);
for i = 1:iter_pcg+1
    x_os_pcg(i) = i-1;
end

figure(1)
semilogy(x_os_pcg, relres_pcg,'r');
hold on;
semilogy(x_os_cg, relres_cg,'g');
title('relativni reziduali pcg i cg');
grid on;
legend('relres pcg', 'relres cg');
xlabel('iter');
ylabel('relres');
hold off;

U = zeros(19,19);
for i = 1:19
    U(:,i) = u_cg((i-1)*19+1:(i-1)*19+19,1);
end

figure(2)
[X,Y] = meshgrid(x,y);
surf(x,y,U);
grid on;
