
% generate the signal x
T0 =1; w0 = 2*pi/T0;
Ts = 0.0005; t = -1:Ts:2;
x = t - 0.1 - round(t);
plot(t,x)

% estimate the coefficients
N = 100;
ak = fsAnalysis(x, t, T0, Ts, N);

a0 = ak(N+1);
ksi0 = 0;
Ak = abs(ak(N+2:end));
ksi = angle(ak(N+2:end));

% signal synthesis
x_est = a0*ones(size(t));
for k = 1:N
    x_est = x_est + 2*Ak(k)*cos(w0*k*t+ksi(k));
end
figure; plot(t,x,'b',t,x_est,'r')
xlabel('t'); legend('x(t)', 'x_{est}(t)');

% plot of amplitude, phase and power spectrum
n0 = 0:N;
figure, subplot(3,1,1); stem(n0,[a0, Ak], '.')
legend('Amplitude spectrum')

subplot(3,1,2), stem(n0,[ksi0, ksi],'.g')
legend('Phase spectrum')

subplot(3,1,3), stem(n0,[a0^2, (Ak.^2)/2], '.r')
xlabel('n'), legend('Power spectrum')