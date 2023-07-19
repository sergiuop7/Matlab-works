clear variables

Kf = 5; Tf = 5;

Hf = tf(Kf, [Tf 1 0]);

Ts = 10;
tau = 0;
lambda = (Ts-tau) / 4;

Ho = tf(1, [lambda 1]);
Hfd = c2d(Hf, lambda, 'zoh');
Hod = c2d(Ho, lambda, 'zoh');

Hr = Hod / Hfd / (1 - Hod);
figure, step(feedback(Hr * Hfd,1));
