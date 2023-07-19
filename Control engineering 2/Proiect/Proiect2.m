%% P controller
clear variables;

Kf = 5; Tf = 5;

Hf = tf(Kf, [Tf, 1, 0]);

figure,
bode(Hf); grid; hold on; title('Bode for Hf');
sigma = 0.04;
wf = 1 / Tf;

zeta = (abs(log(sigma))) / sqrt(log(sigma) * log(sigma) + pi^2);

A_numeric = 1 / (4  * zeta^2);

N = mag2db(A_numeric);

F = 25; % from bode where wf

k_dB = N - F;
k_numeric = db2mag(k_dB);

bode(k_numeric * Hf); hold off; title('Bode for P controller');
legend('Hf', 'k * Hf');

figure,
step(feedback(k_numeric * Hf, 1));

Hd = k_numeric * Hf;

% numeric
wt = 0.996; %where mag = 0 
wn = 2 * zeta * wt;
tr = 4 / (zeta * wn);

% from step response
ts = 35.9;
% tr not good => PD

%% PD controller

ts_star = 1;
VR = k_numeric * (ts / ts_star);
Td = Tf; % = Tf
Tn = (ts_star / ts) * Td; % formula

H_PD = VR * tf([Td 1], [Tn 1]);
Hd2 = H_PD * Hf;
figure,
bode(k_numeric * Hf);hold on;
bode(Hd2);
legend("P", "PD");

figure,
step(feedback(Hd2, 1))

% overshoot checked 9%
% ts checked 5


t = 0:0.1:10;
figure,
lsim(t,t, feedback(Hd2,1));

wt2 = 0.848;
cv_star = 3;
wz = wt2/10;
cv = 1/0.2; % = 5 >=3 checked
wb = 5.5; % <=15 read from bode PD where mag = -3 db