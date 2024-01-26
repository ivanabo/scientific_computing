% TLS problem (dekonvolucija); vjezbe 2, slide 43

load('model_dekonvolucija_uy.mat');
load('model_dekonvolucija_hh.mat');

n = 18;
m = 102;

% generiranje vektora Y [dimenzije: (m+1) x 1]
Y = zeros(m+1,1);
for i = 1:m+1
    Y(i) = yp(i);
end

% generiranje matrice U [dimenzije: (m+1) x (n+1)]
U = zeros(m+1,n+1);
for i = 1:m+1
    for j = 1:n+1
        U(i,j) = up(n+1-j+i);
    end
end

% rješavanje TLS problema; T i D identitete
C = [U, Y];

    % svd dekompozicija matrice C
[U_c, sigma_c, V_c] = svd(C);
    
    % singularne vrijednosti matrice U
sigma_u = svd(U);

    % provjera uvjeta teorema
if sigma_u(n) > sigma_c(n+1)
    fprintf('pretpostavke teorema vrijede\n');
end

X = - V_c(1:n+1,n+2) / V_c(n+2,n+2);

plot(X, '-og');
hold on;
plot(hh,'-xr');
legend('izraèunato','egzaktno');
