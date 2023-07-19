clear variables

Kf = 5; 
Tf = 5;
H = tf(Kf, [Tf 1 0]);
[numH, denH] = tfdata(H,'v');

% Good and bad 
Pg = H;
Pb = 1;

% Invert good part
Pg_inv = inv(Pg);

% Filter 
s = tf('s');
lambda = 0.8;
F = 1 / (lambda*s + 1)^2;

% Controller 
C = minreal((Pg_inv * F) / (1 - Pb * F));
[numC, denC] = tfdata(C, 'v');

step(feedback(H * C, 1))
