clear variables

Hp = tf(2, conv([1,1], [10,1]),'iodelay',1)
bode(Hp)

%a
%% PI Controller
wc = 0.298;
mag = db2mag(-4.3);
Ti = 4/wc;
kp = 1/mag;
figure,
Hcpi = tf([kp*Ti, kp], [Ti, 0])
bode(Hp*Hcpi);
figure,
step(feedback(Hp*Hcpi,1))

%% PD Controller
beta = 0.1;
Hc_phase = atand((1-beta)/(2*sqrt(beta)));
phase_at_wc = -180 - Hc_phase + 60;
wc = 0.875;
mag = db2mag(-15.4);
td = 1/wc/sqrt(beta);
kp = sqrt(beta)/mag;
Hcpd = kp * tf([td,1], [td*beta,1]);
figure,
bode(Hcpd*Hp);
figure,
step(feedback(Hp*Hcpd,1))

zpk(Hcpi)
zpk(Hcpd)

%b
Ts1=6;
Ts2=1.8;
Hd1 = c2d(Hcpi, Ts1, 'zoh')
Hd2 = c2d(Hcpd, Ts2, 'zoh')


