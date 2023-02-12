clear variables

close all;
%% 1.Discretize the controller 𝐻𝑐(𝑠)=𝑘/𝑠 using tustin(bilinear) transformation.

T = 5e-2; %sampling period
k = 1;
H_c = tf(k, [1 0]);
H_c_discrete = c2d(H_c, T, 'tustin')