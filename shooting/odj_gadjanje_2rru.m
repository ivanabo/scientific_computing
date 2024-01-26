% implementira shooting metodu pomoæu RK-4 metode za sustave ODJ
% inicijalnog problema i koristi aproksimaciju \Delta F(s(i)) za F'(s(i)) u
% Newtonovim iteracijama
% f   ... pokazivaè na funkciju desne strane sustava ODJ
% a,b ... rubovi segmenta
% s0  ... poèetna aproksimacija inicijalnog uvjeta
% n   ... broj ekvidistantnih podintervala za inicijalni problem
% x   ... vektor duljine n+1 s vrijednostima x_i
% y   ... vektor duljine n+1 s vrijednostima y_i ~ y(x_i)
% s   ... inicijalni uvjet, rješenje jednadžbe F(s)=0
% i   ... broj iteracija u Newtonovoj metodi

function [x,y,s,i] = odj_gadjanje_2rru(f, a, b, alpha, beta, s0, n)

init = [alpha, s0]';
tol = 1e-11;
i = 1;

[~,y1] = odj_rk4v(f, a, b, init, n);

F = y1(1,end)-beta;
ds = sqrt(eps)*s0;

init = [alpha, s0+ds]';

[x,y2] = odj_rk4v(f, a, b, init, n);

dF = ( y2(1,end)-beta-F ) / ds;

s = s0 - F/dF;

while ( abs(F) > tol )
    
    i = i+1;
    s0 = s;
    
    init = [alpha, s0]';
    
    [~,y1] = odj_rk4v(f, a, b, init, n);

    F = y1(1,n+1)-beta;
    ds = sqrt(eps)*s0;
    
    init = [alpha, s0+ds]';
    
    [~,y2] = odj_rk4v(f, a, b, init, n);
    
    dF = (y2(1,end)-beta-F)/ds;
    
    s = s0 - F/dF;
    
    if (i==2000) 
        display('ne pronalazi nultoèku');
        break;
    end
        
end

y = y1;
end
    
    