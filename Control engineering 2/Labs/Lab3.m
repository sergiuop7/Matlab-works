clear variables

%% Kalman

Hs = tf(1,[3.34,1],'iodelay',1.86)
Ts = 0.5;
Hz = c2d(Hs, Ts, 'zoh')

B = [0 0 0 0 Hz.num{:}];
A = [Hz.den{:} 0 0 0 0];

k = 1/sum(Hz.num{:});

P = k*B;
Q = k*A

Hr = tf(Q,[1,zeros(1,length(B)-1)]-P,Ts);

figure,
step(feedback(Hr*Hz,1));


%% Dahlin

Hp = tf(0.2, conv([50,1], [3,1]), 'iodelay', 2)
Ts = 1;
Hz = c2d(Hs, Ts, 'zoh')

lambda = 25;
N = 2/Ts; %tm/Ts

B = [Hz.num{:}]
A = [Hz.den{:}]

