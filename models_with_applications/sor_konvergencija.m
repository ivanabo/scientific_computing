function [spr, omega, omega_opt] = sor_konvergencija(A)

[m,n] = size(A);
T = zeros(m,n);
D = diag(diag((A)));
L = tril(A,-1);
R = triu(A,1);
omega = zeros(200,1);
spr = zeros(200,1);

for i = 1:200
    
    omega(i) = i*0.01;
    T = (D+omega(i)*L)\((1-omega(i))*D-omega(i)*R);
    spr(i) = max(abs(eig(T)));
    
end

[omega_opt, indeks] = min(spr);

end