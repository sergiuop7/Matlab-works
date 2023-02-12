clear variables

close all;
%% 3.1.1. Discretize the controller 𝐻𝑐(𝑠)=𝑘/𝑠 using tustin(bilinear) transformation.

T = 5e-2; %sampling period
k = 1;
H_c = tf(k, [1 0]);
H_c_discrete = c2d(H_c, T, 'tustin')

%% 3.1.2. Discretize the process H_p(s) = 2400 / ((s + 20) * (s + 40)) using zero order hold method.

H_p = tf(2400, [1 60 800]);
H_p_discrete = c2d(H_p, T, 'zoh')

%% 3.1.3. Use the zpk function to write on your notebook the open loop transfer function.

H_ol = zpk(H_c_discrete * H_p_discrete)

%% 3.1.4. Analyze the stability of the closed loop system depending on ∈ (0, ∞); draw on your notebook the root locus
%and mention the obtained values of k directly on the graphics.

figure,
rlocus(H_ol)


