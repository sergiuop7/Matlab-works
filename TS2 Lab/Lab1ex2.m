clc
clear variables

H = tf(2.2, [1e-3, 1]);
nyquist(H)

wc = 1.96e+03 %cut of freq

