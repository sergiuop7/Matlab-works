clc;
clear variables;
Ms=300;
Ks=2800;
Bs=2000;
Mu=30;
Kt=21000;
A = [   0    -Kt     0    0;
      1/Mu -Bs/Mu -1/Mu Bs/Mu;
        0     Ks     0   -Ks;
        0   Bs/Ms  1/Ms  -Bs/Ms; ]
B = [Kt;0;0;0]
t1=0:0.1:10;
y0=transpose(zeros(1,4))
[t,y1]=ode23(@functie_suspensie,t1,y0)