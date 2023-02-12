clear variables

Hf = tf(2, [5 1 0])
raport = 1.05
delta_sigma = 1.05-1
sigma = 0.03
zeta = abs(log(sigma)) / sqrt((log(sigma))^2 + pi^2)
ts = 5
wn = 4/(zeta*ts)
cv_stea = 1.5
pc = delta_sigma/(2*zeta/wn - 1/cv_stea)
zc = pc/(1+delta_sigma)
cv2 = wn/(2*zeta)

1/cv2 - 1/zc + 1/pc
1/cv_stea

Ho = tf(wn^2, [1 2*zeta*wn wn^2]) * tf([pc pc*zc], [zc zc*pc]);
Hr = (1/Hf) * (Ho/(1-Ho));
figure
step(feedback(Hr*Hf,1)); grid;


%%
k = 2;
T = 5;
Hf1 = tf(k+0.2*k,[T 1 0]);
figure,
step(feedback(Hr*Hf1,1)); grid;

%%
Hf2 = tf(k-0.2*k,[T 1 0]);
figure,
step(feedback(Hr*Hf2,1)); grid;

%%
Hf3 = tf(k, [T+0.2*T 1 0]);
figure,
step(feedback(Hr*Hf3,1)); grid;

%%
Hf4 = tf(k, [T-0.2*T 1 0]);
figure,
step(feedback(Hr*Hf4,1)); grid;