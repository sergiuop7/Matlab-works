clear;clc
tau_m=0.025;% time delay given in seconds
H=tf(20,[1 0],'IOdelay',tau_m);
w=logspace(0,3);[m,f]=bode(H,w);mm(1,:)=m(1,1,:);ff(1,:)=f(1,1,:);
subplot(211)
semilogx([1 10 20 1e2 1e3],[26 6 0 -14 -34],'g','LineWidth',2);grid 
hold;
semilogx(w,20*log10(mm),'k');
legend('matlab characteristic','approximation by asymptotes');
title('Magnitude characteristic','FontSize',18);hold
subplot(212);
semilogx(w,ff,'g','LineWidth',2);hold;
wtm=1/tau_m;% frequency of interest fro time delay 
semilogx([0.25 0.5 1 2 4]*wtm,-90-180/pi*[0.25 0.5 1 2 4],'*k-')
semilogx([0.25 0.5 1 2 4]*wtm,-180/pi*[0.25 0.5 1 2 4],'ok-')
info={'$\omega=\frac{0.25}{\tau_m}$','$\omega=\frac{0.5}{\tau_m}$','$\omega=\frac{1}{\tau_m}$','$\omega=\frac{2}{\tau_m}$','$\omega=\frac{4}{\tau_m}$'}
text([0.25 0.5 1 2 4]*wtm,-57*[0.25 0.5 1 2 4]+15,info,'Color','k','interpreter','Latex','FontSize',16);
hold
legend('matlab characteristic','5 points approximation','-\tau_m\omega');
axis([1,1e3,-360,10]);grid
set(gca,'YTick',[-270,-180,-90,0]);shg