clear variables

k=3; tau_m=0.2; w=logspace(-1,3,1e5);
H=tf(k*[-5 1],[1 0], 'iodelay',tau_m);
figure,
nyquist(H,w); shg;
%%
k=3; H_ol=k*H
nyquist(H_ol,w); shg
nyquist(H_ol)
%%
%H_cl=feedback(H_ol,1); t=linspace(0,4,1e8); step(H_cl,t);