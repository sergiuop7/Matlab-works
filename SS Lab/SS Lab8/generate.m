% generate the signal x
T0 =1; w0 = 2*pi/T0;
Ts = 0.0005; t = -1:Ts:2;
x = t - 0.1 - round(t);
plot(t,x)

% estimate the coefficients
N = 8;
ak = fsAnalysis(x, t, T0, Ts, N);
