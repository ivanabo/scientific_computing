% funkcija koja implementira funkciju desne strane ekvivalentnog sustava
% y'=f sa dvije ODJ sustavu
% y'' = (3/2)y^2
% y(0)=4, y(1)=1

function [z] = f_2rru_cil(x,y)

z = zeros(2,1);
z(1,1) = y(2,1);
z(2,1) = (-y(2,1)/x) - 0.3*exp(y(1,1));

end