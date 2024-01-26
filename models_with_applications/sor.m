function [x, br_iter, res] = sor(A, b, x0, tol, omega)

k = 1;
n = max(size(A));
res = zeros(n*n);
res(k) = norm(A*x0-b);

while ( res(k)/norm(b) ) > tol
    
    k = k+1;
    for i = 1:n
        
        x0(i) = (1-omega)*x0(i);
        pom = b(i);
        
        for j = 1:(i-1)
            pom = pom - A(i,j)*x0(j);
        end
        
        for j = (i+1):n
            pom = pom - A(i,j)*x0(j);
        end
        
        x0(i) = x0(i) + (pom*omega)/(A(i,i));
    end
    
    res(k) = norm(A*x0-b);
    
end

x = x0;
br_iter = k-1;
res = res(1:k);

end