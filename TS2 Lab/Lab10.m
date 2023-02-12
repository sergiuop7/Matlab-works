%SENSITIVITY function (Noise and Disturbances)

%Noise sensitivity

k = 0.2; 
tm = 0.0015;
tfin = 1/135*8;
Hd = k*tf(9e4, [1 135 0], 'IODelay', tm);
step(feedback(Hd,1),tfin);
S = 1/(1+Hd);
bode(S);
