clear variables

H = tf(40, [1 0])
figure
bode(H); grid; shg;
w = logspace(0,3,1e3);
figure
bode(H, w)

% u = sin(4*t) 
t = 0 : 0.1 : 10;
u = sin(40*t);
lsim(H, u, t);

%%
w = 56;
T = 2*pi/w;
t = linspace(0,10*T, 1e3);
lsim(tf(40,[1 0]), sin(w*t), t);

%%
H = tf(1, [0.02, 1])
bode(H)