% raèuna matricu A i vektor b za metodu kolokacije
% sa kubiènim B-splajnovima
% A i b definirani za rubni problem sa trivijalnim rubnim uvjetima

% t ... èvorovi B-splajnova
% x ... kolokacijske toèke
% L ... pokazivaè na funkciju L(x,y,y',y'') koja implementira
%       diferencijalni operator
% f ... pokazivaè na funkciju f(x) desne strane ODJ

% A ... matrica
% b ... vektor

function [A,b] = odj_kolokacija_kBs_Ab(t, x, L, f)

n = max(size(x))-1;

A = zeros(n+1,n+1);
b = zeros(n+1,1);

for i = 1:n+1
    
    for j = 1:n
        
        [y,dy,d2y] = deBoor_Cox2(x(i,1), t, 3, j);
        
        A(i,j) = L(x(i,1), y, dy, d2y);
    
    end

end

for i = 1:n+1
    b(i,1) = f(x(i,1));
end

A(1,1) = 1;
A(end,end) = 1;

end