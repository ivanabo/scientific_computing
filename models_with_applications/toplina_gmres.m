% sustav disipacija topline

b = [0,0,-20,-20,-20,10,0]';
x0 = [1,1,1,1,1,1,1]';
tol = 1e-8;

[x, flag, relres, iter, resvec] = gmres(@mdAx, b, [], tol, [], [], [], x0);

semilogy(resvec/norm(b), '-xg');
xlabel('iter');
ylabel('relres');