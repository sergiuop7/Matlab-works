clear variables
close all

Kf = 5;
Tf = 5;
Hf = tf(Kf, [Tf 1 0]);
Tsigma = 1;

%% Metoda simetriei

Hds = tf([4*Tsigma 1], [8*Tsigma^2*Tsigma^3 8*Tsigma^2 0 0]);
Hcs = zpk(minreal(Hds/Hf))
H0s = feedback(Hf * Hcs, 1) % closed loop
figure,
step(H0s); title('Metoda simetriei');
grid;
t = 0:0.1:50;
figure,
lsim(H0s, t, t); title('Metoda simetriei'); grid;


%% Metoda modulului

Hdm = tf(1, [2*Tsigma^2 2*Tsigma 0]);
Hcm = zpk(minreal(Hdm/Hf))
H0m = feedback(Hf * Hcm, 1) % closed loop
figure,
step(H0m); title('Metoda modulului'); 
grid;

ov = 0.432;
ts = 8 * Tsigma;
e_stv = 2 * Tsigma;
cv = 1/e_stv;

t = 0:0.1:50;
figure,
lsim(H0m, t, t); title('Metoda modulului');
grid;