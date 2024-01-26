function [y] = mdAx(x)

A = [2,0,0,0,-1,1,0;0,0.5,0,0,0,-1,1;0,0,35,0,-1,0,0;0,0,0,0.7,0,-1,0;0,0,0,0,1,0,-1;1,0,1,0,0,0,0;1,-1,0,-1,0,0,0;];

y = zeros(7,1);

for i = 1:7
    for j = 1:7
        if A(i,j) ~= 0
            y(i) = y(i) + A(i,j)*x(j);
        end
    end
end

end