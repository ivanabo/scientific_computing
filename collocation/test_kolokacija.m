% pomoæu metode kolokacije sa kubiènim B-splajnovima riješite 
% sljedeæi rubni problem
% -y'' + 400*y = -400*cos^2(pi*x)-2*pi^2*cos(2*pi*x)
% y(0) = y(1) = 0
% rubovi podintervala zadani sa s_i = 0.1*i, za i = 0,1,...,10
% kolokacijske toèke su x_i = i/12, za i = 1,...,11
% izraèunati A i b pomoæu funkcije odj_kolokacija_kBs_Ab()
% riješiti sustav Ax=b, pri èemu je alpha = A^-1 b

n = 10;
s = zeros(n+1,1);
x = zeros(n+1,1);

for i = 1:11
    s(i,1) = (i-1)*0.1;
    x(i,1) = i/12;
end

t = [0;0;0;s;1;1;1];

[A, b] = odj_kolokacija_kBs_Ab(t, x, @L, @f);

alpha = A\b;
alpha = [0; alpha; 0];

for i = 1:n+1
    if ( x(i,1) > t(3,1) )
        start = i;
        break;
    end
end

v = @(x) deBoor(x, t, 3, alpha);

y = @(x) (exp(-20)/(1+exp(-20))) * exp(20*x) + (1/(1+exp(-20))) * exp(-20*x) - (cos(pi*x))^2;

fplot(y, [0 1], 'r');
hold on;
fplot(v, [0 1], 'b');