%step signal u(t) = (t>=0) ? 1:0;
t1 = -2;
t2 = 6;
tstep = 0.001;
t = t1:tstep:t2;
x = (t>=0); %% rezulta un vector x
% in x sunt stocate valori de 0 sau 1, valorile expresiei
% (t>=0) pentru fiecare element al vectorului t
plot(t,x);
xlabel('t');
ylabel('u(t)');
title('Unit step signal');
axis([t1-tstep, t2+tstep, -0.1, 11]);
%% cod echivalent cu codul de mai sus,
% doar folosind declaratia de functie anonime si fplot
x = @(t) (t>=0);
t1 = -2; t2 = 6;
t = [t1,t2];
fplot(x,t);
xlabel('t');
ylabel('u(t)');
axis([t -0.1 1.1])
title('Unit step signal');
