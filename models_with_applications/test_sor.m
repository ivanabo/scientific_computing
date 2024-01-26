

% testiranje funkcije koja implementria SOR metodu
 A = [16,-4,8,12; -4,4,-7,3; 8,-7,78,32; 12,3,32,113];
 b = [32,-4,111,160]';
 tol = 1e-5;
 omega1 = 1.2;
 x0 = rand(4,1);
 [x, br_iter, res] = sor(A, b, x0, tol, omega1);
 x % aproksimacija rješenja
 br_iter % broj iteracija potrebnih za tol toènost aproksimacije rješenja
 
 
 % sor konvergencija
 [spr, omega] = sor_konvergencija(A);
 
 plot(omega,spr);
 axis([0 2 0 1]); % odreðuje granicu plotanja [min_x max_x min_y max_y]
 
 [omega_opt, indeks] = min(spr); % nalazi miimalni spektralni radijus, 
 % vraæa najmanji spektralni radijus i njegov indeks u vektoru spr
 
 omega(indeks) % ispisuje optimalni omega