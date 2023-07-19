clear variables;

Kf = 5; Tf = 5;

Hf = tf(Kf, [Tf, 1, 0]);

figure,
bode(Hf); grid; hold on; title('Bode for Hf');

%% PI controller

wc = 0.053; %% from bode from Hf where phase = -105
Ti = 4/wc;
k = 1/db2mag(38);
H_PI = k * tf([Ti,1], [Ti,0]);
figure,
bode(H_PI*Hf)

figure,
step(feedback(H_PI*Hf,1))

%% PD controller

beta = 0.12;
phase = rad2deg(atan((1-beta)/(2*sqrt(beta))))
k = sqrt(beta)/db2mag(-3.85); 
wc = 1.22; %% read from bode Hf where phase = -180-51+60
Td = 1/(wc*sqrt(beta));
H_PD = k * tf([Td,1], [beta*Td,1]);
figure,
bode(H_PD*Hf)

figure,
step(feedback(H_PD*Hf,1))