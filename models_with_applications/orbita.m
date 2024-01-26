D = load('model_orbita_polozaji.mat');

P = [D.p1(1),D.p1(2);D.p2(1),D.p2(2);D.p3(1),D.p3(2);D.p4(1),D.p4(2);D.p5(1),D.p5(2)];

A = ones(5,5);
b = ones(5,1);

for i = 1:5
    A(i,1) = P(i,1)*P(i,2);
    A(i,2) = P(i,2)*P(i,2);
    A(i,3) = P(i,1);
    A(i,4) = P(i,2);
    b(i) = -P(i,1)*P(i,1);
end

%[spr,omega,omega_opt] = sor_konvergencija(A);
%plot(omega,spr);
%axis([0 200]);

x0 = ones(5,1);
tol = 1e-8;

[a,flag,relres,iter,resvec] = gmres(A,b,[],tol,[],[],[],x0);

f = @(x,y) x.^2 + a(1)*x.*y + a(2)*y.^2 + a(3)*x + a(4)*y + a(5);

x = -5:0.1:5;
y = x;
figure(1)
[X,Y] = meshgrid(x,y);
Z = f(X,Y);
contour(x,y,Z,[0 0],'b');
grid on;

figure(2)
surfc(x,y,Z);