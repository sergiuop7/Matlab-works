clear variables

%% PI Controller
Hf = tf(2, conv([10,1], [5,1]), 'IODelay', 3)
figure,
bode(Hf);
wc = 0.142;
mag = db2mag(-0.583);
Ti = 4/wc;
kp = 1/mag;
figure,
Hc = tf([kp*Ti, kp], [Ti, 0])
bode(Hf*Hc);
figure,
step(feedback(Hf*Hc,1))

%% PD Controller

beta = 0.1;
Hc_phase = atand((1-beta)/(2*sqrt(beta)));
phase_at_wc = -180 - Hc_phase + 50;
wc = 0.318;
mag = db2mag(-9.9);
td = 1/wc/sqrt(beta);
kp = sqrt(beta)/mag;
Hc = kp * tf([td,1], [td*beta,1]);
figure,
bode(Hc*Hf);
figure,
step(feedback(Hf*Hc,1))
