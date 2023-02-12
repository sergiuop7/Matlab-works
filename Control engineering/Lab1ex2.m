clear variables

%%ii
Hf = tf(5, [2,1])
H_R1 = tf(2)
H_R2 = tf([2,2], [1,0])
Hop1 = 1/(1+H_R1*Hf)
Hop2 = 1/(1+H_R2*Hf)
figure,
step(Hop1)
figure,
step(Hop2)