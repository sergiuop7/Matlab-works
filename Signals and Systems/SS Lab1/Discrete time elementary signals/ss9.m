%unit impulse sequence delta[n] = (n==0) ? 1:0;
n1 = -5; n2 = 10; n = n1:n2;
x = (n==0);
stem(n,x);
xlabel('n'); ylabel('\delta_n');
title('Unit impulse sequence')
axis([n1 n2 -0.1 1.1]);

n1 = -5; n2 = 10; n = n1:n2;
x = @(n)(n==0);
stem(n, x(n));
xlabel('n'); ylabel('\delta_n');
title('Unit impulse sequence')
