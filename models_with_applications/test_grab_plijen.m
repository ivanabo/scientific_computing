% model grabežljivca i plijena
clear
clc

p0(1,1) = 5000;
p0(2,1) = 100;

a = 0;
b = 30;

n = 300;
tol = 1e-2;

[x4,y4] = odj_rk4v(@grab_plijen_funkcija, a, b, p0, n);

[x23,y23,n] = odj_rk23v(@grab_plijen_funkcija,a,b,p0,tol);


subplot(2,1,1)
plot(x4,y4(1,:),'r',x23,y23(1,:),'g');
title('Graf rješenja za plijen');
legend('rk4','rk23','Location','Best');
grid on;
xlabel('vrijeme');
ylabel('broj jedinki');


subplot(2,1,2)
plot(x4,y4(2,:),'r',x23,y23(2,:),'g');
title('Graf rješenja za grabežljivce');
legend('rk4','rk23','Location','Best');
grid on;
xlabel('vrijeme');
ylabel('broj jedinki');