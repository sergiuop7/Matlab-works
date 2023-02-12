clear variables

% P controller

Hf = tf(3.5,[0.5 1 0])
sigma = 0.1;
zeta = abs(log(sigma))/sqrt((log(sigma))^2+pi^2)
N = 1/(4*sqrt(2)*zeta^2)
N = mag2db(N)
figure
bode(Hf)
hold on
wt = 2.3;
wf = 2;
F = 1.84;
k = N-F
k = db2mag(k)
Hd = k * Hf
bode(Hd)
hold off
figure
step(feedback(Hd,1))


%% PI Controller

bode(Hd)
hold on
wt = 1.22;
wz = 0.1*wt
cv = 2.13;
cv_star = 10;
cv_star = mag2db(cv_star)
wp = (cv/cv_star)*wz

Tz = 1/wz
Tp = 1/wp

kPI = k * db2mag(cv_star - cv)

Hpi = kPI * tf([Tz,1],[Tp,1])
Hd2 = Hpi * Hf

bode(Hd2)
hold off
