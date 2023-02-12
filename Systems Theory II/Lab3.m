clear;clc

% approximations for magnitude
wma=[1 10 20 70 100 1e3];
ma=[-5 -5 -5 6 6 6];
% approximationsfor phase
wfa=[1 2 7 20 70 200 700 1e3];
fa=[0 5 15 30 25 15 5 0];
% plotting the approximations
subplot(211);
semilogx(wma,ma,'ro-');grid
title('Magnitude characteristics');
xlabel('\omega (rad/sec)'); ylabel('|H(j\omega)|^dB');
subplot(212);semilogx(wfa,fa,'ro-');grid;shg;
title('Phase characteristics'); ylabel('\angleH(j\omega) (degres)');
% comparison with Bode in Matlab
h=tf(2*[1 20],[1 70]);
w=logspace(0,3,1e2);
[m,f]=bode(h, w);
mv(1:1e2,1)=m(:,:,:);fv(1:1e2,1)=f(:,:,:);
subplot(211);semilogx(w,20*log10(mv),'b',wma,ma,'ro-');grid
title('Magnitude characteristics');
xlabel('\omega (rad/sec)');ylabel('|H(j\omega)|^dB');
subplot(212);semilogx(w,fv,'b',wfa,fa,'ro-');grid;shg;
title('Phase characteristics');
xlabel('\omega (rad/sec)'); ylabel('\angleH(j\omega) (degres)');