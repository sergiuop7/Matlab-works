clear variables

%%a
Hf = tf(2, [2 1 0])
ts = 25
ov = 0.1
zeta = abs(log(ov)) / sqrt((log(ov))^2 + pi^2)
wn = 4 / (zeta * ts)
Ho = tf(wn^2, [1 2*zeta*wn wn^2])
Hr = (1/Hf) * (Ho/(1-Ho))
figure
step(feedback(Hr*Hf,1))
cva = wn / (2*zeta)
wba = wn * sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4))


%%b
Hf = tf(2, [2 1 0])
ts = 5
ov = 0.10
zeta = abs(log(ov)) / sqrt((log(ov))^2 + pi^2)
wn = 4 / (zeta * ts)
Ho = tf(wn^2, [1 2*zeta*wn wn^2])
Hr = (1/Hf) * (Ho/(1-Ho))
figure
step(feedback(Hr*Hf,1))
cvb = wn / (2*zeta)
wbb = wn * sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4))


%%c
Hf = tf(2, [2 1 0])
ts = 2.5
ov = 0.04
zeta = abs(log(ov)) / sqrt((log(ov))^2 + pi^2)
wn = 4 / (zeta * ts)
Ho = tf(wn^2, [1 2*zeta*wn wn^2])
Hr = (1/Hf) * (Ho/(1-Ho))
figure
step(feedback(Hr*Hf,1))
cvc = wn / (2*zeta)
wbc = wn * sqrt(1-2*zeta^2+sqrt(2-4*zeta^2+4*zeta^4))

