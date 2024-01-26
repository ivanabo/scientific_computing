% raèunanje gustoæe podzemnih stijena; vjezbe 2, slide 52

load('model_gravitacija_g.mat');

m = 15;
n = 15;
s = 0:1/(m-1):1;
t = 0:1/(n-1):1;
ksi = 0.1;
d = 0.25;

k = zeros(15,15);
for i = 1:15
    for j = 1:15
        k(i,j) = d / (d^2 + (s(i)-t(j))^2)^(3/2);
    end
end

for i = 1:15
    for j = 1:15
        if i==1 || i==15
            K(i,j) = k(i,j)/(2*(n-1));
        else
            K(i,j) = k(i,j)/(n-1);
        end
    end
end

figure(1)
[U, sigma, V] = svd(K);
plot(1:15, diag(sigma), 'o');
title('singularne vrijednosti matrice $\bar{K}$','Interpreter','latex');

figure(2)
fplot('sin(pi*x) + 0.5*sin(2*pi*x)', [0 1], 'r--');
hold on;
for p = 1:15
    ar(:,p) = V(:,1:p) * inv(sigma(1:p,1:p)) * U(:,1:p)' * g;
    plot(s,ar(:,p)');
    hold on;
    grid on;
    pause
end


