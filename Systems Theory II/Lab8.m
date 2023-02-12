k = 2;
H = k*(9e4) * tf(1, [1 135 0]);
subplot(121);
nyquist(H); grid; shg %open loop
hold on; cm(10); axis([-3 0 -2 3]); grid; hold off

subplot(122);
step(feedback(H,1)); grid; shg
%%

syms xi M
theta = solve(M - 1/(2*xi*sqrt(1-xi^2)), xi)
df = simplify(theta)
text(0.5, 0.5, latex(df(1,1)), 'interpreter', 'latex')

%%
MdB = 7.2
M = 10^(MdB/20)

sdf = roots([-4 0 4 0 -1/M^2])
df = sdf(4);
sigma = round(exp(-pi*df/sqrt(1-df^2)) * 100)

