function [x,y] = odj_rk4v(f, a, b, y0, n)

h = (b-a) / n;
x(1) = a;
y(:,1) = y0;

for i = 1:n
    x(i+1) = a + i*h;
    
    k1 = f(x(i),y(:,i));
    k2 = f(x(i)+h/2,y(:,i)+h*k1/2);
    k3 = f(x(i)+h/2,y(:,i)+h*k2/2);
    k4 = f(x(i+1),y(:,i)+h*k3);    
    
    y(:,i+1) = y(:,i) + h*(k1+2*k2+2*k3+k4)/6;
end

end