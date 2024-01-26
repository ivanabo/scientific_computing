% distribucija temperature unutar cilindra :: shooting method

f = @f_2rru_cil;
a = 0.1;
b = 1;
alpha = 0;
beta = 0;

n = 10;

s0 = 1;
[x,y1,s1,New_iter_s1_apN] = odj_gadjanje_2rru(f,a,b,alpha,beta,s0,n);

plot(x,y1(1,:),'b');
grid on;
title('Distribucija topline unutar cilindra; gadjanje');
xlabel('x');
ylabel('y(x)');
legend('y1(x)','Location','Best');
