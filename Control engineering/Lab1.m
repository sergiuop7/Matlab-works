clear variables

%%ii
Hf = tf(5, [2,1])
Hc = tf([2,2], [1,0])
Hd = Hc * Hf
step(feedback(Hd,1))

