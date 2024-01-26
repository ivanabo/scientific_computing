% kreditni razred; vjezbe 2, slide 26

function [u] = kredit_raz(n)

load('model_kredit_A.mat');

x_os = 1:8;

u = zeros(8,1);
u(1) = 1;

%y = u / norm(u);

for i = 1:n
    %u = A*y;
    %y = u / norm(u);
    u = A*u;
    plot(x_os, u, '-*g');
    axis([0.5 8.5 0 1]);
    title(sprintf('iteracija br. %d', i));
    xlabel('stanje');
    ylabel('gustoæa');
    set(gca,'XTick',1:8);
    set(gca,'XTickLabel', {'AAA','AA','A','BBB','BB','B','CCC','D'});
    grid on;
    pause(0.2);
    
end

[U1,V1] = eig(A)

end