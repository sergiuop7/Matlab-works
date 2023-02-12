clear variables

Hd = tf([-1 -5], [1 4 8])

figure();
rlocus(Hd)

figure();
step(feedback(10*Hd, 1));