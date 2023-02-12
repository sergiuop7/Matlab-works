clear variables

Hf = tf(1, [2 1]);
HR1 = tf(2);
HR2 = tf(2, [1 0]);
HR3 = tf(2, [1 0 0]);

figure,
step(feedback(HR1*Hf,1));
figure,
step(feedback(HR2*Hf,1));
figure,
step(feedback(HR3*Hf,1));