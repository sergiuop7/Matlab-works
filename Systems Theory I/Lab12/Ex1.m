clear variables

   R=2;
   L=0.5;
   kt=0.1;
   km=0.1
   B=0.2;
   J=0.02;

   H1=tf(kt,[L R])
   H2=tf(1,[J B])
   Hr=km
   Hd=series(H1,H2)
   Hdes=series(Hd,km)
   H0=feedback(Hd,Hr)
   step(H0)

   [A,B2,C,D] = tf2ss(0.1, [0.01 0.14 0.4])
   step(A,B2,C,D); hold
   step(H0); hold
   legend('ss', 'tf')

   eig(A)
   zpk(H0)

   t=linspace(0, 25, 1e3);
   u=zeros(1, 1e3);
   Ci1=[0.1, 0.02];
   sys=ss(A,B2,C,D);
   [y,t,x] = lsim(sys,u,t,Ci1)
   plot(t,x(:,1)); hold on;
   plot(t,x(:,2)); hold on;
   plot(x(:,1), x(:,2));
   xlabel('Ia'), ylabel('w'); hold on

   %
    Hc = tf(60,[1,12])
    Hdes = series(Hc, H0)   
    %rlocus(Hdes)

    k=0.15;
    H02=feedback(k*Hdes,1);
    step(H0,H02);
    legend('H0','H02');
   
