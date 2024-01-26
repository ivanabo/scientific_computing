function [z] = f_2rru(x,y)

z = zeros(2,1);
z(1,1) = y(2,1);
z(2,1) = 3*y(1,1)*y(1,1)/2;

end
