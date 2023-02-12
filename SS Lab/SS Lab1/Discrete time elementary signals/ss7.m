%unit step sequence u[n] = (n>0) ? 1:0;
n1 = -5; n2 = 10;
n = n1:n2;
x = (n>=0);
stem(n, x);
xlabel('n'); ylabel('u[n]');
title('Unit step sequence')
axis([n1 n2 -0.1 1.1]);

n1 = -5; n2 = 10; n = n1:n2;
x = @(n) (n>=0);
stem(n, x(n));
xlabel('n'); ylabel('u[n]');
title('Unit step sequence')
