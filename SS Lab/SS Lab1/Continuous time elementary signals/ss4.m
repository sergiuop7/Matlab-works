%pulse signal p(t) = ((t >=0) && t<e)) ? 1/e:0
e = 1/100;
t1 = -1;
t2 = 5;
tstep = 0.005;
t = t1:tstep:t2;
x = (1/e) * ((t>0)&(t<=e))
plot (t,x);
xlabel('t');
ylabel('p_\epsilon(t)');
title('Pulse function \epsilon = 1/100')

e = 1/100;
x = @(t)(1/e)*((t>0)&(t<=e));
t1 = -1;
ts = 5;
t = [t1,t2];
fplot(x,t,5000);
set(gca, 'FontSize', 14);
xlabel('t');
ylabel('p_\epsilon(t)');
axis([t1 t2 -0.1 1.1/e])
title('Pulse function \epsilon = 1/100')