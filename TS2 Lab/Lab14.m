clear variables

%Handling state space model using Matlab

Ra=0.92; La=2e-3; Ke=0.2960; Kt=0.2939; Bf=3.35e-4;J=7.01e-4;Kpwm=38.4615;

A=[-Ra/La, -Ke/La, 0; Kt/J, -Bf/J, 0;0, 1, 0];
B=[Kpwm/La, 0; 0 -1/J; 0 0];
C=[0, 1, 0];
D=[0, 0];

Tmax=max(real(abs(1/eig(A))));
% the highest time constant
T_stationar=6*Tmax; 
pas=T_stationar/100;
t=0:pas:T_stationar;

ua=ones(1,length(t));Tl=ua*0;
u=[ua;Tl];

sist=ss(A,B,C,D);
[y,t,x]=lsim(sist,u,t,[0, 0, 0]);

figure,
plot(t,x); grid 
legend('i_a','\omega','\theta')
xlabel('Timp (sec.)');title('No load step response')


% BDC Motor under load variations conditions

t=0:1e-3:0.5;
ua=ones(1,length(t));
Tl1=0.1;Tl2=0.3;
Tl=0.4*(zeros(1,length(t))+t<=Tl2);
u=[ua;Tl];
figure,
plot(t,u');grid;
axis([0 0.5 -0.1 1.2]);
legend('u_a','T_L');
title('Semnalul de intrare');
xlabel('Timp (sec.)');


% Speed control

A=[-Ra/La, -Ke/La; Kt/J, -Bf/J];
B=[Kpwm/La, 0; 0 -1/J];
C=[0, 1];
D=[0, 0];

sist=ss(A,B,C,D);
t=0:1e-3:0.05;
u=[ones(1,length(t));zeros(1,length(t))];
Fx=inv((C*inv(-A)*B(:,1)));
[y,t,x]=lsim(sist,u*Fx,t);
figure,
plot(t,x);
legend('i_a','\omega');grid

p=eig(A)+eig(A)/10;
Kx=acker(A,B(:,1),p)