clear variables

Ts = 0.1;
Ts1 = 1;
Ts2 = 2;
H = tf(1, [1, 5, 0])
%Ts
Hd1 = c2d(H, Ts, 'zoh')
Hd2 = c2d(H, Ts, 'tustin')

figure,
step(feedback(Hd1,1))
figure,
step(feedback(Hd2,1))

%Ts1
Hd1 = c2d(H, Ts1, 'zoh')
Hd2 = c2d(H, Ts1, 'tustin')

figure,
step(feedback(Hd1,1))
figure,
step(feedback(Hd2,1))

%Ts2
Hd1 = c2d(H, Ts2, 'zoh')
Hd2 = c2d(H, Ts2, 'tustin')

figure,
step(feedback(Hd1,1))
figure,
step(feedback(Hd2,1))


