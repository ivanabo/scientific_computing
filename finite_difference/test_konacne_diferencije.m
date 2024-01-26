
a = 0;
b = 1;

alpha = 0;
beta = 0;

q = @(x) 400;
g = @(x) -400*(cos(pi*x))^2 - 2*pi*pi*cos(2*pi*x);

x = zeros(11,1);
for i = 1:11
    x(i,1) = (i-1)*0.1;
end

[A, c] = odj_diferencije_Ac(q, g, a, b, alpha, beta, x);

u = A\c;

u = [0; u; 0];

y = @(x) exp(-20)/(1+exp(-20)) * exp(20*x) + 1/(1+exp(-20)) * exp(-20*x) - (cos(pi*x))^2;

fplot(y, [0 1], 'r');
hold on;
plot(x, u(2:12), 'g');
grid on;
xlabel('x');
ylabel('y(x)');
legend('graf funkcije y(x)','tocke u(i)','Location','South');
hold off;

yx = zeros(11,1);
for i = 1:11
    yx(i,1) = y(x(i));
end

maxerr = norm(u(2:12)-yx,'inf')