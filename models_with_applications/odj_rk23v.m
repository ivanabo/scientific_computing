function [x,y,n] = odj_rk23v(f,a,b,y0,tol)

% koeficijenti
a21 = 1/4; 
a31 = -189/800; a32 = 729/800;
a41 = 214/891; a42 = 1/33; a43 = 650/891;
c1 = 0; c2 = a21; c3 = a31+a32; c4 = a41+a42+a43;
w1 = a41; w2 = a42; w3 = a43;
w1c = 533/2106; w2c = 0; w3c = 800/1053; w4c = -1/78;

% poèetni korak
h = b-a;

% inicijalni uvjeti
x(1) = a;
y(:,1) = y0;
y2(:,1) = y0;
n = 1;
flag = 0;

while (x(n) < b) && (flag ~= 1)
    
    % provjera jesmo prešli desnu stranu b
    if (x(n)+h > b) % ako je korak prevelik
        h = b-x(n); % uzmi manji korak
        flag = 1; % oznaèi da smo na kraju
    end
    
    k1 = f(x(n), y2(:,n));
    k2 = f(x(n)+c2*h, y2(:,n)+h*a21*k1);
    k3 = f(x(n)+c3*h, y2(:,n)+h*(a31*k1+a32*k2));
    
    fi = w1*k1+w2*k2+w3*k3; % phi
    y2(:,n+1) = y2(:,n) + h*fi; % aproksimacija reda 2
    
    k4 = f(x(n)+c4*h, y2(:,n+1));
    
    fic = w1c*k1+w2c*k2+w3c*k3+w4c*k4; % phi crta
    y3 = y2(:,n) + h*fic; % toèka za željenu aproksimaciju
    
    err = norm(y3-y2(:,n+1),'inf'); % greška
    
    if ( err <= tol ) % provjera je li greška manja od epsilon
        % DA ->
        if (flag ~= 1)
            n = n+1; % poveæaj korak
            y(:,n) = y3; % spremi izraèunatu aproks. u izlazni
            x(n) = x(n-1) + h; % pomakni se za korak
            hs = h;
            h = 0.9*hs*((tol/err)^(1/3)); % novi korak
        else
            x(n+1) = b;
            y(:,n+1) = y3;
            n = n+1;
            break
        end
    else % nije zadovoljen uvjet na grešku
        hs = h;
        h = 0.9*hs*((tol/err)^(1/3)); % ponovi sve s novim korakom
    end
end

end