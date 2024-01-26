mp = 0.05;

[omega_min_sor, omega_mp_sor, spr, omega, resx_sor, resy_sor] = portfelj_sor(C, m, mp);

[omega_min_pcg, omega_mp_pcg, relres_x, relres_y] = portfelj_pcg(C, m, mp);


subplot(3,1,1)
plot(omega, spr);
axis([0 2 0 1]);
title('spr(T_{SOR})');
xlabel('\omega');
ylabel('spr(T_{\omega})');

subplot(3,1,2)
semilogy(resx_sor,'r');
hold on;
semilogy(resy_sor,'b');

title('relativni reziduali SOR');
%xlabel('omega');
%ylabel('spr(T_{\omega}');
hold off;

subplot(3,1,3)
semilogy(relres_x,'r');
hold on;
semilogy(relres_y,'g');

title('relativni reziduali pcg');
%xlabel('omega');
%ylabel('spr(T_{\omega}');
hold off;