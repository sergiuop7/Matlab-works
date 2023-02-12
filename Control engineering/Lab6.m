clear variables

% PD controller

Hf = tf(3.5,[0.5 1 0])
sigma = 0.1;
zeta = abs(log(sigma))/sqrt((log(sigma))^2+pi^2)
N = 1/(4*sqrt(2)*zeta^2)
N = mag2db(N)
wt = 2.3;
wf = 2;
F = 1.84;
k = N-F
k = db2mag(k)
Hd = k * Hf
figure
bode(Hd)
hold on
%step(feedback(Hd,1))

ts = 3.5;
ts_star = 0.5;
Td = 0.5;
Tn = (ts_star/ts)*Td;
Vr = k * ts/ts_star;

Hpd = tf([Vr*Td Vr], [Tn 1]);
Hd2 = Hpd * Hf;
bode(Hd2)
hold off
figure
step(feedback(Hd2,1));

%%
clear all

% PID controller

hf = tf(3.5, [0.5, 1, 0]);
m = 0.15;
xi = abs(log(m))/sqrt(pi^2+log(m)^2);
A = 1/sqrt(2)/4/xi/xi;
Adb = 20*log10(A);
ts = 4.06; %using only P controller
ts1 = 0.8; % desired
Kp = 0.5346; %using P controller
Kp1 = Kp*ts/ts1; % new gain needed
Td = 0.5; % = Tf
Tn = Td*ts1/ts;
figure
bode(hf); hold on
hc = tf(Kp1*[Td, 1], [Tn, 1]);
hd = hc*hf;
bode(hd); hold off

cv1 = 15;
cv1db = 20*log10(cv1);
cvdb = 19.5; %read from PD
cv = 10^(cvdb/20);
wt = 7.6; %read from PD
wz = 0.1*wt;
wp = cv/cv1*wz;
Vr = Kp1*10^((cv1db-cvdb)/20);
Hpi = Vr*tf([1/wz,1],[1/wp,1]);

Hd = Hpi*hd/Kp1;
figure
bode(hd); hold on
bode(Hd); hold off

figure
step(feedback(hd,1));

figure
step(feedback(Hd,1));