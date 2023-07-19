clear variables

Kf = 7;
Tf = 10;
Hf = tf(Kf, [Tf 1 0])

figure
step(feedback(Hf,1))

tr = 35;
ov = 0.15;
zeta = abs(log(ov)) / sqrt((log(ov))^2 + pi^2)
wn = 4 / (zeta * tr)
Ho = tf(wn^2, [1 2*zeta*wn wn^2])
Hr = (1/Hf) * (Ho/(1-Ho))

figure
step(feedback(Hr*Hf,1))

figure
bode(Hr*Hf)

wb = wn * sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4))

t = 0 : 0.1 : 50;
ramp = 2 * t;
figure
lsim(feedback(Hf*Hr, 1), ramp, t)

