clc
clear variables

H = tf(4, [1,0]);
nyquist(H)
wc = 4 %cutoff freq

%% Simulate the response to a sinewave with w = wc
wc = 4;
w = wc;
t = 0:0.01:10;
lsim(H, sin(w*t), t)

%% Simulate the response to a sinewave with w = wc/10 (low freq zone)
wc = 4;
w = wc / 10;
t = 0:0.01:50;
lsim(H, sin(w*t), t)

%% Simulate the response to a sinewave with w = wc*100 (high freq zone)
wc = 4;
w = wc * 4e5; Tu = 2*pi/w;
t = 0:Tu/100:10*Tu;
lsim(H, sin(w*t), t)
grid; shg 
axis([0,max(t),-0.55*1e-4,0.55e-4])